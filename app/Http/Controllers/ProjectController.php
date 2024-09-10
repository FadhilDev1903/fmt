<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Project;
use App\Models\Projectdetail;
use App\Models\User;
use DateTime;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables as DataTables;

class ProjectController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $menu = Menu::with('children')->whereNull('parent_id')->where('roles', 'LIKE', '%'.auth()->user()->status.'%')->get();
        $user = User::select('id', 'name', 'username', 'phone', 'email', 'country')
            ->where('country', session('country_user'))
            ->where('status', 'spv')
            ->get();
        $data = [
            'title' => "Project",
            'menu'  => $menu,
            'user'  => $user,
        ];
        return view('user.project', $data);
    }

    public function createProject()
    {
        $menu = Menu::with('children')->whereNull('parent_id')->where('roles', 'LIKE', '%'.auth()->user()->status.'%')->get();
        $project = Project::select('id', 'name')
            ->where('country', session('country_user'))
            ->get();
        $user = User::select('id', 'name', 'username', 'phone', 'email', 'country')
            ->where('country', session('country_user'))
            ->get();

        $data = [
            'title' => "Project",
            'menu'  => $menu,
            'project'  => $project,
            'user'  => $user,
        ];
        return view('user.project-create', $data);
    }

    public function allData()
    {
        $projects = Project::select('id', 'name', 'cost_center', 'wbs_number', 'remark', 'startdate', 'enddate')->get();

        // Encrypt the IDs
        $encryptedProjects = $projects->map(function ($project) {
            $project->ids = encrypt($project->id);
            $project->startdate = date('d/m/Y', strtotime($project->startdate));
            $project->enddate = date('d/m/Y', strtotime($project->enddate));
            return $project;
        });

        // Tambahkan nomor urut ke setiap proyek
        $counter = 1;
        foreach ($encryptedProjects as $project) {
            $project->no = $counter++;
        }

        return DataTables::of($encryptedProjects)->make(true);
    }


    public function getData($id)
    {
        try {
            // Decrypt the ID
            $decryptedId = decrypt($id);

            // Retrieve project data using $decryptedId
            $getProject = Project::find($decryptedId);
            $getProjectDetail = Projectdetail::select('projectdetails.*', 'users.name as user_name')
                ->join('users', 'projectdetails.user_id', '=', 'users.id')
                ->where('projectdetails.project_id', $decryptedId)
                ->get();
            $menu = Menu::with('children')->whereNull('parent_id')->where('roles', 'LIKE', '%'.auth()->user()->status.'%')->get();
            $project = Project::select('id', 'name')
                ->where('country', session('country_user'))
                ->get();
            $user = User::select('id', 'name', 'username', 'phone', 'email', 'country')
                ->where('country', session('country_user'))
                ->get();

            if ($getProject) {
                $getProject->budget = "Rp. " . number_format($getProject->budget, 2, ',', '.');
                $data = [
                    'title' => "Project",
                    'menu'  => $menu,
                    'project'  => $project,
                    'getProject'  => $getProject,
                    'getProjectDetail'  => $getProjectDetail,
                    'user'  => $user,
                ];
                return view('user.project-create', $data);
            } else {
                // If project not found, return 404
                return response()->json(['message' => 'Project not found'], 404);
            }
        } catch (DecryptException $e) {
            // Handle decryption failure
            return response()->json(['error' => 'Decryption failed'], 500);
        }
    }

    public function createData(Request $request)
    {
        // Validasi form
        $rules = [
            'project_name' => 'required|max:12',
            'remarks' => 'required',
            'budget' => 'required',
            'start_date' => 'required|date_format:d/m/Y',
            'end_date' => 'required|date_format:d/m/Y',
            'project_type' => 'required|string',
        ];
        if ($request->input('project_type') === 'adhoc') {
            $rules['wbs_number'] = 'required|numeric';
        }
        $validator = Validator::make($request->all(), $rules);
        // Cek jika validasi gagal
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
        }
        // Create a DateTime object from the original string, using the 'd/m/Y' format
        $dateTimeStart = DateTime::createFromFormat('d/m/Y', $request->start_date);
        $dateTimeEnd = DateTime::createFromFormat('d/m/Y', $request->end_date);

        // Format the DateTime object as 'Y-m-d'
        $formattedDateStart = $dateTimeStart->format('Y-m-d');
        $formattedDateEnd = $dateTimeEnd->format('Y-m-d');
        // Buat koleksi baru
        $project = Project::create([
            'parent_id' => $request->parent_project,
            'wbs_number' => $request->wbs_number,
            'cost_center' => $request->cost_center,
            'name' => $request->project_name,
            'description' => $request->project_description,
            'remark' => $request->remarks,
            // 'manage' => $request->manage,
            'manage' => "-",
            'budget' => (float) str_replace(",", ".", str_replace(["Rp. ", "."], "", $request->budget)),
            'startdate' => $formattedDateStart,
            'enddate' => $formattedDateEnd,
            'country' => session('country_user')
        ]);
        $project->save();

        foreach ($request->users as $userData) {
            Projectdetail::create([
                'project_id' => $project->id,
                'user_id' => $userData['id'],
                'salary' => $userData['salary'],
                'country' => session('country_user'),
            ]);
        }

        return response()->json([
            'redirect_url' => route('project'),
            'message' => "Create adhoc success",
        ]);
    }

    public function updateData(Request $request)
    {
        $id = $request->id_project;
        if ($id) {
            // Validasi form
            $validator = Validator::make($request->all(), [
                'project_name' => 'required',
                'remarks' => 'required',
                // 'manage' => 'required',
                'budget' => 'required',
                'start_date' => 'required|date_format:d/m/Y',
                'end_date' => 'required|date_format:d/m/Y',
            ]);

            // Cek jika validasi gagal
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
            }
            // Create a DateTime object from the original string, using the 'd/m/Y' format
            $dateTimeStart = DateTime::createFromFormat('d/m/Y', $request->start_date);
            $dateTimeEnd = DateTime::createFromFormat('d/m/Y', $request->end_date);

            // Format the DateTime object as 'Y-m-d'
            $formattedDateStart = $dateTimeStart->format('Y-m-d');
            $formattedDateEnd = $dateTimeEnd->format('Y-m-d');

            $project = Project::findorfail($id);
            $project->update([
                'parent_id' => $request->parent_project,
                'wbs_number' => $request->wbs_number,
                'cost_center' => $request->cost_center,
                'name' => $request->project_name,
                'description' => $request->project_description,
                'remark' => $request->remarks,
                // 'manage' => $request->manage,
                'budget' => (float) str_replace(",", ".", str_replace(["Rp. ", "."], "", $request->budget)),
                'startdate' => $formattedDateStart,
                'enddate' => $formattedDateEnd,
                'country' => session('country_user')
            ]);
            $projectdetail = Projectdetail::where('project_id', $id);
            $projectdetail->delete();
            // foreach ($request->users as $userData) {
            //     foreach ($projectdetail as $detail) {
            //         $detail->update([
            //             'user_id' => $userData['id'],
            //             'salary' => $userData['salary']
            //         ]);
            //     }
            // }
            foreach ($request->users as $userData) {
                Projectdetail::create([
                    'project_id' => $id,
                    'user_id' => $userData['id'],
                    'salary' => $userData['salary'],
                    'country' => session('country_user'),
                ]);
            }
        }

        return response()->json([
            'redirect_url' => route('project'),
            'message' => "Update project success",
        ]);
    }
}

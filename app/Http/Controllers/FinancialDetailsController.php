<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Menu;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Models\FinancialDetailModel;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class FinancialDetailsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = User::all();
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();
        $title = 'Financial Details';

        if ($request->ajax()) {
            $data = FinancialDetailModel::with('user')->orderBy('id', 'DESC');
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = '<a href="" class="btn btn-warning btnEditFinance" data-toggle="modal" data-target="#modal-edit-financialDetails" data-id="' . $data->id . '"><i class="fas fa-edit m-auto"></i></a>&nbsp;';
                    $btn .= '<a href="" class="btn btn-danger btnDeleteFinance" data-id="' . $data->id . '"><i class="fas fa-trash m-auto"></i></a>&nbsp;';

                    return $btn;
                })
                ->addColumn('role', function ($data) {
                    $role = '';

                    if ($data->user->status == 'adm') {
                        $role = 'Manager';
                    } elseif ($data->user->status == 'col') {
                        $role = 'Casual';
                    } else {
                        $role = $data->user->status;
                    }

                    return $role;
                })
                ->addColumn('contract', function ($data) {
                    $contract = '';
                    $ex = explode('.', $data->filename);
                    if ($ex[count($ex) - 1] == 'pdf') {
                        $contract = '<a href="' . route('financial_details.show', $data->id) . '" class="btn btn-danger" target="_blank"><i class="fas fa-file-pdf m-auto"></i></a>';
                    } else {
                        $contract = '<a href="' . route('financial_details.show', $data->id) . '" class="btn btn-primary" target="_blank"><i class="fas fa-file-word m-auto"></i></a>';
                    }

                    return $contract;
                })
                ->editColumn('dailyfee', function ($data) {
                    $dailyfee = number_format($data->dailyfee, 2, ',', '.');

                    return $dailyfee;
                })
                ->editColumn('joindate', function ($data) {
                    $join = '<span>Join : ' . Carbon::parse($data->joindate)->format('d/m/y') . '</span><hr>';
                    $join .= '<span>End : ' . Carbon::parse($data->endcontract)->format('d/m/y') . '</span>';

                    return $join;
                })
                ->editColumn('status', function ($data) {
                    $status = '';
                    if ($data->status == '0') {
                        $status = '<span class="badge bg-danger text-white shadow-sm w-100">Non-Active</span>';
                    } else {
                        $status = '<span class="badge bg-success text-white shadow-sm w-100">Active</span>';
                    }
                    return $status;
                })
                ->rawColumns(['action', 'status', 'role', 'contract', 'joindate'])
                ->make(true);
        }
        return view('user.financial_detail.index', compact('user', 'menu', 'title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required',
            'contract' => 'required|mimes:pdf,doc,docx',
            'location' => 'required',
            'end_date' => 'required',
            'start_date' => 'required',
            'dailyfee' => 'required',
            'user_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $file = $request->contract;
        $name = $file->getClientOriginalName();
        $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
        $path = $file->move(public_path('assets/contract'), $fileName);
        $data = [
            'user_id' => $request->user_id,
            'location' => $request->location,
            'dailyfee' => $request->dailyfee,
            'joindate' => Carbon::createFromFormat('d/m/Y', $request->start_date),
            'endcontract' => Carbon::createFromFormat('d/m/Y', $request->end_date),
            'contract' => 'public/assets/contract/' . $fileName,
            'filename' => $name,
            'status' => $request->status,
        ];

        $finance = FinancialDetailModel::create($data);
        return response()->json(['msg' => 'Data Saved Successfully', 'status' => 200]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $finance = FinancialDetailModel::find($id);

        $exs = explode('public/', $finance->contract);
        return Response::download(public_path($exs[1]), $finance->filename);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $finance = FinancialDetailModel::find($id);
        $finance['start_dateEdt'] = Carbon::parse($finance->joindate)->format('d/m/Y');
        $finance['end_dateEdt'] = Carbon::parse($finance->endcontract)->format('d/m/Y');

        return response()->json($finance);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    public function update_contract(Request $request)
    {
        $data = $request->all();
        $result = FinancialDetailModel::find($request->id);
        if ($request->contract != null) {
            $exs = explode('public/', $result->contract);
            if (File::exists(public_path($exs[1]))) {
                File::delete(public_path($exs[1]));
            }
            $file = $request->contract;
            $name = $file->getClientOriginalName();
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            $path = $file->move(public_path('assets/contract'), $fileName);
            $data['filename'] = $name;
            $data['contract'] = 'public/assets/contract/' . $fileName;
        }
        $result->update($data);
        return response()->json(['msg' => 'Data Updated Successfully', 'status' => 200]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        FinancialDetailModel::destroy($id);
        return response()->json(['msg' => 'Data Deleted Successfully', 'status' => 200]);
    }
}

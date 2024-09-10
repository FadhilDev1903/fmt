<?php

namespace App\Http\Controllers;

use DateTime;
use Carbon\Carbon;
use App\Models\Menu;
use App\Models\Event;
use App\Models\Expense;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables as DataTables;

class ExpensesController extends Controller
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
    public function claim()
    {
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();
        $project = Project::select('projects.id as id', 'projects.name as name')
            ->join('projectdetails', 'projectdetails.project_id', '=', 'projects.id')
            ->where('projects.country', session('country_user'))
            ->where('projectdetails.user_id', decrypt(session('user_id')))
            ->get();
        $data = [
            'title' => 'Claim',
            'menu' => $menu,
            'project' => $project,
        ];
        return view('user.claim-expenses', $data);
    }

    public function createClaimData(Request $request)
    {
        // dd($request->project_name[0]);
        // Validasi form
        $validator = Validator::make($request->all(), [
            'claim_date' => 'required',
            'department' => 'required',
            'claim_type' => 'required',
            'expense_category' => 'required',
            'expense_item' => 'required',
            'project_name' => 'required',
            'amount_currency' => 'required',
            // 'project_percentage' => 'required',
            'bukti_files' => 'required|image|mimes:jpeg,png,jpg,gif',
        ]);

        // // Cek jika validasi gagal
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Validation failed!'); // Mengembalikan ke halaman sebelumnya dengan pesan error
        }
        // Buat koleksi baru
        //upload files
        if ($request->hasFile('bukti_files')) {
            $file = $request->file('bukti_files');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            // $file->move(public_path('assets/img'), $fileName);
            $w = Image::make($file)->width();
            $h = Image::make($file)->height();
            Image::make($file)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileName, 10);
        } else {
            return back()->with('error', 'No file uploaded.');
        }
        // Create a DateTime object from the original string, using the 'd/m/Y' format
        $dateTimeStart = DateTime::createFromFormat('d/m/Y', $request->claim_date);

        // Format the DateTime object as 'Y-m-d'
        $formattedDateStart = $dateTimeStart->format('Y-m-d');
        for ($i = 0; $i < count($request->project_name); $i++) {
            $data = [
                'claim_date' => $formattedDateStart,
                'user_id' => decrypt($request->id_employee_name),
                'department' => $request->department,
                'claim_type' => $request->claim_type,
                'category' => $request->expense_category,
                'item' => $request->expense_item,
                'remarks' => $request->remarks,
                'currency' => $request->currency,
                'project' => $request->project_name[$i],
                'amount' => (float) str_replace(',', '.', str_replace(['Rp. ', '.'], '', $request->amount_currency)),
                // 'project_percentage' => $request->project_percentage,
                'image' => $fileName,
            ];
            $expense = Expense::create($data);
        }

        return redirect()->route('claim')->with('success', 'Created successfully!');
    }

    public function timesheet()
    {
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();
        $events = Event::where('user_id', decrypt(session('user_id')))->get();
        $data = [
            'title' => 'Timesheet',
            'menu' => $menu,
            'events' => $events,
        ];
        return view('user.timesheet-expenses', $data);
    }

    public function createTimesheetData(Request $request)
    {
        // Validate CSRF token
        $request->validate([
            'schedule' => 'required|array', // Ensure 'schedule' exists and is an array
            'schedule.*.title' => 'required|string',
            'schedule.*.start' => 'required|date',
            'schedule.*.end' => 'required|date',
        ]);

        // Get the 'schedule' data from the request
        $schedule = $request->input('schedule');

        // Process each event in the schedule
        foreach ($schedule as $eventData) {
            $startDateTime = new DateTime($eventData['start']);
            $endDateTime = new DateTime($eventData['end']);
            $existingEvent = Event::where('id', $eventData['id'])->first();

            if ($existingEvent) {
                // Update existing event
                $existingEvent->update([
                    'title' => $eventData['title'],
                    'start' => $startDateTime->format('Y-m-d H:i:s'),
                    'end' => $endDateTime->format('Y-m-d H:i:s'),
                ]);
            } else {
                // Create new event
                Event::create([
                    'user_id' => decrypt(session('user_id')),
                    'title' => $eventData['title'],
                    'start' => $startDateTime->format('Y-m-d H:i:s'),
                    'end' => $endDateTime->format('Y-m-d H:i:s'),
                ]);
            }
        }

        // Return a response indicating success
        return response()->json(['message' => 'Events saved successfully'], 201);
    }

    public function myExpenses()
    {
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();

        $data = [
            'title' => 'My Expense',
            'menu' => $menu,
        ];
        return view('user.myexpenses', $data);
    }

    public function allDataExpenses()
    {
        if (session('status_user') == 'Collector') {
            $expense = Expense::select('expenses.id', 'users.name as employee_name', 'expenses.claim_date', 'projects.name as project_name', 'expenses.claim_type', 'expenses.item as expense_item', 'expenses.remarks', 'expenses.amount', 'expenses.image', 'expenses.approved_status', 'expenses.approved_by', 'expenses.approved_at')
                ->join('users', 'users.id', '=', 'expenses.user_id', 'left')
                ->join('projects', 'projects.id', '=', 'expenses.project', 'left')
                ->where('expenses.user_id', decrypt(session('user_id')))
                ->get();
        } elseif (session('status_user') == 'Supervisor') {
            $expense = Expense::select('expenses.id', 'users.name as employee_name', 'expenses.claim_date', 'projects.name as project_name', 'expenses.claim_type', 'expenses.item as expense_item', 'expenses.remarks', 'expenses.amount', 'expenses.image', 'expenses.approved_status', 'expenses.approved_by', 'expenses.approved_at')
                ->join('users', 'users.id', '=', 'expenses.user_id', 'left')
                ->join('projects', 'projects.id', '=', 'expenses.project', 'left')
                ->where('users.spv_id', decrypt(session('user_id')))
                ->get();
        } else {
            $expense = Expense::select('expenses.id', 'users.name as employee_name', 'expenses.claim_date', 'projects.name as project_name', 'expenses.claim_type', 'expenses.item as expense_item', 'expenses.remarks', 'expenses.amount', 'expenses.image', 'expenses.approved_status', 'expenses.approved_by', 'expenses.approved_at')->join('users', 'users.id', '=', 'expenses.user_id', 'left')->join('projects', 'projects.id', '=', 'expenses.project', 'left')->get();
        }

        // Encrypt the IDs
        $encryptedexpense = $expense->map(function ($expense) {
            $expense->ids = encrypt($expense->id);
            $expense->claim_date = date('d/m/Y', strtotime($expense->claim_date));
            $expense->amount = 'Rp ' . number_format($expense->amount, 2, ',', '.');
            return $expense;
        });

        // Tambahkan nomor urut ke setiap proyek
        $counter = 1;
        foreach ($encryptedexpense as $expense) {
            $expense->no = $counter++;
        }

        return DataTables::of($encryptedexpense)->make(true);
    }

    public function expenseApprove(Request $request)
    {
        // Lakukan operasi approve untuk expense dengan ID tertentu
        $expenseId = $request->input('expense_id');

        $id = decrypt($expenseId);

        $expense = Expense::findorfail($id);
        $expense->update([
            'approved_status' => 'Approve',
            'approved_by' => session('name_user'),
            'approved_at' => date('Y-m-d'),
        ]);

        // Kembalikan respons JSON
        return response()->json(['message' => 'Expense approved']);
    }

    public function expenseReject(Request $request)
    {
        // Lakukan operasi reject untuk expense dengan ID tertentu
        $expenseId = $request->input('expense_id');

        $id = decrypt($expenseId);

        $expense = Expense::findorfail($id);
        $expense->update([
            'approved_status' => 'Reject',
            'approved_by' => session('name_user'),
            'approved_at' => date('Y-m-d'),
        ]);

        // Kembalikan respons JSON
        return response()->json(['message' => 'Expense rejected']);
    }

    public function expenseApproveAll(Request $request)
    {
        // Lakukan operasi approve untuk semua expense yang dipilih
        $expenseIds = $request->input('all_expenses');

        foreach ($expenseIds as $expenseId) {
            $id = decrypt($expenseId);

            $expense = Expense::findorfail($id);
            $expense->update([
                'approved_status' => 'Approve',
                'approved_by' => session('name_user'),
                'approved_at' => date('Y-m-d'),
            ]);
        }

        // Kembalikan respons JSON
        return response()->json(['message' => 'All expenses approved successfully']);
    }

    public function expenseRejectAll(Request $request)
    {
        // Lakukan operasi reject untuk semua expense yang dipilih
        $expenseIds = $request->input('all_expenses');

        foreach ($expenseIds as $expenseId) {
            $id = decrypt($expenseId);

            $expense = Expense::findorfail($id);
            $expense->update([
                'approved_status' => 'Reject',
                'approved_by' => session('name_user'),
                'approved_at' => date('Y-m-d'),
            ]);
        }

        // Kembalikan respons JSON
        return response()->json(['message' => 'All expenses rejected successfully']);
    }

    public function checkDateEvent(Request $request)
    {
        $event = Event::where('start', 'LIKE', $request->start . '%')->get();
        $check = false;
        $date = Carbon::createFromFormat('Y-m-d H:i:s', $request->startTime);
        // dd(date($request->startTime));
        if ($event) {
            foreach ($event as $value) {
                $start = Carbon::createFromFormat('Y-m-d H:i:s', $value->start);
                $end = Carbon::createFromFormat('Y-m-d H:i:s', $value->end);
                if ($date->greaterThanOrEqualTo($start) == true && $date->lessThanOrEqualTo($end) == true) {
                    $check = true;
                } else {
                    $check = false;
                }
            }

            if ($check == true) {
                return response()->json(['msg' => 'the data already exists', 'status' => 422]);
            } else {
                return response()->json(['msg' => 'Data Saved Successfully', 'status' => 200]);
            }
        } else {
            return response()->json(['msg' => 'Data Saved Successfully', 'status' => 200]);
        }
    }

    public function dataTableTimesheet()
    {
        $data = '';
        if (auth()->user()->status == 'adm') {
            $data = Event::with('user', 'user.detail', 'financial')->where('submit', '1')->orderBy('id', 'DESC');
        } elseif (auth()->user()->status == 'spv') {
            $data = Event::with('user', 'user.detail', 'financial')->where('submit', '1')->orderBy('id', 'DESC')->groupBy('user_id');
        } else {
            $data = Event::with('user', 'user.detail', 'financial')
                ->where('events.user_id', auth()->user()->id)
                ->where('submit', '1')
                ->orderBy('events.id', 'DESC');
        }
        // dd($data->get());
        return DataTables::of($data)
            ->addIndexColumn()
            // if (auth()->user()->status == 'adm') {
            //     # code...
            // }
            ->editColumn('financial.dailyfee', function ($data) {
                if (isset($data->financial->dailyfee)) {
                    $dailyfee = number_format($data->financial->dailyfee, 2, ',', '.');
                } else {
                    $dailyfee = '<span class="badge bg-danger text-white shadow-sm w-100">Daily fees have not been charged</span>';
                }

                return $dailyfee;
            })
            ->addColumn('totalwork', function ($data) {
                $total = 0;
                if (auth()->user()->status == 'spv') {
                    $event = Event::where('user_id', $data->user_id)
                        ->where('submit', '1')
                        ->get();
                    $total = count($event);
                } else {
                    $total = 1;
                }
                return $total;
            })
            ->addColumn('total', function ($data) {
                $total = 0;
                $result = 0;
                if (isset($data->financial->dailyfee)) {
                    if (auth()->user()->status == 'spv') {
                        $event = Event::where('user_id', $data->user_id)
                            ->where('submit', '1')
                            ->get();
                        $total = count($event);
                        $result = $total * $data->financial->dailyfee;
                        $result = number_format($result, 2, ',', '.');
                    } else {
                        $total = 1;
                        $result = $total * $data->financial->dailyfee;
                        $result = number_format($result, 2, ',', '.');
                    }
                } else {
                    $dailyfee = '<span class="badge bg-danger text-white shadow-sm w-100">Daily fees have not been charged</span>';
                }
                return $result;
            })
            ->editColumn('financial.location', function ($data) {
                if (isset($data->financial->location)) {
                    $location = $data->financial->location;
                } else {
                    $location = '<span class="badge bg-danger text-white shadow-sm w-100">Location have not been charged</span>';
                }

                return $location;
            })
            ->editColumn('approved_status', function ($data) {
                $status = '';
                $at = Carbon::parse($data->approved_at)->format('d/m/y');
                if ($data->approved_status != 'Wait') {
                    $status = $data->approved_status.' by '.$data->approved_by. ' at '.$at;
                } else {
                    $status = 'Wait';
                }

                return $status;
            })
            ->addColumn('check', function ($data) {
                $btn = '<input class="checkbox-row" type="checkbox" id="checkbox" name="checkbox" value="' .
                encrypt($data->id). '">';
                return $btn;
            })
            ->addColumn('action', function ($data) {
                $btn = '<div class="btn-group" role="group">' . '<button class="btn btn-success btn-sm btn-approve-event" id="btn-approve-event" data-expense-id=' . encrypt($data->id) . ' aria-label="Approve" title="Approve"><i class="fas fa-check"></i></button>' . '<button class="btn btn-danger btn-sm btn-reject-event" id="btn-reject-event" data-expense-id=' . encrypt($data->id) . ' aria-label="Reject" title="Reject"><i class="fas fa-times"></i></button>' . '</div>';
                return $btn;
            })
            ->rawColumns(['financial.dailyfee', 'financial.location', 'totalwork', 'total', 'action', 'check'])
            ->make(true);
    }

    public function submitTimesheetData(Request $request)
    {
        // Get the 'schedule' data from the request
        $schedule = $request->input('schedule');
        // Process each event in the schedule
        foreach ($schedule as $eventData) {
            $existingEvent = Event::where('id', $eventData['id'])->first();
            if ($existingEvent) {
                // Update existing event
                $existingEvent->update([
                    'submit' => '1',
                    'submit_by' => auth()->user()->name,
                    'submit_at' => Carbon::now()->format('Y-m-d H:i:s'),
                ]);
            }
        }

        // Return a response indicating success
        return response()->json(['message' => 'Events Submit successfully'], 201);
    }

    public function eventApprove(Request $request)
    {
        // Lakukan operasi approve untuk semua expense yang dipilih
        $expenseIds = $request->input('event_id');
        foreach ($expenseIds as $expenseId) {
            $id = decrypt($expenseId);

            $expense = Event::findorfail($id);
            $expense->update([
                'approved_status' => 'Approve',
                'approved_by' => session('name_user'),
                'approved_at' => date('Y-m-d H:i:s'),
            ]);
        }

        // Kembalikan respons JSON
        return response()->json(['message' => 'Salary approved successfully']);
    }

    public function eventReject(Request $request)
    {
        // Lakukan operasi reject untuk semua expense yang dipilih
        $expenseIds = $request->input('event_id');

        foreach ($expenseIds as $expenseId) {
            $id = decrypt($expenseId);

            $expense = Event::findorfail($id);
            $expense->update([
                'approved_status' => 'Reject',
                'approved_by' => session('name_user'),
                'approved_at' => date('Y-m-d H:i:s'),
            ]);
        }

        // Kembalikan respons JSON
        return response()->json(['message' => 'Salary rejected successfully']);
    }
}

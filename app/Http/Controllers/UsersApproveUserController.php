<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables as DataTables;

class UsersApproveUserController extends Controller
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
            'title' => "New Member (User Approve)",
            'menu'  => $menu,
            'user'  => $user,
        ];
        return view('user.usersapprove', $data);
    }

    public function allData()
    {
        $data = User::select('id', 'name', 'username', 'phone', 'email', 'country')->whereNull('admin_approval')->get();

        return DataTables::of($data)->make(true);
    }

    public function getData(Request $request)
    {
        // Validasi request, pastikan ID atau parameter lainnya diterima dengan benar
        $request->validate([
            'id' => 'required|integer', // Misalnya, ID harus diterima dan berupa integer
        ]);

        // Ambil ID dari request
        $id = $request->id;

        // Misalnya, ambil data detail dari model berdasarkan ID
        $detailData = User::find($id);

        if ($detailData) {
            // Jika data ditemukan, kembalikan sebagai respons JSON
            return response()->json($detailData);
        } else {
            // Jika data tidak ditemukan, kembalikan respons dengan status 404
            return response()->json(['message' => 'Data detail tidak ditemukan'], 404);
        }
    }

    public function updateData(Request $request)
    {
        $id = $request->id;
        var_dump($id);
        $validator = Validator::make($request->all(), [
            'fullname' => 'required|regex:/^[a-zA-Z]+$/u',
        ]);
        if($validator->validated()){
            if ($id) {
                $user = User::findorfail($id);
                $user->update([
                    'name' => $request->fullname,
                    'email' => $request->email,
                    'phone' => $request->mobile_phone,
                    'status' => $request->user_status,
                    'spv_id' => $request->select_spv,
                    'admin_approval' => now(),
                ]);
            }
            return back()->with('success', 'Updated successfully!');
        }
        return back()->with('error', 'Updated Failed!');
    }
}

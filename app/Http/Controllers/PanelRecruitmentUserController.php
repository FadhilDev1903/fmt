<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Panelrecruit;
use App\Models\Periodeshoplist;
use App\Models\Shoplist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PanelRecruitmentUserController extends Controller
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
        $periodeShoplist = Periodeshoplist::select('periodeshoplist_name', DB::raw('MAX(id) as id'))
            ->where('periode_startdate', '<=', date('Y-m-d'))
            ->where('periode_enddate', '>=', date('Y-m-d'))
            ->groupBy('periodeshoplist_name')
            ->get();
        $shopType = Shoplist::select('shop_type', DB::raw('MAX(id) as id'))
            ->where('country', session('country_user'))
            ->groupBy('shop_type')
            ->get();
        $shopSize = Shoplist::select('shopsize1', DB::raw('MAX(id) as id'))
            ->where('country', session('country_user'))
            ->groupBy('shopsize1')
            ->get();
        $city = Shoplist::select('city', DB::raw('MAX(id) as id'))
            ->where('country', session('country_user'))
            ->groupBy('city')
            ->get();
        $data = [
            'title' => "Panel Recruitment",
            'menu'  => $menu,
            'periodeShoplist'  => $periodeShoplist,
            'shopType'  => $shopType,
            'shopSize'  => $shopSize,
            'city'  => $city,
        ];
        return view('user.panelrecruitment', $data);
    }

    public function createData(Request $request)
    {
        // Validasi form
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|mimes:jpeg,png,jpg,gif|max:100', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'periode_num' => 'required',
            'shop_name' => 'required',
            'shop_type' => 'required',
            'shop_size' => 'required',
            'address' => 'required',
            'city' => 'required',
            'recruit_status' => 'required',
        ]);

        // Cek jika validasi gagal
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Validation failed!'); // Mengembalikan ke halaman sebelumnya dengan pesan error
        }

        //upload files
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $file->move(public_path('assets/img'), $fileName);
        } else {
            return back()->with('error', 'No file uploaded.');
        }

        // Buat koleksi baru
        Panelrecruit::create([
            'periode_name' => $request->periode_num,
            'shopname' => $request->shop_name,
            'shoptype' => $request->shop_type,
            'shopsize' => $request->shop_size,
            'address' => $request->address,
            'city' => $request->city,
            'status' => $request->recruit_status,
            'reason' => $request->reason,
            'startload' => now(),
            'inputdate' => now(),
            'staffname' => session('name_user'),
            'image' => $fileName,
            'lat' => $request->latitude,
            'long' => $request->longitude,
            'country' => session('country_user'),
        ]);

        return back()->with('success', 'Created successfully!');
    }
}

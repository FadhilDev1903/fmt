<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Shoplist;
use App\Models\Collection;
use Illuminate\Http\Request;
use App\Models\Periodeshoplist;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;

class DataCollectionUserController extends Controller
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

        $data = [
            'title' => "Data Collection",
            'menu'  => $menu,
            'periodeShoplist'  => $periodeShoplist,
        ];
        return view('user.datacollection', $data);
    }

    public function createData(Request $request)
    {
        // Validasi form
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|mimes:jpeg,png,jpg,gif', // Validasi untuk gambar dengan maksimal ukuran 5MB
            'periode_num' => 'required',
            'gsnr_id' => 'required',
            'collection_status' => 'required'
        ]);

        // Cek jika validasi gagal
        // if ($validator->fails()) {
        //     return back()->withErrors($validator)->withInput()->with('error', 'Validation failed!'); // Mengembalikan ke halaman sebelumnya dengan pesan error
        // }

        // Cari periode shop list berdasarkan gsnr_id
        $periodeShopList = Periodeshoplist::where('periodeshoplist_gsnr', $request->gsnr_id)
            ->first();
        $collection = Collection::where('gsnr', $request->gsnr_id)
            ->where('collection_status', 'collected')
            ->where('country', session('country_user'))
            ->first();

        // Jika tidak ditemukan, kembalikan ke halaman sebelumnya dengan pesan error
        if (!$periodeShopList) {
            return back()->withInput()->with('error', 'GSNR not found or has dropped! Please try again');
        }
        if ($collection) {
            return back()->withInput()->with('error', 'Unsaved! You have already collected for this store');
        }

        //upload files
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $w = Image::make($file)->width();
            $h = Image::make($file)->height();
            Image::make($file)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileName, 10);
            // $file->move(public_path('assets/img'), $fileName);
        } else {
            return back()->with('error', 'No file uploaded.');
        }

        // Buat koleksi baru
        Collection::create([
            'periode_name' => $request->periode_num,
            'gsnr' => $request->gsnr_id,
            'collection_status' => $request->collection_status,
            'collection_reason' => $request->reason,
            'collection_pgfill' => $request->pg_filled,
            'collection_newmodel' => $request->new_model,
            'collection_remind' => $request->reminder_panel,
            'collection_display' => $request->pg_display,
            'collection_missing' => $request->missing_pg,
            'collection_feedback' => $request->panel_feedback,
            'collection_startload' => now(),
            'collection_dateinput' => now(),
            'collection_staffname' => session('name_user'),
            'collection_image' => $fileName, // Simpan nama file dalam database
            'collection_lat' => $request->latitude,
            'collection_long' => $request->longitude,
            'country' => session('country_user'),
        ]);

        return back()->with('success', 'Created successfully!');
    }

    public function getGsnr(Request $request)
    {
        $term = $request->input('term');
        $Shoplists = Shoplist::where('nameofshop', 'LIKE', '%' . $term . '%')->limit(5)->get();
        $formattedShoplists = array();
        foreach ($Shoplists as $shoplist) {
            $formattedShoplists[] = array(
                'value' => $shoplist->nameofshop,
                'label' => $shoplist->gsnr
            );
        }
        return response()->json($formattedShoplists);
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Shoplist;
use Illuminate\Http\Request;
use App\Models\shoplistchange;
use Yajra\DataTables\DataTables;

class ShopDetailChangeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();
        $project = Shoplist::select('project')->where('country', session('country_user'))->distinct()->get();
        // $project = Project::select('id', 'name')->where('country', session('country_user'))->get();
        $channel = Shoplist::select('channel_name')->where('country', session('country_user'))->distinct()->get();
        $shop_type = Shoplist::select('shop_type')->where('country', session('country_user'))->distinct()->get();
        $city = Shoplist::select('city')->where('country', session('country_user'))->distinct()->get();
        $region = Shoplist::select('region')->where('country', session('country_user'))->distinct()->get();
        $region2 = Shoplist::select('region2')->where('country', session('country_user'))->distinct()->get();
        $organisat_type = Shoplist::select('organisat_type')->where('country', session('country_user'))->distinct()->get();
        $metode_konversi = Shoplist::select('metode_konversi')->where('country', session('country_user'))->distinct()->get();
        $base_staff = Shoplist::select('base_staff')->where('country', session('country_user'))->distinct()->get();
        $spv = Shoplist::select('spv')->where('country', session('country_user'))->distinct()->get();
        $collector = Shoplist::select('data_collector')->where('country', session('country_user'))->distinct()->get();
        $data = [
            'title' => 'Shoplist Change Detail',
            'menu' => $menu,
            'project' => $project,
            'channel' => $channel,
            'shop_type' => $shop_type,
            'city' => $city,
            'region' => $region,
            'region2' => $region2,
            'organisat_type' => $organisat_type,
            'metode_konversi' => $metode_konversi,
            'base_staff' => $base_staff,
            'spv' => $spv,
            'collector' => $collector,
        ];
        return view('user.shopdetailchange', $data);
    }

    public function allData()
    {
        $data = Shoplist::with('detailchange')
            ->select('id', 'shop_name', 'shop_type', 'shopsize1', 'city', 'region', 'data_collector', 'spv')
            ->where('data_collector', auth()->user()->username)
            ->orderBy('id', 'desc')
            ->get();
        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('aksi', function ($data) {
                $btn = '';
                if (isset($data->detailchange)) {
                    if ($data->detailchange->status == '0') {
                        $btn = '<button type="button" class="btn btn-secondary btn-sm showButton" data-id="' . base64_encode($data->detailchange->id) . '"><i class="fas fa-info"></i></button>';
                        $btn .= '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' . encrypt($data->id) . '"><i class="fas fa-trash"></i></button>';
                    } else {
                        $btn = '<button type="button" class="btn btn-primary btn-sm editButton" data-id="' . encrypt($data->id) . '"><i class="fas fa-edit"></i></button>';
                        $btn .= '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' . encrypt($data->id) . '"><i class="fas fa-trash"></i></button>';
                    }
                } else {
                    $btn = '<button type="button" class="btn btn-primary btn-sm editButton" data-id="' . encrypt($data->id) . '"><i class="fas fa-edit"></i></button>';
                    $btn .= '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' . encrypt($data->id) . '"><i class="fas fa-trash"></i></button>';
                }
                return $btn;
            })
            ->editColumn('status', function ($data) {
                $status = "<span class='btn btn-secondary btn-sm'>Data Default</span>";
                if (isset($data->detailchange)) {
                    if ($data->detailchange->status == '0') {
                        $status = "<span class='btn btn-warning btn-sm'>Changes Under Review</span>";
                    } elseif ($data->detailchange->status == '1') {
                        $status = "<span class='btn btn-success btn-sm'>Changes approved</span>";
                    } else {
                        $status = "<span class='btn btn-danger btn-sm'>Change rejected</span>";
                    }
                }
                return $status;
            })
            ->rawColumns(['aksi', 'status'])
            ->make(true);
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
        $id = $request->id;
        // dd($request->all());
        if ($id) {
            // $shoplist = Shoplist::findorfail($id);
            shoplistchange::create([
                'id_shoplist' => $id,
                'project' => $request->project,
                'shop_name' => $request->shop_name,
                'city' => $request->city,
                'channel_name' => $request->channel_name,
                'shop_type' => $request->shop_type,
                'region' => $request->region,
                'region2' => $request->region2,
                'organisat_type' => $request->organisat_type,
                'shopsize1' => $request->shop_size,
                'sample_status' => $request->sample_status,
                'metode_konversi' => $request->metode_konversi,
                'base_staff' => $request->base_staff,
                'spv' => $request->spv_name,
                'data_collector' => $request->collector,
                'status' => '0',
            ]);
        }

        return back()->with('success', 'Updated successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, string $id)
    {
        $id = $request->id;
        $decryptedId = base64_decode($id);

        $detailData = shoplistchange::find($decryptedId);
        $idshop = $detailData->id_shoplist;
        $currData = Shoplist::find($idshop);
        // $project = Project::select('id', 'name')->where('country', session('country_user'))->get();

        if ($detailData) {
            // Jika data ditemukan, kembalikan sebagai respons JSON
            return response()->json(['detailData' => $detailData, 'currentdata' => $currData]);
        } else {
            // Jika data tidak ditemukan, kembalikan respons dengan status 404
            return response()->json(['message' => 'Data detail tidak ditemukan'], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        if ($request->status == 'approve') {
            $detailData = shoplistchange::find($request->id);
            $detailData->update([
                'status' => '1',
            ]);

            $idshop = $detailData->id_shoplist;
            $shoplist = Shoplist::findorfail($idshop);

            $shoplist->update([
                'project' => $detailData->project,
                'shop_name' => $detailData->shop_name,
                'city' => $detailData->city,
                'channel_name' => $detailData->channel_name,
                'shop_type' => $detailData->shop_type,
                'region' => $detailData->region,
                'region2' => $detailData->region2,
                'organisat_type' => $detailData->organisat_type,
                'shopsize1' => $detailData->shopsize1,
                'sample_status' => $detailData->sample_status,
                'metode_konversi' => $detailData->metode_konversi,
                'base_staff' => $detailData->base_staff,
                'spv' => $detailData->spv,
                'data_collector' => $detailData->data_collector,
            ]);
            return response()->json(['success' => 'Updated successfully!']);
        } else {
            $detailData = shoplistchange::find($request->id);
            $detailData->update([
                'status' => '2',
            ]);
            return response()->json(['success' => 'Updated successfully!']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

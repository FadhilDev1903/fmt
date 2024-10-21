<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\User;
use App\Models\Shoplist;
use App\Models\Collection;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class HomeUserController extends Controller
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
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();
        $user_apprv = User::where('admin_approval', '!=', null)->get()->count();
        $total_coll = Collection::where('collection_status', 'collected')
            ->where('collection_staffname', auth()->user()->name)
            ->get()
            ->count();
            $city = Shoplist::select('city')->where('country', session('country_user'))->distinct()->get();
            $region = Shoplist::select('region')->where('country', session('country_user'))->distinct()->get();
            $spv = Shoplist::select('spv')->where('country', session('country_user'))->distinct()->get();
        $data = [
            'title' => 'Dashboard',
            'menu' => $menu,
            'user_apprv' => $user_apprv,
            'total_coll' => $total_coll,
            'city' => $city,
            'region' => $region,
            'spv' => $spv,
        ];
        return view('user.home', $data);
    }

    public function getTableCollection(Request $request)
    {
        if ($request->ajax()) {
            if (auth()->user()->status == 'col') {
                // $data = Collection::with(['shoplist'])
                //     ->where('collection_status', 'collected')
                //     ->where('collection_staffname', auth()->user()->name)
                //     ->orderBy('id', 'desc');
                $data = Collection::join('shoplists', 'collections.gsnr', '=', 'shoplists.gsnr')
                ->where('collection_status', 'collected')
                    ->where('collections.collection_staffname', auth()->user()->name)
                    ->select('collections.id as id', 'collections.collection_status as collection_status', 'collections.periode_name as periode_name', 'collections.collection_staffname as collection_staffname', 'nameofshop', 'collections.gsnr as gsnr', 'city', 'region', 'shoplists.country', 'spv')
                    ->orderBy('collections.id', 'desc');
            } elseif (auth()->user()->status == 'adm') {
                $data = Collection::join('shoplists', 'collections.gsnr', '=', 'shoplists.gsnr')
                    ->where('collections.country', auth()->user()->country)
                    ->select('collections.id as id', 'collections.collection_status as collection_status', 'collections.periode_name as periode_name', 'collections.collection_staffname as collection_staffname', 'nameofshop', 'collections.gsnr as gsnr', 'city', 'region', 'shoplists.country', 'spv')
                    ->orderBy('collections.id', 'desc')
                    ->groupBy('collections.gsnr');
            } elseif (auth()->user()->status == 'spv') {
                $data = Collection::join('shoplists', 'collections.gsnr', '=', 'shoplists.gsnr')
                    ->where('shoplists.spv', auth()->user()->name)
                    ->select('collections.id as id', 'collections.collection_status as collection_status', 'collections.periode_name as periode_name', 'collections.collection_staffname as collection_staffname', 'nameofshop', 'collections.gsnr as gsnr', 'city', 'region', 'shoplists.country', 'spv')
                    ->orderBy('collections.id', 'desc');
            }

            return DataTables::of($data)
                ->addIndexColumn()
                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('city'))) {
                        $city = $request->get('city');
                        $instance->where('city', $city);
                    }
                    if (!empty($request->get('spv'))) {
                        $spv = $request->get('spv');
                        $instance->where('spv', $spv);
                    }
                    if (!empty($request->get('region'))) {
                        $region = $request->get('region');
                        $instance->where('region', $region);
                    }
                })
                ->editColumn('collection_status', function ($data) {
                    $col = '';
                    if ($data->collection_status == 'collected') {
                        $col = '<span class="badge bg-success text-white shadow-sm w-100">' . $data->collection_status . '</span>';
                    } else {
                        $col = '<span class="badge bg-danger text-white shadow-sm w-100">' . $data->collection_status . '</span>';
                    }
                    return $col;
                })
                ->addColumn('action', function ($data) {
                    $btn = '<a href="" class="btn btn-warning btnShowCollection" data-toggle="modal" data-target="#modal-show-collection" data-id="' . $data->gsnr . '"><i class="fas fa-list m-auto"></i></a>';

                    return $btn;
                })
                ->rawColumns(['collection_status', 'action'])
                ->make(true);
        }
    }

    public function getTableCollectionDetail(Request $request, $id)
    {
        if ($request->ajax()) {
            $data = Collection::join('shoplists', 'collections.gsnr', '=', 'shoplists.gsnr')->where('collections.gsnr', $id)->select('collections.id as id', 'collections.collection_status as collection_status', 'collections.periode_name as periode_name', 'collections.collection_staffname as collection_staffname', 'nameofshop', 'collections.gsnr as gsnr', 'collections.collection_reason as reason')->orderBy('collections.id', 'desc');

            return DataTables::of($data)
                ->addIndexColumn()
                ->editColumn('collection_status', function ($data) {
                    $col = '';
                    if ($data->collection_status == 'collected') {
                        $col = '<span class="badge bg-success text-white shadow-sm w-100">' . $data->collection_status . '</span>';
                    } else {
                        $col = '<span class="badge bg-danger text-white shadow-sm w-100">' . $data->collection_status . '</span>';
                    }
                    return $col;
                })
                ->editColumn('reason', function ($data) {
                    $col = "";
                    if($data->reason == '' || $data->reason == ' '){
                        $col = "-";
                    }else{
                        $col = $data->reason;
                    }
                    return $col;
                })
                ->addColumn('action', function ($data) {
                    $btn = '<a href="" class="btn btn-warning btnShowCollection" data-toggle="modal" data-target="#modal-show-collection" data-id="' . $data->id . '"><i class="fas fa-list m-auto"></i></a>';

                    return $btn;
                })
                ->rawColumns(['collection_status', 'action'])
                ->make(true);
        }
    }
}

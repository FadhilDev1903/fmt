<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\User;
use Illuminate\Http\Request;
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
        $menu = Menu::with('children')->whereNull('parent_id')->where('roles', 'LIKE', '%'.auth()->user()->status.'%')->get();
        $user_apprv = User::where('admin_approval', '!=', null)->get()->count();
        $data = [
            'title' => "Dashboard",
            'menu'  => $menu,
            'user_apprv' => $user_apprv
        ];
        return view('user.home', $data);
    }
}

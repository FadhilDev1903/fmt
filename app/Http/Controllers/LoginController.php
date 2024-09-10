<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class LoginController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }

    public function proses_login(Request $request)
    {
        $requestData = $request->all();

        Validator::make($requestData, [
            'username' => ['required'],
            'password' => ['required'],
            'captcha' => ['required', 'captcha'],
        ])->validate();

        $usernameInput = $request->input('username');
        $loginType = filter_var($usernameInput, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

        $credentials = [
            $loginType => $usernameInput,
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->status == 'adm') {
                $status = "Administrator";
            } else if ($user->status == 'spv') {
                $status = "Supervisor";
            } else if ($user->status == 'col') {
                $status = "Collector";
            } else if ($user->status == 'sup') {
                $status = "Supplier";
            }

            if ($user->email_verified_at == null) {
                return redirect()->back()->with('error', 'Please Verify Email First');
            }

            if ($user->register_2 == null && $user->country == "ID") {
                Session::put([
                    'user_id' => encrypt($user->id),
                    'status_user' => $status,
                    'name_user' => $user->name,
                    'image_user' => $user->image_profile,
                    'country_user' => $user->country
                ]);
                return redirect()->route('register2')->with('warning', 'Please Complete Your Detail');
            }
            if ($user->status === 'adm') {
                Session::put([
                    'user_id' => encrypt($user->id),
                    'status_user' => $status,
                    'name_user' => $user->name,
                    'image_user' => $user->image_profile,
                    'country_user' => $user->country
                ]);
                return redirect()->route('home_user')->with('success', 'Welcome ' . $user->name . '');
            } else {
                // Redirect user to regular user dashboard
                Session::put([
                    'user_id' => encrypt($user->id),
                    'status_user' => $status,
                    'name_user' => $user->name,
                    'image_user' => $user->image_profile,
                    'country_user' => $user->country
                ]);
                return redirect()->route('home_user')->with('success', 'Welcome ' . $user->name . '');
            }
        }

        return redirect()->route('login')->with('error', 'Please try again.');
    }
}

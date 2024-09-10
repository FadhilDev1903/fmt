<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class checkRegisteredUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        if ($user && $user->country == 'ID' && is_null($user->register_2)) {
            return redirect()->route('register2')->with('warning', 'Please Complete Your Detail');
        // } elseif ($user &&  is_null($user->admin_approval)) {
        //     return redirect()->route('login')->with('warning', 'Wait until admin approve');
        }

        return $next($request);
    }
}

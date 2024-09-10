@extends('adminlte.layoutsuser.auth')

@section('content')

    <body class="hold-transition login-page">
        <div class="login-box" style="width: 50%">
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-header">
                    {{ __('Verify Your Email Address') }}
                </div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif

                    {{ __('Please check your email for a verification link.') }}
                    {{ __('If you did not receive the email') }},
                    <div class="row">
                        <div class="col-md-6">
                            <form class="d-inline" method="POST" action="{{ route('verification.send') }}">
                                @csrf
                                <button type="submit"
                                    class="btn btn-primary btn-block">{{ __('Request another') }}</button>.
                            </form>
                        </div>
                        <!-- <div class="col-md-6">
                            <a onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                                class="btn btn-danger btn-block">Login</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.login-box -->
    @endsection

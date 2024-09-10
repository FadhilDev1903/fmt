@extends('adminlte.layoutsuser.auth')

@section('content')

<body class="hold-transition login-page">
    <div class="login-box">
        <!-- /.login-logo -->
        <center><img src="{{ asset('assets/image/gfk_auth_logo.png') }}" width="250"></center>
        <div class="card">
            <div class="card-body login-card-body">
                <h1 class="login-box-msg">Sign in</h1>

                <form action="{{ route('proses_login') }}" method="post">
                    @csrf
                    <div class="input-group mb-3">
                        <input type="text" class="form-control @error('username') is-invalid @enderror" name="username" value="{{ old('username') }}" placeholder="Username">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                        @error('username')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                        @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group mt-4 mb-4">
                        <label for="captcha">Captcha:</label>
                        <div class="input-group captcha">
                            <span>{!! captcha_img() !!}</span>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-danger reload" id="reload">
                                    &#x21bb;
                                </button>
                            </div>
                        </div>
                        <input id="captcha" type="text" class="form-control mt-2 @error('captcha') is-invalid @enderror" placeholder="Enter Captcha" name="captcha">

                        @error('captcha')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label for="remember">
                                    {{ __('Remember Me') }}
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="row">
                        <div class="col-12 mb-1">
                            <button type="submit" class="btn btn-primary btn-block">{{ __('Login') }}</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <!-- /.social-auth-links -->
                <div class="row">
                    @if (Route::has('password.request'))
                    <div class="col-6 mb-1">
                        <a class="btn btn-warning btn-block text-center" href="{{ route('password.request') }}">{{ __('Forgot Password') }}</a>
                    </div>
                    @endif
                    @if (Route::has('register'))
                    <div class="col-6">
                        <a class="btn btn-secondary btn-block text-center" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </div>
                    @endif
                </div>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->
    @endsection
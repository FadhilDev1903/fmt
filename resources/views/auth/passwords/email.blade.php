@extends('adminlte.layoutsuser.auth')

@section('content')

    <body class="hold-transition login-page">
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <h4 class="login-box-msg">Forgot Password</h4>
                    <form action="{{ route('password.email') }}" method="post">
                        @csrf
                        <div class="input-group mb-3">
                            <input type="email" class="form-control @error('email') is-invalid @enderror" name="email"
                                value="{{ old('email') }}" placeholder="Email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="form-group mt-4 mb-4">
                            <label for="captcha">Captcha:</label>
                            <div class="input-group">
                                <span>{!! captcha_img() !!}</span>
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-danger reload" id="reload">
                                        &#x21bb;
                                    </button>
                                </div>
                            </div>
                            <input id="captcha" type="text" class="form-control mt-2" placeholder="Enter Captcha"
                                name="captcha">
                        </div>

                        <div class="row">
                            <div class="col-12 mb-2">
                                <button type="submit" class="btn btn-primary btn-block">Request new password</button>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        @if (Route::has('login'))
                            <div class="col-6 mb-1">
                                <a class="btn btn-warning btn-block text-center" href="{{ route('login') }}">Login</a>
                            </div>
                        @endif
                        @if (Route::has('register'))
                            <div class="col-6">
                                <a class="btn btn-secondary btn-block text-center"
                                    href="{{ route('register') }}">{{ __('Register') }}</a>
                            </div>
                        @endif
                    </div>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->
    @endsection

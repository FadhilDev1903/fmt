@extends('adminlte.layoutsuser.auth')

@section('content')

    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="register-logo">
                <div class="image">
                    <img src="{{ asset('assets/image/gfk_logo.png') }}" class="img" alt="Logo">
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <p class="login-box-msg">Register a new member</p>

                    <form action="{{ route('register') }}" method="post">
                        @csrf
                        <div class="input-group mb-3">
                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="fullname"
                                placeholder="Full name" name="name" value="{{ old('name') }}">
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="input-group mb-3">
                            <input type="email" class="form-control @error('email') is-invalid @enderror" name="email"
                                placeholder="Email" name="email" value="{{ old('email') }}">
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="input-group mb-3">
                            <select name="country" class="form-control select2auth @error('country') is-invalid @enderror">
                                <option value=""></option>
                                @foreach ($countries as $country)
                                    <option value="{{ $country['alpha2'] }}"
                                        {{ old('country') == $country['alpha2'] ? 'selected' : '' }}>{{ $country['name'] }}
                                    </option>
                                @endforeach
                            </select>
                            @error('country')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control @error('username') is-invalid @enderror"
                                name="username" id="username" placeholder="Username" value="{{ old('username') }}">
                            @error('username')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control @error('password') is-invalid @enderror"
                                name="password" id="password_register" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span id="password-strength"></span>
                                </div>
                            </div>
                            <div class="input-group" id="password-criteria"></div>
                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="input-group mb-3">
                            <input type="password" class="form-control" id="password_confirmation_register"
                                name="password_confirmation" placeholder="Retype password">
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
                            <input id="captcha" type="text"
                                class="form-control mt-2 @error('captcha') is-invalid @enderror" placeholder="Enter Captcha"
                                name="captcha">

                            @error('captcha')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-2">
                                <button type="submit" class="btn btn-primary btn-block">{{ __('Register') }}</button>
                            </div>
                        </div>
                    </form>
                    @if (Route::has('login'))
                        <div class="row">
                            <div class="col-md-12">
                                <a href="{{ route('login') }}" class="btn btn-secondary btn-block">Login</a>
                            </div>
                        </div>
                    @endif
                </div>
                <!-- /.form-box -->
            </div><!-- /.card -->
        </div>
        <!-- /.register-box -->
    @endsection

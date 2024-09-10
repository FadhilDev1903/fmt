@extends('adminlte.layoutsuser.auth')

@section('content')

<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            <div class="image">
                <img src="{{ asset('assets/image/gfk_logo.png') }}" class="img" alt="Logo">
            </div>
        </div>

        <div class="card card-lg">
            <div class="card-body">
                <p class="login-box-msg"></p>

                <form action="{{ route('proses_register') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    {{-- <div class="row">
                            <div class="col-6"> --}}
                    <div class="input-group mb-3">
                        <input type="text" class="form-control @error('idcardnumber') is-invalid @enderror" id="idcardnumber" placeholder="ID Card Number" name="idcardnumber" value="{{ old('idcardnumber') }}" pattern="[0-9]{16}" title="Enter exactly 16 numbers" maxlength="16" inputmode="numeric">
                        @error('idcardnumber')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="idcardfile" class="custom-file-input @error('idcardfile') is-invalid @enderror" id="inputidcard" onchange="readURL(this, `previewImageidcard`)" accept="image/*">
                            <label class="custom-file-label" for="exampleInputFile">Choose Id Card</label>
                            @error('idcardfile')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <img id="previewImageidcard" src="{{ asset('assets/image/default-preview.png') }}" alt="Preview" style="max-width: 200px; max-height: 200px;">
                    <div class="pt-3"></div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control @error('taxcardnumber') is-invalid @enderror" id="taxcardnumber" placeholder="Tax Card Number" name="taxcardnumber" value="{{ old('taxcardnumber') }}" pattern="[0-9]{15,16}" title="Enter at least 15 numbers" maxlength="16">
                        @error('taxcardnumber')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="taxcardfile" class="custom-file-input @error('taxcardfile') is-invalid @enderror" id="inputtaxcard" onchange="readURL(this, `previewImage`)" accept="image/*">
                            <label class=" custom-file-label" for="exampleInputFile">Choose Tax Card</label>
                            @error('taxcardfile')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <img id="previewImage" src="{{ asset('assets/image/default-preview.png') }}" alt="Preview" style="max-width: 200px; max-height: 200px;">
                    <div class="pt-3"></div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control @error('fullnameinbankcover') is-invalid @enderror" id="fullnameinbankcover" placeholder="Full Name in Bank Cover" name="fullnameinbankcover" value="{{ old('fullnameinbankcover') }}">
                        @error('fullnameinbankcover')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="input-group mb-3">
                        <select name="beneficiarybankcode" class="form-control select2auth @error('beneficiarybankcode') is-invalid @enderror">
                            <option value=""></option>
                            @foreach ($bank as $banks)
                            <option value="{{ $banks->bank_code }}">{{ $banks->bank_code . ' ' . $banks->bank_name }}
                            </option>
                            @endforeach
                        </select>
                        @error('beneficiarybankcode')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control @error('beneficiaryaccountnumber') is-invalid @enderror" id="beneficiaryaccountnumber" placeholder="Beneficiary Account Number" name="beneficiaryaccountnumber" value="{{ old('beneficiaryaccountnumber') }}" maxlength="20">
                        @error('beneficiaryaccountnumber')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="coverbookbankfile" class="custom-file-input @error('coverbookbankfile') is-invalid @enderror" id="exampleInputFile">
                            <label class="custom-file-label" for="exampleInputFile">Choose Cover Book Bank</label>
                            @error('coverbookbankfile')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <select name="maritalstatus" class="form-control select2auth @error('maritalstatus') is-invalid @enderror">
                            <option value=""></option>
                            <option value="married">Married</option>
                            <option value="not_married">Not Married</option>
                        </select>
                        @error('maritalstatus')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="address" id="address" placeholder="Fill in the address according to your ID Card"></textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="icheck-primary @error('terms') is-invalid @enderror">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                <label for="agreeTerms">
                                    I agree to the <a href="#">terms</a>
                                </label>
                            </div>
                            @error('terms')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
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
                        <div class="col-md-12 mb-2">
                            <button type="submit" class="btn btn-primary btn-block">{{ __('Complete Register') }}</button>
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-md-12 mb-2">
                        <a onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="btn btn-danger btn-block">Logout</a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.form-box -->
        </div><!-- /.card -->
    </div>
    <!-- /.register-box -->
    @endsection
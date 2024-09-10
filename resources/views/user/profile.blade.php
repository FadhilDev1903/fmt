@extends('adminlte.layoutsuser.app')

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 ml-auto">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">{{ $title ?? 'Task Todo' }}</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline" style="height: 100%">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle"
                                        src="{{ session('image_user') ? asset('assets/img/' . session('image_user') . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                        alt="User profile picture">
                                </div>

                                <h3 class="profile-username text-center">{{ session('name_user') }}</h3>

                                <p class="text-muted text-center">{{ session('status_user') }}</p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card" style="height: 100%">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#general"
                                            data-toggle="tab">General</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#detail" data-toggle="tab">Detail</a>
                                    </li>
                                </ul>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="general">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label for="inputName" class="col-sm-3 col-form-label">Name</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputName"
                                                        placeholder="Name" value="{{ $user->name }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputEmail" class="col-sm-3 col-form-label">Email</label>
                                                <div class="col-sm-9">
                                                    <input type="email" class="form-control" id="inputEmail"
                                                        placeholder="Email" value="{{ $user->email }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputName2" class="col-sm-3 col-form-label">Username</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputName2"
                                                        placeholder="Name" value="{{ $user->username }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputName2" class="col-sm-3 col-form-label">Password</label>
                                                <div class="col-sm-9">
                                                    <input type="password" class="form-control" id="inputName2"
                                                        placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9 text-center">
                                                    <img src="{{ $user->image_profile ? asset('assets/img/' . $user->image_profile . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                                        alt="" class="img-fluid"
                                                        style="width: 128px;height: 128px;">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label">Photo
                                                    Profile</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" name="file" class="custom-file-input"
                                                                id="exampleInputFile">
                                                            <label class="custom-file-label" for="exampleInputFile">Choose
                                                                Photo</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-3 col-sm-9">
                                                    <button type="submit" class="btn btn-danger">Update Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="detail">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label for="idcardnumber" class="col-sm-3 col-form-label">ID Card</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="idcardnumber"
                                                        id="idcardnumber" placeholder="ID Card Number"
                                                        pattern="[0-9]{16}" title="Enter exactly 16 numbers"
                                                        maxlength="16" value="{{ $userDetail->id_card_number }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9 text-center">
                                                    <img src="{{ $userDetail->id_card_file ? asset('assets/img/' . $userDetail->id_card_file . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="idcardfile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" name="idcardfile"
                                                                class="custom-file-input" id="idcardfile">
                                                            <label class="custom-file-label" for="exampleInputFile">Choose
                                                                ID Card</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="taxcardnumber" class="col-sm-3 col-form-label">Tax
                                                    Card</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="taxcardnumber"
                                                        id="taxcardnumber" placeholder="Tax Card Number"
                                                        pattern="[0-9]{15,16}" title="Enter at least 15 numbers"
                                                        maxlength="16" value="{{ $userDetail->tax_card_number }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9 text-center">
                                                    <img src="{{ $userDetail->tax_card_file ? asset('assets/img/' . $userDetail->tax_card_file . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" name="idcardfile"
                                                                class="custom-file-input" id="exampleInputFile">
                                                            <label class="custom-file-label" for="exampleInputFile">Choose
                                                                Tax Card</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fullnameinbankcover" class="col-sm-3 col-form-label">Full
                                                    Name</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="fullnameinbankcover"
                                                        id="fullnameinbankcover" placeholder="Full Name in Bank Cover"
                                                        value="{{ $userDetail->bank_full_name }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="beneficiarybankcode" class="col-sm-3 col-form-label">Bank
                                                    Code</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="beneficiarybankcode"
                                                        id="beneficiarybankcode" placeholder="Beneficiary Bank Code"
                                                        maxlength="12" value="{{ $userDetail->bank_code }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="beneficiaryaccountnumber"
                                                    class="col-sm-3 col-form-label">Account Number</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control"
                                                        name="beneficiaryaccountnumber" id="beneficiaryaccountnumber"
                                                        placeholder="Beneficiary Account Number" maxlength="20"
                                                        value="{{ $userDetail->bank_account_number }}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9 text-center">
                                                    <img src="{{ $userDetail->bank_book ? asset('assets/img/' . $userDetail->bank_book . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="coverbookbankfile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" name="coverbookbankfile"
                                                                class="custom-file-input" id="coverbookbankfile">
                                                            <label class="custom-file-label" for="exampleInputFile">Choose
                                                                Cover Book Bank</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="maritalstatus" class="col-sm-3 col-form-label">Marital
                                                    Status</label>
                                                <div class="col-sm-9">
                                                    <select name="maritalstatus" class="form-control select2">
                                                        <option value=""></option>
                                                        <option value="married"
                                                            {{ $userDetail->marital_status == 'married' ? 'selected' : '' }}>
                                                            Married</option>
                                                        <option value="not_married"
                                                            {{ $userDetail->marital_status == 'not_married' ? 'selected' : '' }}>
                                                            Not Married</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputFile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9 text-center">
                                                    <img src="{{ $userDetail->family_card ? asset('assets/img/' . $userDetail->family_card . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="familycardfile" class="col-sm-3 col-form-label"></label>
                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" name="familycardfile"
                                                                class="custom-file-input" id="familycardfile">
                                                            <label class="custom-file-label" for="familycardfile">Choose
                                                                Family Card</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="address" class="col-sm-3 col-form-label">Address</label>
                                                <div class="col-sm-9">
                                                    <textarea class="form-control" name="address" id="address" placeholder="Address">{{ $userDetail->address }}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-3 col-sm-10">
                                                    <button type="submit" class="btn btn-danger">Update Detail
                                                        Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

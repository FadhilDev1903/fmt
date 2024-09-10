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
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <!-- left column -->
                    <div class="col-lg-12">
                        <!-- general form elements -->
                        <div class="card">
                            <div class="card-header bg-orange">
                                <h3 class="card-title text-white">{{ $title ?? 'Task Todo' }}</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="{{ route('panel_recruitment_create') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="card-body">
                                    <input type="hidden" class="form-control" name="latitude" id="latitude">
                                    <input type="hidden" class="form-control" name="longitude" id="longitude">
                                    <div class="form-group">
                                        <label for="periode_num">Periode Number</label>
                                        <select class="form-control select2 @error('periode_num') is-invalid @enderror"
                                            style="width: 100%;" name="periode_num" id="periode_num" required>
                                            <option></option>
                                            @foreach ($periodeShoplist as $s)
                                                <option value="{{ $s->periodeshoplist_name }}">
                                                    {{ $s->periodeshoplist_name }}</option>
                                            @endforeach
                                        </select>
                                        @error('periode_num')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="shop_name">Shop Name</label>
                                        <input type="text" class="form-control @error('shop_name') is-invalid @enderror"
                                            id="shop_name" name="shop_name" placeholder="Shop Name">
                                        @error('shop_name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="shop_type">Shop Type</label>
                                        <select class="form-control select2 @error('shop_type') is-invalid @enderror"
                                            style="width: 100%;" name="shop_type" id="shop_type" required>
                                            <option></option>
                                            @foreach ($shopType as $s)
                                                <option value="{{ $s->shop_type }}">
                                                    {{ $s->shop_type }}</option>
                                            @endforeach
                                        </select>
                                        @error('shop_type')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="shop_size">Shop Size</label>
                                        <select class="form-control select2 @error('shop_size') is-invalid @enderror"
                                            style="width: 100%;" name="shop_size" id="shop_size" required>
                                            <option></option>
                                            @foreach ($shopSize as $s)
                                                <option value="{{ $s->shopsize1 }}">
                                                    {{ $s->shopsize1 }}</option>
                                            @endforeach
                                        </select>
                                        @error('shop_size')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <textarea class="form-control @error('address') is-invalid @enderror" id="address" name="address"
                                            placeholder="Address"></textarea>
                                        @error('address')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <select class="form-control select2 @error('city') is-invalid @enderror"
                                            style="width: 100%;" name="city" id="city" required>
                                            <option></option>
                                            @foreach ($city as $s)
                                                <option value="{{ $s->city }}">
                                                    {{ $s->city }}</option>
                                            @endforeach
                                        </select>
                                        @error('city')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="recruit_status">Recruit Successfully?</label>
                                        <select class="form-control select2 @error('recruit_status') is-invalid @enderror"
                                            id="recruit_status" name="recruit_status"
                                            onchange="changeRecruitStatus(this.value)">
                                            <option></option>
                                            <option value="yes">Yes</option>
                                            <option value="no">No</option>
                                        </select>
                                        @error('recruit_status')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div id="show-no-recruit" style="display: none">
                                        <div class="form-group">
                                            <label for="reason">What is the reason</label>
                                            <textarea class="form-control" id="reason" name="reason" placeholder="Reason"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputFile">Take a Shop Photo</label>
                                        {{-- <div class="input-group"> --}}
                                        <div class="custom-file">
                                            <input type="file" name="file"
                                                class="custom-file-input @error('file') is-invalid @enderror"
                                                id="exampleInputFile">
                                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                            @error('file')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        {{-- </div> --}}
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" class="btn bg-orange"
                                        style="color:white!important;">Save</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

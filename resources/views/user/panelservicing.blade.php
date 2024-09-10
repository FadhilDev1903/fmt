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
                            <form action="{{ route('panel_servicing_create') }}" method="POST"
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
                                        <label for="gsnr_id">GSNR ID</label>
                                        <input type="text" class="form-control @error('gsnr_id') is-invalid @enderror"
                                            name="gsnr_id" id="gsnr_id" placeholder="GSNR ID">
                                        @error('gsnr_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="method">Method</label>
                                        <select class="form-control select2 @error('method') is-invalid @enderror"
                                            style="width: 100%;" id="method" name="method">
                                            <option></option>
                                            <option value="Presentation">Presentation (A&B retailers) </option>
                                            <option value="RetailReport">Retailers Report (email/photocopy) </option>
                                            <option value="MarketVisit">Market Visit (Visiting the store)</option>
                                            <option value="TeleCall">Telephone Call</option>
                                            <option value="WhatsApp">WhatsApp</option>
                                            <option value="Email">Email</option>
                                        </select>
                                        @error('method')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="feedback">Panel Feedback/Request</label>
                                        <textarea class="form-control @error('feedback') is-invalid @enderror" name="feedback" id="feedback"
                                            placeholder="Panel Feedback/Request"></textarea>
                                        @error('feedback')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputFile">Take a Selfie</label>
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

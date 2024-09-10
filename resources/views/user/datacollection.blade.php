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
                            <form action="{{ route('data_collection_create') }}" method="POST"
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
                                        <label for="collection_status">Collection Status</label>
                                        <select class="form-control @error('collection_status') is-invalid @enderror"
                                            style="width: 100%;" name="collection_status" id="collection_status"
                                            onchange="changeCollectionStatus(this.value)" required>
                                            <option value="">Please Select</option>
                                            <option value="collected">Collected</option>
                                            <option value="uncollected">Uncollected</option>
                                        </select>
                                        @error('collection_status')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div id="show-collected" style="display: none">
                                        <div class="form-group">
                                            <label for="missing_pg">Missing PG</label>
                                            <textarea class="form-control" name="missing_pg" id="missing_pg" placeholder="Missing PG"></textarea>
                                        </div>
                                        @if (session('country_user') == 'ID')
                                            <div class="form-group">
                                                <label for="pg_filled">All PG's is filled?</label>
                                                <select class="form-control" style="width: 100%;" name="pg_filled"
                                                    id="pg_filled">
                                                    <option value="">Please Select</option>
                                                    <option value="yes">Yes </option>
                                                    <option value="no">No </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="new_model">Is There any a new model?</label>
                                                <select class="form-control" style="width: 100%;" name="new_model"
                                                    id="new_model" onchange="changeNewModel(this.value)">
                                                    <option value="">Please Select</option>
                                                    <option value="yes">Yes </option>
                                                    <option value="no">No </option>
                                                </select>
                                            </div>
                                            <div id="show-new-model-no" class="form-group" style="display: none">
                                                <label for="reminder_panel">Have you reminded to the panel?</label>
                                                <select class="form-control" style="width: 100%;" name="reminder_panel"
                                                    id="reminder_panel">
                                                    <option value="">Please Select</option>
                                                    <option value="yes">Yes </option>
                                                    <option value="no">No </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="pg_display">Is there a new PG on display?</label>
                                                <select class="form-control" style="width: 100%;" name="pg_display"
                                                    id="pg_display">
                                                    <option value="">Please Select</option>
                                                    <option value="yes">Yes </option>
                                                    <option value="no">No </option>
                                                </select>
                                            </div>
                                        @endif
                                        <div class="form-group">
                                            <label for="panel_feedback">Panel Feedback</label>
                                            <textarea class="form-control" name="panel_feedback" id="panel_feedback" placeholder="Feedback"></textarea>
                                        </div>
                                    </div>
                                    <div id="show-uncollected" style="display: none">
                                        <div class="form-group">
                                            <label for="reason">What is the reason</label>
                                            <textarea class="form-control" name="reason" id="reason" placeholder="Reason"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputFile">Take a Photo</label>
                                        {{-- <div class="input-group"> --}}
                                        <div class="custom-file">
                                            <input type="file" name="file"
                                                class="custom-file-input @error('file') is-invalid @enderror"
                                                id="exampleInputFile">
                                            <label class="custom-file-label" for="exampleInputFile">Choose
                                                file</label>
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

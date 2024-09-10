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
                <!-- /.row -->
                <div class="row">
                    <!-- left column -->
                    <div class="col-lg-12">
                        <!-- general form elements -->
                        <div class="card">
                            <div class="card-header bg-orange">
                                <h3 class="card-title text-white">Shoplist Change Detail</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <table id="dataShopListChange"
                                            class="table table-responsive table-bordered table-striped table-hover"
                                            width="100%" style="display: table!important;">
                                            <thead class="bg-orange" style="color: white!important;" width="100%">
                                                <tr>
                                                    <th>No</th>
                                                    <th>Shop Name</th>
                                                    <th>Shop Type</th>
                                                    <th>Shop Size</th>
                                                    <th>City</th>
                                                    <th>Region</th>
                                                    <th>Status</th>
                                                    <th>SPV Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- modal -->
                <div class="modal fade" id="modal-shoplist-detail-change">
                    <div class="modal-dialog modal-lg">
                        <form action="{{ route('shop-detail-change-store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Shoplist Detail</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="gsnr_id">GSNR ID</label>
                                                <input type="text" class="form-control" name="gsnr_id" id="gsnr_id"
                                                    placeholder="GSNR ID" readonly>
                                                <input type="hidden" class="form-control" name="id" id="id">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="project">Project</label>
                                                <select class="form-control select2" style="width: 100%;" name="project"
                                                    id="project">
                                                    <option></option>
                                                    @foreach ($project as $p)
                                                        {{-- <option value="{{ $p->id }}">
                                                            {{ $p->name }}</option> --}}
                                                        <option value="{{ $p->project }}">
                                                            {{ $p->project }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="channel_name">Channel Name</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="channel_name" id="channel_name">
                                                    <option></option>
                                                    @foreach ($channel as $p)
                                                        <option value="{{ $p->channel_name }}">
                                                            {{ $p->channel_name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="shop_name">Shop Name</label>
                                                <input type="text" class="form-control" name="shop_name" id="shop_name"
                                                    placeholder="Shop Name" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="shop_type">Shop Type</label>
                                                <select class="form-control select2" style="width: 100%;" name="shop_type"
                                                    id="shop_type">
                                                    <option></option>
                                                    @foreach ($shop_type as $p)
                                                        <option value="{{ $p->shop_type }}">
                                                            {{ $p->shop_type }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="shop_size">Shop Size</label>
                                                <select class="form-control select2" style="width: 100%;" name="shop_size"
                                                    id="shop_size">
                                                    <option></option>
                                                    <option value="LARGE">LARGE</option>
                                                    <option value="MEDIUM">MEDIUM</option>
                                                    <option value="SMALL">SMALL</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="shop_type">City</label>
                                                <select class="form-control select2" style="width: 100%;" name="city"
                                                    id="city">
                                                    <option></option>
                                                    @foreach ($city as $p)
                                                        <option value="{{ $p->city }}">
                                                            {{ $p->city }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="region">Region</label>
                                                <select class="form-control select2" style="width: 100%;" name="region"
                                                    id="region">
                                                    <option></option>
                                                    @foreach ($region as $p)
                                                        <option value="{{ $p->region }}">
                                                            {{ $p->region }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="region">Region 2</label>
                                                <select class="form-control select2" style="width: 100%;" name="region2"
                                                    id="region2">
                                                    <option></option>
                                                    @foreach ($region2 as $p)
                                                        <option value="{{ $p->region2 }}">
                                                            {{ $p->region2 }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="organisat_type">Organisat Type</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="organisat_type" id="organisat_type">
                                                    <option></option>
                                                    @foreach ($organisat_type as $p)
                                                        <option value="{{ $p->organisat_type }}">
                                                            {{ $p->organisat_type }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="sample_status">Sample Status</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="sample_status" id="sample_status">
                                                    <option></option>
                                                    <option value="ACTIVE">ACTIVE</option>
                                                    <option value="FAILURE">FAILURE</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="metode_konversi">Metode Konversi</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="metode_konversi" id="metode_konversi">
                                                    <option></option>
                                                    @foreach ($metode_konversi as $p)
                                                        <option value="{{ $p->metode_konversi }}">
                                                            {{ $p->metode_konversi }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="base_staff">Base Staff</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="base_staff" id="base_staff">
                                                    <option></option>
                                                    @foreach ($base_staff as $p)
                                                        <option value="{{ $p->base_staff }}">
                                                            {{ $p->base_staff }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="spv_name">SPV Name</label>
                                                <select class="form-control select2" style="width: 100%;" name="spv_name"
                                                    id="spv_name">
                                                    <option></option>
                                                    @foreach ($spv as $p)
                                                        <option value="{{ $p->spv }}">
                                                            {{ $p->spv }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="spv_id">SPV ID</label>
                                                <input type="text" class="form-control" name="spv_id" id="spv_id"
                                                    placeholder="SPV ID" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="collector">Collector</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="collector" id="collector">
                                                    <option></option>
                                                    @foreach ($collector as $p)
                                                        <option value="{{ $p->data_collector }}">
                                                            {{ $p->data_collector }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer justify-content-between">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"
                                        aria-label="Close">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Update Shop</button>
                                </div>
                            </div>
                        </form>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <div class="modal fade" id="modal-shoplist-detail-change-show">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Shoplist Detail</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="changed-show">
                                            {{--  --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

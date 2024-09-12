@extends('adminlte.layoutsuser.app')

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        @if (isset(auth()->user()->admin_approval))
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        @if (auth()->user()->status == 'adm')
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-orange" style="color: white!important">
                                    <div class="inner">
                                        <h3>{{ $user_apprv }}</h3>

                                        <p>Users Approve</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="" class="small-box-footer bg-orange"
                                        style="color: white!important">Detail
                                        <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        @endif

                        @if (auth()->user()->status == 'col')
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-orange" style="color: white!important">
                                    <div class="inner">
                                        <h3>{{ $total_coll }}</h3>

                                        <p>Data Collection (Collected)</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-orange">
                                    <h3 class="card-title text-white">Data Collection</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        @if (auth()->user()->status == 'spv')
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="city">City</label>
                                                    <select class="form-control select2" style="width: 100%;" id="city" name="city">
                                                        <option></option>
                                                        @foreach ($city as $s)
                                                            <option value="{{ $s->city }}">
                                                                {{ $s->city }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        @elseif(auth()->user()->status == 'adm')
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="region">Region</label>
                                                <select class="form-control select2" style="width: 100%;" id="region" name="region">
                                                    <option></option>
                                                    @foreach ($region as $s)
                                                        <option value="{{ $s->region }}">
                                                            {{ $s->region }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="spv">Supervisor</label>
                                                <select class="form-control select2" style="width: 100%;" id="spv" name="spv">
                                                    <option></option>
                                                    @foreach ($spv as $s)
                                                        <option value="{{ $s->spv }}">
                                                            {{ $s->spv }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        @endif
                                    </div>

                                    <table id="data-collection"
                                        class="table table-responsive table-bordered table-striped table-hover"
                                        width="100%" style="display: table!important;">
                                        <thead class="bg-orange" style="color: white!important;" width="100%">
                                            <tr>
                                                <th>No.</th>
                                                @if (auth()->user()->status == 'adm' || auth()->user()->status == 'spv')
                                                    <th>Collector Name</th>
                                                @endif
                                                <th>Periode Name</th>
                                                <th>Shop Name</th>
                                                <th>Status</th>
                                                @if (auth()->user()->status == 'adm' || auth()->user()->status == 'spv')
                                                    <th>Action</th>
                                                @endif
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </section>
        @else
            <h1>
                <p class="text-center">Your account still under review</p>
            </h1>
        @endif
        <!-- /.content -->
    </div>

    <div class="modal fade" id="modal-show-collection">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">All Activity</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table id="data-collection-detail"
                                class="table table-responsive table-bordered table-striped table-hover" width="100%"
                                style="display: table!important;">
                                <thead class="bg-orange" style="color: white!important;" width="100%">
                                    <tr>
                                        <th>No.</th>
                                        <th>Collector Name</th>
                                        <th>Periode Name</th>
                                        <th>Shop Name</th>
                                        <th>Status</th>
                                        <th>Reason</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

@endsection

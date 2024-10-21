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
                                <div class="col-md-9">
                                    <h3 class="card-title text-white">Claim</h3>
                                </div>
                                @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                    <div class="col-md-3 float-right">
                                        <button type="button" class="btn btn-default btn-sm float-right ml-1"
                                            id="btn-approve-all">Approve
                                            All</button>
                                        <button type="button" class="btn btn-danger btn-sm float-right"
                                            id="btn-reject-all">Reject All</a>
                                    </div>
                                @endif

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                {{-- <div class="row"> --}}
                                <table id="dataClaimExpenses"
                                    class="table table-responsive table-bordered table-striped table-hover text-center"
                                    width="100%" style="display: table!important;font-size: 14px;">
                                    <thead class="bg-orange" style="color: white!important;" width="100%">
                                        <tr>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th><input type="checkbox" id="check_all"></th>
                                            @endif
                                            <th>No.</th>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th>Employee Name</th>
                                            @endif
                                            <th>Claim Date</th>
                                            <th>Project Name</th>
                                            <th>Claim Type</th>
                                            <th>Expense Item</th>
                                            <th>Remark</th>
                                            <th>Amount</th>
                                            <th>Total</th>
                                            <th>File Upload</th>
                                            <th>Status</th>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th>Action</th>
                                                <th>Note</th>
                                            @endif
                                        </tr>
                                    </thead>
                                </table>
                                {{-- </div> --}}
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->

                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <!-- left column -->
                    <div class="col-lg-12">
                        <!-- general form elements -->
                        <div class="card">
                            <div class="card-header bg-orange">
                                <div class="col-md-9">
                                    <h3 class="card-title text-white">Salary/Timesheet</h3>
                                </div>
                                @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                    <div class="col-md-3 float-right">
                                        <button type="button" class="btn btn-default btn-sm float-right ml-1"
                                            id="btn-approve-all-event">Approve
                                            All</button>
                                        <button type="button" class="btn btn-danger btn-sm float-right"
                                            id="btn-reject-all-event">Reject All</a>
                                    </div>
                                @endif
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row mb-2">
                                </div>
                                {{-- <div class="row"> --}}
                                <table id="dataTimesheetExpenses"
                                    class="table table-responsive table-bordered table-striped table-hover" width="100%"
                                    style="display: table!important;">
                                    <thead class="bg-orange text-center" style="color: white!important;font-size: 14px;"
                                        width="100%">
                                        <tr>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th><input type="checkbox" id="check_all_event"></th>
                                            @endif
                                            <th>No.</th>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th>Name</th>
                                            @endif
                                            <th>Location</th>
                                            @if (auth()->user()->status != 'col')
                                                <th>Total Work</th>
                                            @endif
                                            <th>Payment</th>
                                            <th>Total</th>
                                            <th>Bank Name</th>
                                            <th>Account Bank</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                                                <th>Action</th>
                                            @endif
                                        </tr>
                                    </thead>
                                </table>
                                {{-- </div> --}}
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

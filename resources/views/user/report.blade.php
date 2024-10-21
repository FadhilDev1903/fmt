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
                            <form id="formReport" method="POST" action="{{route('export_report')}}">
                                @csrf
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="your_task">Select Your Task Report</label>
                                        <select class="form-control select2" style="width: 100%;" id="your_task" name="your_task">
                                            <option></option>
                                            <option value="todo">Report Todo</option>
                                            <option value="project">Project</option>
                                            <option value="expenses">Expenses</option>
                                            {{-- <option value="finance">Finance</option> --}}
                                        </select>
                                    </div>
                                    <div id="todo" style="display: none;">
                                        <div class="form-group">
                                            <label for="reporttodo">Select Your Report Todo</label>
                                            <select class="form-control select2" style="width: 100%;" id="reporttodo" name="reporttodo">
                                                <option></option>
                                                <option value="collection">Data Collection</option>
                                                <option value="servicing">Panel Servicing</option>
                                                <option value="recruitment">Panel Recruitment</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="periode_num">Periode Number</label>
                                            <select class="form-control select2" style="width: 100%;" id="periode_num" name="periode_num">
                                                <option></option>
                                                @foreach ($periodeShoplist as $s)
                                                    <option value="{{ $s->periodeshoplist_name }}">
                                                        {{ $s->periodeshoplist_name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div id="expenses" style="display: none;">
                                        <div class="form-group">
                                            <label for="reportexpenses">Select Your Report Expanse</label>
                                            <select class="form-control select2" style="width: 100%;" id="reportexpenses" name="reportexpenses">
                                                <option></option>
                                                <option value="journal">Report Journal</option>
                                                <option value="tobank">Report To Bank</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="reportbatch">Select Your Report Batch</label>
                                            <select class="form-control select2" style="width: 100%;" id="reportbatch" name="reportbatch">
                                                <option></option>
                                                <option value="batch1">Batch 1</option>
                                                <option value="batch2">Batch 2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="finance" style="display: none;">
                                        <div class="form-group">
                                            <label for="reportfinance">Select Your Report Finance</label>
                                            <select class="form-control select2" style="width: 100%;" id="reportfinance" name="reportfinance">
                                                <option></option>
                                                <option value="journal">Report Journal</option>
                                                <option value="bank">Report to Bank</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" id="btnReport" class="btn bg-orange"
                                        style="color:white!important;">Export</button>
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

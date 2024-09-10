@extends('adminlte.layoutsuser.app')

@section('content')
    <div class="content-wrapper">
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
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-orange">
                                <h3 class="card-title text-white">Financial Detail</h3>
                            </div>
                            <div class="card-body">
                                <div class="row mb-2">
                                    <div class="col-md-9">
                                    </div>
                                    <div class="col-md-3 float-right">
                                        <a href="" class="btn btn-primary float-right"
                                            style="
                                        height: 35px; font-size: 15px; " data-toggle="modal" data-target="#modal-add-financialDetails">Create New </a>
                                    </div>
                                </div>
                                {{-- <div class="row"> --}}
                                <table id="dataFinancialDetail"
                                    class="table table-responsive table-bordered table-striped table-hover" width="100%"
                                    style="display: table!important;">
                                    <thead class="bg-orange" style="color: white!important;" width="100%">
                                        <tr>
                                            <th>No.</th>
                                            <th>Employee Name</th>
                                            <th>Role</th>
                                            <th>Daily Fee</th>
                                            <th>Date Contract</th>
                                            <th>Contract</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    @include('user.financial_detail.modal_add')
    @include('user.financial_detail.modal_edit')
@endsection

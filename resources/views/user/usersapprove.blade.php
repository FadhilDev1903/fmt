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
                                <h3 class="card-title text-white">New Member</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="dataUsersApprove" class="table table-bordered table-striped table-hover"
                                    width="100%">
                                    <thead class="bg-orange" style="color: white!important;" width="100%">
                                        <tr>
                                            <th>No.</th>
                                            <th>Fullname</th>
                                            <th>Username</th>
                                            <th>Mobile Phone</th>
                                            <th>Email</th>
                                            <th>Country</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
                <!-- modal -->
                <div class="modal fade" id="modal-user-detail">
                    <div class="modal-dialog modal-lg">
                        <form action="{{ route('users_approve_update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">New Member Detail</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="fullname">Fullname</label>
                                                <input type="text" class="form-control" name="fullname" id="fullname"
                                                    placeholder="Fullname">
                                                <input type="hidden" class="form-control" name="id" id="id">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="username">Username</label>
                                                <input type="text" class="form-control" name="username" id="username"
                                                    placeholder="Username" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="text" class="form-control" name="email" id="email"
                                                    placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="mobile_phone">Mobile Phone</label>
                                                <input type="text" class="form-control" name="mobile_phone"
                                                    id="mobile_phone" placeholder="Mobile Phone">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="country">Country</label>
                                                <input type="text" class="form-control" name="country" id="country"
                                                    placeholder="Country" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="user_status">Select User Status</label>
                                                <select class="form-control select2" style="width: 100%;" name="user_status"
                                                    id="user_status">
                                                    <option></option>
                                                    <option value="col">Collector</option>
                                                    <option value="spv">Supervisor</option>
                                                    <option value="adm">Admin</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="select_spv">Select SPV</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="select_spv" id="select_spv">
                                                    <option></option>
                                                    @foreach ($user as $s)
                                                        <option value="{{ $s->id }}">{{ $s->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer justify-content-between">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

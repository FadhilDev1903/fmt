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
                        <!-- form start -->
                        <form action="{{ isset($getProject) ? route('adhocproject_update') : route('adhocproject_add') }}"
                            id="form-project-adhoc" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="card">
                                <div class="card-header bg-orange">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <h3 class="card-title text-white mt-2">Project</h3>
                                        </div>
                                        <div class="col-md-3 float-right">
                                            <button type="submit" class="btn btn-default float-right ml-1"
                                                style="height: 35px; font-size: 15px; ">{{ isset($getProject) ? 'Update' : 'Create' }}</button>
                                            <a href="{{ route('adhocproject') }}" class="btn btn-danger float-right"
                                                style="height: 35px; font-size: 15px; ">Cancel</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="project_name">Project Name</label>
                                                <input type="text" class="form-control" id="project_name"
                                                    name="project_name" placeholder="Project Name"
                                                    @isset($getProject) value="{{ $getProject->name }}" @endisset
                                                    @error('project_name') is-invalid @enderror required>
                                                <input type="hidden" class="form-control" id="id_project" name="id_project"
                                                    @isset($getProject) value="{{ $getProject->id }}" @endisset>
                                                <span class="invalid-feedback" role="alert"
                                                    id="project_name_error"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="start_date">Start Date</label>
                                                <input type="text" class="form-control" id="start_date" name="start_date"
                                                    onkeyup="this.value = this.value.replace(/[^0-9/]/g, '');"
                                                    @isset($getProject) value="{{ date('d/m/Y', strtotime($getProject->startdate)) }}" @endisset
                                                    required />
                                                <span class="invalid-feedback" role="alert" id="start_date_error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="project_description">Project Description</label>
                                            <textarea class="form-control" id="project_description" name="project_description" placeholder="Project Description">
@isset($getProject)
{{ $getProject ? $getProject->description : '' }}
@endisset
</textarea>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="end_date">End Date</label>
                                                <input type="text" class="form-control" id="end_date" name="end_date"
                                                    onkeyup="this.value = this.value.replace(/[^0-9/]/g, '');"
                                                    @isset($getProject) value="{{ date('d/m/Y', strtotime($getProject->enddate)) }}" @endisset
                                                    required />
                                                <span class="invalid-feedback" role="alert" id="end_date_error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="remarks">Remarks</label>
                                            <input type="text" class="form-control" id="remarks" name="remarks"
                                                placeholder="Remarks"
                                                @isset($getProject) value="{{ $getProject->remark }}" @endisset>
                                            <span class="invalid-feedback" role="alert" id="remarks_error"></span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="wbs_number">WBS Number</label>
                                                <input type="text"
                                                    onkeyup="this.value = this.value.replace(/[^0-9]/g, '');"
                                                    class="form-control" id="wbs_number" name="wbs_number"
                                                    placeholder="WBS Number"
                                                    @isset($getProject) value="{{ $getProject->wbs_number }}" @endisset>
                                                <span class="invalid-feedback" role="alert" id="wbs_number_error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="manage">Need to manage in</label>
                                            <input type="text" class="form-control" id="manage" name="manage"
                                                placeholder="Need to manage in"
                                                @isset($getProject) value="{{ $getProject->manage }}" @endisset>
                                            <span class="invalid-feedback" role="alert" id="manage_error"></span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="cost_center">Cost Center</label>
                                                <input type="text" class="form-control" id="cost_center"
                                                    name="cost_center" placeholder="Cost Center"
                                                    @isset($getProject) value="{{ $getProject->cost_center }}" @endisset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="budget">Budget</label>
                                            <input type="text" class="form-control" id="budget" name="budget"
                                                placeholder="Budget"
                                                onkeyup="this.value = this.value.replace(/[^0-9,]/g, '');"
                                                onchange="this.value = formatRupiah(this.value);"
                                                @isset($getProject) value="{{ $getProject->budget }}" @endisset
                                                required>
                                            <span class="invalid-feedback" role="alert" id="budget_error"></span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="parent_project">Parent Project</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                    name="parent_project" id="parent_project">
                                                    <option></option>
                                                    @foreach ($project as $p)
                                                        <option value="{{ $p->id }}"
                                                            @isset($getProject) {{ $getProject->parent_id == $p->id ? 'selected' : '' }} @endisset>
                                                            {{ $p->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-9"></div>
                                        <div class="col-md-3 mb-1">
                                            <button type="button" class="btn btn-primary float-right"
                                                style="height: 35px;font-size: 15px;" id="btn-show-user">
                                                <i class="fas fa-plus mr-1"></i>Add User
                                            </button>
                                        </div>
                                    </div>
                                    <table id="userProjectCreate"
                                        class="table table-responsive table-bordered table-striped table-hover"
                                        width="100%" style="display: table!important;">
                                        <thead class="bg-orange" style="color: white!important;" width="100%">
                                            <tr>
                                                <th>No.</th>
                                                <th>Name</th>
                                                <th>Sallary</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @isset($getProjectDetail)
                                                @foreach ($getProjectDetail as $index => $detail)
                                                    <tr>
                                                        <td data-user_id="{{ $detail->user_id }}">{{ $index + 1 }}</td>
                                                        <td>{{ $detail->user_name }}
                                                        </td>
                                                        <td>{{ $detail->salary }}</td>
                                                    </tr>
                                                @endforeach
                                            @endisset
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
                <!-- modal -->
                <div class="modal fade" id="modal-user-project-adhoc">
                    <div class="modal-dialog modal-lg">
                        {{-- <form action="{{ route('project_update') }}" method="POST" enctype="multipart/form-data">
                            @csrf --}}
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Add User to Project</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="select_user">Select User</label>
                                            <select class="form-control select2" style="width: 100%;" name="select_user"
                                                id="select_user">
                                                <option></option>
                                                @foreach ($user as $s)
                                                    <option value="{{ $s->id }}">{{ $s->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="sallary">Sallary</label>
                                            <input type="text" class="form-control" name="sallary" id="sallary"
                                                placeholder="Sallary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger" id="btn-delete-user-project-adhoc"
                                    style="display: none">Delete</button>
                                <button type="button" class="btn btn-primary"
                                    id="btn-add-user-project-adhoc">Save</button>
                            </div>
                        </div>
                        {{-- </form> --}}
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

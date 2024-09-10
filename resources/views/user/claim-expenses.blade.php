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
                    <form action="{{ route('claim_add') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="card">
                            <div class="card-header bg-orange">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h3 class="card-title text-white mt-2">Claim</h3>
                                    </div>
                                    <div class="col-md-3 float-right">
                                        <button type="submit" class="btn btn-default float-right" style="height: 35px; font-size: 15px; ">Create</button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="start_date">Claim Date</label>
                                            <input type="text" class="form-control @error('claim_date') is-invalid @enderror" id="start_date" name="claim_date" />
                                            @error('claim_date')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="employee_name">Employee Name</label>
                                            <input type="text" class="form-control @error('employee_name') is-invalid @enderror" id="employee_name" name="employee_name" placeholder="Employee Name" value="{{ session('name_user') }}" readonly>
                                            <input type="hidden" class="form-control" id="id_employee_name" name="id_employee_name" value="{{ session('user_id') }}">
                                            @error('employee_name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="department">Department</label>
                                            <select class="form-control select2  @error('department') is-invalid @enderror" id="department" name="department" style="width: 100%;">
                                                <option></option>
                                                <option value="MCI">MCI</option>
                                                <option value="CSM">CSM</option>
                                                <option value="Finance">Finance</option>
                                                <option value="HR">HR</option>
                                                <option value="Data-in">Data-in</option>
                                                <option value="Coding">Coding</option>
                                                <option value="MDQC">MDQC</option>
                                                <option value="Field">Field</option>
                                                <option value="QC Production">QC Production</option>
                                                <option value="RS">RS</option>
                                            </select>
                                            @error('department')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="employee_name">Claim Type</label>
                                            <select class="form-control select2 @error('claim_type') is-invalid @enderror" style="width: 100%;" name="claim_type" id="claim_type">
                                                <option></option>
                                                <option value="local">Local Expense</option>
                                                <option value="travel">Travel Expense</option>
                                            </select>
                                            @error('claim_type')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="expense_category">Expense Category</label>
                                            <select class="form-control select2 @error('expense_category') is-invalid @enderror" style="width: 100%;" name="expense_category" id="expense_categorys">
                                                <option></option>
                                                {{-- <option value="Airfare">Airfare</option>
                                                <option value="HotelPayment">Hotel Payment</option>
                                                <option value="LocalTransportOverseas">Local Transport Overseas</option>
                                                <option value="LocalTransportUpcountry">Local Transport Upcountry</option>
                                                <option value="TravelAllowance">Travel Allowance</option>
                                                <option value="ClientEntertainment">Client Entertainment</option>
                                                <option value="Others">Others</option>
                                                <option value="Courier">Courier</option>
                                                <option value="Entertainment">Entertainment</option>
                                                <option value="Internet">Internet</option>
                                                <option value="LocalTransport">Local Transport</option>
                                                <option value="Newspaper">Newspaper</option>
                                                <option value="OfficeSupplier">Office Supplier</option>
                                                <option value="Salary">Salary</option>
                                                <option value="Telephone">Telephone </option>
                                                <option value="PCAllowance">PC Allowance</option>
                                                <option value="Utilities">Utilities</option>
                                                <option value="Otherofficeexpenses">Other office expenses</option>
                                                <option value="Training">Training</option> --}}
                                            </select>
                                            @error('expense_category')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="expense_item">Expense Item</label>
                                            <select class="form-control select2 @error('expense_item') is-invalid @enderror" style="width: 100%;" name="expense_item" id="expense_items">
                                                <option></option>
                                            </select>
                                            @error('expense_item')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="remarks">Remarks</label>
                                            <input type="text" class="form-control" id="remarks" name="remarks" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="currency">Currency</label>
                                            <input type="text" class="form-control" id="currency" name="currency" value="IDR" readonly />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="project">Project</label>
                                            <select class="form-control select2 @error('project_name') is-invalid @enderror" style="width: 100%;" name="project_name[]" id="project" multiple>
                                                <option></option>
                                                @foreach ($project as $p)
                                                <option value="{{ $p->id }}">
                                                    {{ $p->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('project_name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="amount_currency">Amount in currency</label>
                                            <input type="text" onkeyup="this.value = this.value.replace(/[^0-9,]/g, '');" onchange="this.value = formatRupiah(this.value);" class="form-control @error('amount_currency') is-invalid @enderror" id="amount_currency" name="amount_currency" />
                                            @error('amount_currency')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    {{-- <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="project">Project Percentage</label>
                                                <input type="number"
                                                    class="form-control @error('project_percentage') is-invalid @enderror"
                                                    id="project_percentage" name="project_percentage" min="0"
                                                    max="100"
                                                    oninput="this.value = Math.max(0, Math.min(100, parseInt(this.value) || 0));">
                                                @error('project_percentage')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div> --}}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="bukti_file">Upload bukti</label>
                                    <div class="custom-file">
                                        <input type="file" name="bukti_files" class="custom-file-input @error('bukti_files') is-invalid @enderror" id="exampleInputFile">
                                        <label class="custom-file-label" for="exampleInputFile">Choose
                                            file</label>
                                        @error('bukti_files')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <h3 class="card-title text-white mt-2">Claim</h3>
                            </div>
                            <div class="col-md-3 float-right">
                                <a href="{{route('home_user')}}" type="button" class="btn btn-primary float-right" style="height: 35px; font-size: 15px; ">Cancel</a>

                            </div>
                        </div>
                </div>
                <!-- /.card-body -->
            </div>
            </form>
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

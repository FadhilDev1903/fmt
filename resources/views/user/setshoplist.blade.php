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
                <li class="breadcrumb-item active">{{ $title ?? "Task Todo" }}</li>
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
                  <h3 class="card-title text-white">Upload Shoplist</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="exampleInputFile">Upload Shoplist File</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="exampleInputFile">
                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <table
                        id="dataUsersApprove"
                        class="table table-bordered table-striped table-hover"
                      >
                        <thead class="bg-orange" style="color: white!important;" width="100%">
                          <tr>
                            <th>GSNR</th>
                            <th>Shop Name</th>
                            <th>Shop Type</th>
                            <th>Shop Size</th>
                            <th>City</th>
                            <th>Region</th>
                            <th>Data Collector</th>
                            <th>SPV Name</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr data-toggle="modal" data-target="#modal-shoplist-detail">
                            <td>1</td>
                            <td>Toko 1</td>
                            <td>Type</td>
                            <td>Size</td>
                            <td>Depok</td>
                            <td>Indonesia</td>
                            <td>Budi</td>
                            <td>Santoso</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>Toko 2</td>
                            <td>Type 2</td>
                            <td>Size 2</td>
                            <td>Jakarta</td>
                            <td>Indonesia</td>
                            <td>Taufik</td>
                            <td>Santoso</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
        </div>
        <!-- /.row -->
        <!-- modal -->
        <div class="modal fade" id="modal-shoplist-detail">
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
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="gsnr_id">GSNR ID</label>
                      <input type="text" class="form-control" id="gsnr_id" placeholder="GSNR ID" readonly>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="shop_name">Shop Name</label>
                      <input type="text" class="form-control" id="shop_name" placeholder="Shop Name" readonly>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="city">City</label>
                      <input type="text" class="form-control" id="city" placeholder="City">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="shop_type">Shop Type</label>
                      <input type="text" class="form-control" id="shop_type" placeholder="Shop Type">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="region">Region</label>
                      <input type="text" class="form-control" id="region" placeholder="Region" readonly>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="shop_size">Shop Size</label>
                      <input type="text" class="form-control" id="shop_size" placeholder="Shop Size">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="sample_status">Sample Status</label>
                      <input type="text" class="form-control" id="sample_status" placeholder="Sample Status">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="data_collector">Data Collector</label>
                      <input type="text" class="form-control" id="data_collector" placeholder="Data Collector">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="spv_id">SPV ID</label>
                      <input type="text" class="form-control" id="spv_id" placeholder="SPV ID" readonly>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="spv_name">SPV Name</label>
                      <input type="text" class="form-control" id="spv_name" placeholder="SPV Name">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Update Shop</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

@endsection

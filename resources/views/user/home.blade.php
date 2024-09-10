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
                                    <a href="" class="small-box-footer bg-orange" style="color: white!important">Detail
                                        <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        @endif
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-orange" style="color: white!important">
                                    <div class="inner">
                                        <h3>{{ $user_apprv }}</h3>

                                        <p>Project</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="" class="small-box-footer bg-orange" style="color: white!important">Detail
                                        <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
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
    <!-- /.content-wrapper -->
@endsection

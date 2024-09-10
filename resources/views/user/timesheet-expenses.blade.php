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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-orange">
                                <button class="btn btn-default float-right" id="saveTimesheet">Create</button>
                                <?php
                                    $dis = '';
                                    $now = date('Y-m-d H:i:s');
                                    $paymentDate = date('Y-m-d H:i:s');
                                    $contractDateBegin = date('Y-m-10 00:00:00');
                                    $contractDateEnd = date('Y-m-15 12:00:00');
                                    $paymentDate=date('Y-m-d H:i:s', strtotime($paymentDate));
                                    $contractDateBegin = date('Y-m-d H:i:s', strtotime($contractDateBegin));
                                    $contractDateEnd = date('Y-m-d H:i:s', strtotime($contractDateEnd));

                                    $contractDateBegin2 = date('Y-m-20 00:00:00');
                                    $contractDateEnd2 = date('Y-m-25 12:00:00');
                                    $contractDateBegin2 = date('Y-m-d H:i:s', strtotime($contractDateBegin2));
                                    $contractDateEnd2 = date('Y-m-d H:i:s', strtotime($contractDateEnd2));

                                    if (($paymentDate >= $contractDateBegin) && ($paymentDate <= $contractDateEnd)){
                                        $dis = 'disabled';
                                    }else if(($paymentDate >= $contractDateBegin2) && ($paymentDate <= $contractDateEnd2)){
                                        $dis = 'disabled';
                                    } else{
                                        $dis = '';
                                    }
                                ?>
                                <button class="btn btn-default float-left" id="submitTimesheet" {{$dis}}>Submit</button>
                            </div>
                            <div class="card-body">
                                <!-- THE CALENDAR -->
                                <div id="calendar"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
        <!-- Modal -->
        <!-- Modal for Add/Edit Event -->
        <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">Event Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="eventForm">
                            <div class="form-group">
                                <label for="eventTitle">Task</label>
                                <input type="text" class="form-control" id="eventTitle" placeholder="Enter Task">
                            </div>
                            <div class="form-group">
                                <label for="eventStartTime">Time Start</label>
                                <input type="time" class="form-control" id="eventStartTime">
                            </div>
                            <div class="form-group">
                                <label for="eventEndTime">Time End</label>
                                <input type="time" class="form-control" id="eventEndTime">
                            </div>
                            <input type="hidden" id="eventDate">
                            <input type="hidden" id="eventId">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="saveEvent">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content-wrapper -->
    @endsection

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $title ?? 'Task Todo' }}</title>

    <!-- Google Font: Lato -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="shortcut icon" href="{{ asset('assets/image/gfk_logo.png') }}" type="image/x-icon">
    <link
        href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
        rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Fullcalender -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/fullcalendar/main.css') }}">
    <!-- Select 2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css') }}">
    <!-- Light Box -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/ekko-lightbox/ekko-lightbox.css') }}">
    <!-- Jquery UI -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/jquery-ui/jquery-ui.css') }}">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <!-- Toastr -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/toastr/toastr.min.css') }}">
    <!-- Daterange Picker -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/daterangepicker/daterangepicker.css') }}">
    <!-- Select 2 Bootstrap 4 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet"
        href="{{ asset('assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
        href="{{ asset('assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css') }}">
    <style>
        .status {
            display: flex;
            align-items: center;
            margin-top: -8px;
        }

        .dot {
            height: 10px;
            width: 10px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .online {
            background-color: green;
        }

        .offline {
            background-color: red;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            background: transparent;
            bottom: 0;
            color: transparent;
            cursor: pointer;
            height: auto;
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            width: auto;
        }
    </style>
</head>

<body class="hold-transition sidebar-mini" onload="getLocation()">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-orange navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link icon-menu" data-widget="pushmenu" href="#" role="button"><i
                            class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-sm-inline-block">
                    <small>
                        &nbsp;
                        <div id="demo" class="status">
                            <span id="status-dot" class="dot offline"></span>
                        </div>
                    </small>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown user user-menu">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                        <img src="{{ session('image_user') ? asset('assets/img/' . session('image_user') . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                            class="user-image img-circle elevation-2" alt="User Image">
                        {{-- <span class="d-none d-md-block float-right text-light">{{ auth()->user()->name }}</span> --}}
                        <span class="d-none d-md-block float-right text-light"><?php echo auth()->user()->name; ?></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <!-- User image -->
                        <li class="user-header bg-orange">
                            <img src="{{ session('image_user') ? asset('assets/img/' . session('image_user') . '') : asset('assets/dist/img/user1-128x128.jpg') }}"
                                class="img-circle elevation-2" alt="User Image">

                            <p class=" text-light">
                                {{ auth()->user()->name }}
                                <small>{{ session('status_user') }}</small>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="{{ route('profile') }}" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="col-md-5"></div>
                                <div class="col-md-3">
                                    <a href="{{ route('logout') }}"
                                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                                        class="btn btn-danger btn-flat">Logout</a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                        class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-light-orange  elevation-4">

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 d-flex">
                    <div class="image">
                        <img src="{{ asset('assets/image/gfk_logo.png') }}" class="img-circle elevation-2"
                            alt="User Image">
                    </div>
                    <div class="info">
                        <p>Field Management Tool</p>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        @if (isset(auth()->user()->admin_approval))
                            @foreach ($menu as $menus)
                                <li class="nav-item ">
                                    <a href="{{ url($menus->url) ?? '#' }}"
                                        class="nav-link {{ $menus->menu == $title ? 'active text-white' : '' }}">
                                        <i class="nav-icon {{ $menus->icon }}"></i>
                                        <p>
                                            {{ $menus->menu }}
                                            @if ($menus->children->isNotEmpty())
                                                <i class="right fas fa-angle-left"></i>
                                            @endif
                                        </p>
                                    </a>
                                    @if ($menus->children->isNotEmpty())
                                        <ul class="nav nav-treeview">
                                            @foreach ($menus->children as $child)
                                                <li class="nav-item">
                                                    <a href="{{ url($child->url) }}"
                                                        class="nav-link {{ $child->menu == $title ? 'active text-white' : '' }}">
                                                        <i class="nav-icon {{ $child->icon }}"></i>
                                                        <p>{{ $child->menu }}</p>
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>
                            @endforeach
                        @else
                            <?php $count = 0; ?>
                            @foreach ($menu as $menus)
                                <?php if ($count == 1) {
                                    break;
                                } ?>
                                <li class="nav-item">
                                    <a href="{{ url($menus->url) ?? '#' }}"
                                        class="nav-link {{ $menus->menu == $title ? 'active text-white' : '' }}">
                                        <i class="nav-icon {{ $menus->icon }}"></i>
                                        <p>
                                            {{ $menus->menu }}
                                            @if ($menus->children->isNotEmpty())
                                                <i class="right fas fa-angle-left"></i>
                                            @endif
                                        </p>
                                    </a>
                                    @if ($menus->children->isNotEmpty())
                                        <ul class="nav nav-treeview">
                                            @foreach ($menus->children as $child)
                                                <li class="nav-item">
                                                    <a href="{{ url($child->url) }}"
                                                        class="nav-link {{ $child->menu == $title ? 'active text-white' : '' }}">
                                                        <i class="nav-icon {{ $child->icon }}"></i>
                                                        <p>{{ $child->menu }}</p>
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>
                                <?php $count++; ?>
                            @endforeach
                        @endif

                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>


        @yield('content')

        <!-- REQUIRED SCRIPTS -->

        <!-- jQuery -->
        <script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
        <!-- Fullcalender -->
        <script src="{{ asset('assets/plugins/fullcalendar/main.js') }}"></script>
        <!-- jQuery UI -->
        <script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.js') }}"></script>
        <!-- Bootstrap 4 -->
        <script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
        <!-- Moment -->
        <script src="{{ asset('assets/plugins/moment/moment.min.js') }}"></script>
        <!-- Date Range Picker -->
        <script src="{{ asset('assets/plugins/daterangepicker/daterangepicker.js') }}"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="{{ asset('assets/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
        <!-- DataTables -->
        <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/jszip/jszip.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/pdfmake/pdfmake.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/pdfmake/vfs_fonts.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
        <!-- Select 2 -->
        <script src="{{ asset('assets/plugins/select2/js/select2.full.min.js') }}"></script>
        <!-- Light Box -->
        <script src="{{ asset('assets/plugins/ekko-lightbox/ekko-lightbox.min.js') }}"></script>
        <!-- SweetAlert2 -->
        <script src="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
        <!-- Toastr -->
        <script src="{{ asset('assets/plugins/toastr/toastr.min.js') }}"></script>
        <!-- AdminLTE App -->
        <script src="{{ asset('assets/dist/js/adminlte.min.js') }}"></script>
        {{-- inisiasi --}}
        <script>
            // $(document).ready(function() {
            var Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000
            });
            @if ($message = Session::get('success'))
                Toast.fire({
                    icon: 'success',
                    title: '{{ $message }}'
                })
            @endif
            @if ($message = Session::get('info'))
                Toast.fire({
                    icon: 'info',
                    title: '{{ $message }}'
                })
            @endif
            @if ($message = Session::get('error'))
                Toast.fire({
                    icon: 'error',
                    title: '{{ $message }}'
                })
            @endif
            @if ($message = Session::get('warning'))
                Toast.fire({
                    icon: 'warning',
                    title: '{{ $message }}'
                })
            @endif
            // Initialize Select2
            $('.select2').select2({
                placeholder: "Please Select",
                theme: 'bootstrap4',
                allowClear: true
            });

            // Initialize datetimepicker
            $('#start_date').daterangepicker({
                singleDatePicker: true,
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear',
                    format: 'DD/MM/YYYY'
                }
            });

            $('#end_date').daterangepicker({
                singleDatePicker: true,
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear',
                    format: 'DD/MM/YYYY'
                }
            });

            $('#start_date').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('DD/MM/YYYY'));
            });
            $('#start_date').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });

            $('#end_date').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.endDate.format('DD/MM/YYYY'));
            });
            $('#end_date').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });
            // });
        </script>
        {{-- akhir inisiasi --}}
        {{-- start project --}}
        <script>
            $(document).ready(function() {
                $('#btn-show-user').on('click', function() {
                    $('#modal-user-project').modal('show');
                    $('#select_user').val('').change();
                    $('#sallary').val('');
                    $('#btn-delete-user-project').css('display', 'none');
                })

                var no_urut = 1;

                $('#btn-add-user-project').on('click', function() {
                    var userId = $('#select_user').val(); // Ambil ID pengguna dari input tersembunyi
                    var nameInput = $('#select_user option:selected').text();
                    var salaryInput = $('#sallary').val();

                    var newRow = $('<tr>');
                    newRow.append('<td data-user_id = "' + userId + '">' + ($('#userProjectCreate tbody tr')
                        .length + 1) + '</td>'); // ID pengguna
                    newRow.append('<td>' + nameInput + '</td>'); // Nama
                    newRow.append('<td>' + salaryInput + '</td>'); // Gaji
                    $('#userProjectCreate tbody').append(newRow);
                    $('#modal-user-project').modal('hide');

                    $('#select_user').val('').change();
                    $('#sallary').val('');
                });
                var dataProject = $('#dataProject').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('project_all') }}',
                    columns: [{
                            data: 'no',
                            name: 'no'
                        },
                        {
                            data: 'name',
                            name: 'name'
                        },
                        {
                            data: 'cost_center',
                            name: 'cost_center'
                        },
                        {
                            data: 'wbs_number',
                            name: 'wbs_number'
                        },
                        {
                            data: 'remark',
                            name: 'remark'
                        },
                        {
                            data: 'startdate',
                            name: 'startdate'
                        },
                        {
                            data: 'enddate',
                            name: 'enddate'
                        }
                    ]
                });

                $('#dataProject tbody').on('click', 'tr', function() {
                    var rowData = dataProject.row(this).data();

                    if (rowData && rowData.ids) { // Pastikan rowData.id tidak kosong
                        window.location.href = "{{ url('project-detail') }}/" + rowData.ids;
                    }
                });

                $('#userProjectCreate tbody').on('click', 'tr', function() {
                    // Mendapatkan nilai dari kolom di dalam baris yang diklik
                    var name = $(this).find('td:nth-child(2)')
                        .text(); // Mendapatkan nilai dari kolom kedua
                    var salary = $(this).find('td:nth-child(3)')
                        .text(); // Mendapatkan nilai dari kolom ketiga

                    // Mendapatkan data atribut
                    var userId = $(this).find('td:nth-child(1)').data('user_id');
                    // Lakukan apapun yang diperlukan dengan nilai-nilai yang diperoleh
                    $('#modal-user-project').modal('show');
                    $('#select_user').val(userId).change();
                    $('#sallary').val(salary);
                    $('#btn-delete-user-project').css('display', '');
                });

                $('#form-project').submit(function(event) {
                    // Menghentikan pengiriman formulir biasa
                    event.preventDefault();

                    // Mengumpulkan data dari formulir
                    var formData = {
                        _token: $('meta[name="csrf-token"]').attr('content'), // Menambahkan CSRF token
                        project_name: $('#project_name').val(),
                        id_project: $('#id_project').val(),
                        start_date: $('#start_date').val(),
                        project_description: $('#project_description').val(),
                        project_type: $('#project_type').val(),
                        end_date: $('#end_date').val(),
                        remarks: $('#remarks').val(),
                        wbs_number: $('#wbs_number').val(),
                        manage: $('#manage').val(),
                        cost_center: $('#cost_center').val(),
                        budget: $('#budget').val(),
                        parent_project: $('#parent_project').val()
                    };

                    // Mengumpulkan data dari tabel pengguna
                    var usersData = [];
                    $('#userProjectCreate tbody tr').each(function() {
                        var userId = $(this).find('td:eq(0)')
                            .data('user_id'); // Mengambil ID pengguna dari kolom pertama
                        var userName = $(this).find('td:eq(1)')
                            .text(); // Mengambil nama pengguna dari kolom kedua
                        var userSalary = $(this).find('td:eq(2)')
                            .text(); // Mengambil gaji pengguna dari kolom ketiga
                        usersData.push({
                            id: userId,
                            name: userName,
                            salary: userSalary
                        });
                    });

                    // Menambahkan data pengguna ke dalam objek formData
                    formData.users = usersData;

                    // Mengirim data ke server menggunakan AJAX
                    $.ajax({
                        url: $(this).attr('action'),
                        method: $(this).attr('method'),
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        success: function(response) {
                            if (response.redirect_url) {
                                Toast.fire({
                                    icon: 'success',
                                    title: response.message
                                }).then(function() {
                                    window.location.href = response.redirect_url;
                                });
                            } else {
                                // Tampilkan pesan kesalahan jika ada
                                console.log(response.errors);
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                            if (xhr.responseJSON && xhr.responseJSON.errors) {
                                // Bersihkan pesan kesalahan sebelumnya
                                $('.invalid-feedback').empty();

                                // Tampilkan pesan kesalahan dari validasi
                                var errors = xhr.responseJSON.errors;
                                $.each(errors, function(field, messages) {
                                    // Ubah nama field menjadi format id dengan menambahkan _error di akhirnya
                                    var fieldId = '#' + field + '_error';
                                    // Tambahkan pesan kesalahan ke dalam span
                                    $(fieldId).html(messages.join('<br>'))
                                        .show(); // Tampilkan dan isi dengan pesan kesalahan
                                });
                            }
                        }
                    });
                });
            })
        </script>
        {{-- end project --}}
        {{-- start adhoc project --}}
        <script>
            $(document).ready(function() {
                $('#btn-show-user-adhoc').on('click', function() {
                    $('#modal-user-project-adhoc').modal('show');
                    $('#select_user').val('').change();
                    $('#sallary').val('');
                    $('#btn-delete-user-project-adhoc').css('display', 'none');
                })

                var no_urut = 1;

                $('#btn-add-user-project-adhoc').on('click', function() {
                    var userId = $('#select_user').val(); // Ambil ID pengguna dari input tersembunyi
                    var nameInput = $('#select_user option:selected').text();
                    var salaryInput = $('#sallary').val();

                    var newRow = $('<tr>');
                    newRow.append('<td data-user_id = "' + userId + '">' + ($(
                            '#userAdhocProjectCreate tbody tr')
                        .length + 1) + '</td>'); // ID pengguna
                    newRow.append('<td>' + nameInput + '</td>'); // Nama
                    newRow.append('<td>' + salaryInput + '</td>'); // Gaji
                    $('#userAdhocProjectCreate tbody').append(newRow);
                    $('#modal-user-project-adhoc').modal('hide');

                    $('#select_user').val('').change();
                    $('#sallary').val('');
                });
                var dataAdhocProject = $('#dataAdhocProject').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('adhocproject_all') }}',
                    columns: [{
                            data: 'no',
                            name: 'no'
                        },
                        {
                            data: 'name',
                            name: 'name'
                        },
                        {
                            data: 'cost_center',
                            name: 'cost_center'
                        },
                        {
                            data: 'wbs_number',
                            name: 'wbs_number'
                        },
                        {
                            data: 'remark',
                            name: 'remark'
                        },
                        {
                            data: 'startdate',
                            name: 'startdate'
                        },
                        {
                            data: 'enddate',
                            name: 'enddate'
                        }
                    ]
                });

                $('#dataAdhocProject tbody').on('click', 'tr', function() {
                    var rowData = dataAdhocProject.row(this).data();

                    if (rowData && rowData.ids) { // Pastikan rowData.id tidak kosong
                        window.location.href = "{{ url('adhocproject-detail') }}/" + rowData.ids;
                    }
                });

                $('#userAdhocProjectCreate tbody').on('click', 'tr', function() {
                    // Mendapatkan nilai dari kolom di dalam baris yang diklik
                    var name = $(this).find('td:nth-child(2)')
                        .text(); // Mendapatkan nilai dari kolom kedua
                    var salary = $(this).find('td:nth-child(3)')
                        .text(); // Mendapatkan nilai dari kolom ketiga

                    // Mendapatkan data atribut
                    var userId = $(this).find('td:nth-child(1)').data('user_id');
                    // Lakukan apapun yang diperlukan dengan nilai-nilai yang diperoleh
                    $('#modal-user-project-adhoc').modal('show');
                    $('#select_user').val(userId).change();
                    $('#sallary').val(salary);
                    $('#btn-delete-user-project-adhoc').css('display', '');
                });

                $('#form-project-adhoc').submit(function(event) {
                    // Menghentikan pengiriman formulir biasa
                    event.preventDefault();

                    // Mengumpulkan data dari formulir
                    var formData = {
                        _token: $('meta[name="csrf-token"]').attr('content'), // Menambahkan CSRF token
                        project_name: $('#project_name').val(),
                        id_project: $('#id_project').val(),
                        start_date: $('#start_date').val(),
                        project_description: $('#project_description').val(),
                        end_date: $('#end_date').val(),
                        remarks: $('#remarks').val(),
                        wbs_number: $('#wbs_number').val(),
                        manage: $('#manage').val(),
                        cost_center: $('#cost_center').val(),
                        budget: $('#budget').val(),
                        parent_project: $('#parent_project').val()
                    };

                    // Mengumpulkan data dari tabel pengguna
                    var usersData = [];
                    $('#userAdhocProjectCreate tbody tr').each(function() {
                        var userId = $(this).find('td:eq(0)')
                            .data('user_id'); // Mengambil ID pengguna dari kolom pertama
                        var userName = $(this).find('td:eq(1)')
                            .text(); // Mengambil nama pengguna dari kolom kedua
                        var userSalary = $(this).find('td:eq(2)')
                            .text(); // Mengambil gaji pengguna dari kolom ketiga
                        usersData.push({
                            id: userId,
                            name: userName,
                            salary: userSalary
                        });
                    });

                    // Menambahkan data pengguna ke dalam objek formData
                    formData.users = usersData;

                    // Mengirim data ke server menggunakan AJAX
                    $.ajax({
                        url: $(this).attr('action'),
                        method: $(this).attr('method'),
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        success: function(response) {
                            if (response.redirect_url) {
                                Toast.fire({
                                    icon: 'success',
                                    title: response.message
                                }).then(function() {
                                    window.location.href = response.redirect_url;
                                });
                            } else {
                                // Tampilkan pesan kesalahan jika ada
                                console.log(response.errors);
                            }
                        },
                        error: function(xhr, status, error) {
                            if (xhr.responseJSON && xhr.responseJSON.errors) {
                                // Bersihkan pesan kesalahan sebelumnya
                                $('.invalid-feedback').empty();

                                // Tampilkan pesan kesalahan dari validasi
                                var errors = xhr.responseJSON.errors;
                                $.each(errors, function(field, messages) {
                                    // Ubah nama field menjadi format id dengan menambahkan _error di akhirnya
                                    var fieldId = '#' + field + '_error';
                                    // Tambahkan pesan kesalahan ke dalam span
                                    $(fieldId).html(messages.join('<br>'))
                                        .show(); // Tampilkan dan isi dengan pesan kesalahan
                                });
                            }
                        }
                    });
                });
            })
        </script>
        {{-- end adhoc project --}}
        {{-- user approve --}}
        <script>
            $(document).ready(function() {
                var dataUsersApprove = $('#dataUsersApprove').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('users_approve_all') }}',
                    columns: [{
                            data: 'id',
                            name: 'id',
                            visible: false
                        },
                        {
                            data: 'name',
                            name: 'name',
                        },
                        {
                            data: 'username',
                            name: 'username'
                        },
                        {
                            data: 'phone',
                            name: 'phone'
                        },
                        {
                            data: 'email',
                            name: 'email'
                        },
                        {
                            data: 'country',
                            name: 'country'
                        }
                    ]
                });
                $('#dataUsersApprove tbody').on('click', 'tr', function() {
                    var rowData = dataUsersApprove.row(this).data();

                    if (rowData) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('users_approve_get') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: rowData.id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            success: function(response) {
                                // Menampilkan data detail di modal
                                $('#id').val(response.id);
                                $('#fullname').val(response.name);
                                $('#username').val(response.username);
                                $('#email').val(response.email);
                                $('#mobile_phone').val(response.phone);
                                $('#country').val(response.country);
                                $('#shop_size').val(response.shop_size);
                                $('#user_status').val(response.status).change();
                                $('#select_spv').val(response.spv_id).change();
                                // $('#spv_id').val(response.spv_id);
                                // $('#spv_name').val(response.spv);
                                // Populasikan data detail lainnya sesuai kebutuhan

                                $('#modal-user-detail').modal('show');
                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });
            });
        </script>
        {{-- akhir user approve --}}
        {{-- member --}}
        <script>
            $(document).ready(function() {
                var datamember = $('#datamember').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('member_all') }}',
                    columns: [{
                            data: 'id',
                            name: 'id',
                            visible: false
                        },
                        {
                            data: 'name',
                            name: 'name'
                        },
                        {
                            data: 'username',
                            name: 'username'
                        },
                        {
                            data: 'phone',
                            name: 'phone'
                        },
                        {
                            data: 'email',
                            name: 'email'
                        },
                        {
                            data: 'country',
                            name: 'country'
                        }
                    ]
                });
                $('#datamember tbody').on('click', 'tr', function() {
                    var rowData = datamember.row(this).data();

                    if (rowData) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('member_get') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: rowData.id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            success: function(response) {
                                // Menampilkan data detail di modal
                                $('#id').val(response.id);
                                $('#fullname').val(response.name);
                                $('#username').val(response.username);
                                $('#email').val(response.email);
                                $('#mobile_phone').val(response.phone);
                                $('#country').val(response.country);
                                $('#shop_size').val(response.shop_size);
                                $('#user_status').val(response.status).change();
                                $('#select_spv').val(response.spv_id).change();
                                // $('#spv_id').val(response.spv_id);
                                // $('#spv_name').val(response.spv);
                                // Populasikan data detail lainnya sesuai kebutuhan

                                $('#modal-member-detail').modal('show');
                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });
            });
        </script>
        {{-- akhir member --}}
        {{-- shoplist --}}
        <script>
            $(document).ready(function() {
                var dataShopList = $('#dataShopList').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('set_periode_all') }}',
                    columns: [{
                            data: 'id',
                            name: 'id',
                            visible: false
                        },
                        {
                            data: 'shop_name',
                            name: 'shop_name'
                        },
                        {
                            data: 'shop_type',
                            name: 'shop_type'
                        },
                        {
                            data: 'shopsize1',
                            name: 'shopsize1'
                        },
                        {
                            data: 'city',
                            name: 'city'
                        },
                        {
                            data: 'region',
                            name: 'region'
                        },
                        {
                            data: 'data_collector',
                            name: 'data_collector'
                        },
                        {
                            data: 'spv',
                            name: 'spv'
                        },
                        {
                            // Column for Action buttons
                            data: null,
                            orderable: false,
                            searchable: false,
                            render: function(data, type, full, meta) {
                                if (data.detailchange) {
                                    if (data.detailchange.status == "0") {
                                        return '<button type="button" class="btn btn-secondary btn-sm showButton" data-id="' +
                                            btoa(data.detailchange.id) +
                                            '"><i class="fas fa-info"></i></button>' +
                                            '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' +
                                            data.ids + '"><i class="fas fa-trash"></i></button>';
                                    } else {
                                        return '<button type="button" class="btn btn-primary btn-sm editButton" data-id="' +
                                            data.ids + '"><i class="fas fa-edit"></i></button>' +
                                            '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' +
                                            data.ids + '"><i class="fas fa-trash"></i></button>';
                                    }
                                } else {
                                    return '<button type="button" class="btn btn-primary btn-sm editButton" data-id="' +
                                        data.ids + '"><i class="fas fa-edit"></i></button>' +
                                        '<button type="button" class="btn btn-danger btn-sm deleteButton" data-id="' +
                                        data.ids + '"><i class="fas fa-trash"></i></button>';
                                }

                            }
                        }
                    ]
                });
                $('#dataShopList').on('click', '.editButton', function() {
                    var id = $(this).data('id');

                    if (id) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('set_periode_get') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            success: function(response) {
                                // Menampilkan data detail di modal
                                $('#id').val(response.detailData.id);
                                $('#gsnr_id').val(response.detailData.gsnr);
                                $('#project').val(response.detailData.project).change();
                                $('#shop_name').val(response.detailData.shop_name);
                                $('#channel_name').val(response.detailData.channel_name).change();
                                $('#organisat_type').val(response.detailData.organisat_type)
                                    .change();
                                $('#metode_konversi').val(response.detailData.metode_konversi)
                                    .change();
                                $('#base_staff').val(response.detailData.base_staff).change();
                                $('#city').val(response.detailData.city).change();
                                $('#shop_type').val(response.detailData.shop_type).change();
                                $('#region').val(response.detailData.region).change();
                                $('#region2').val(response.detailData.region2).change();
                                $('#shop_size').val(response.detailData.shopsize1).change();
                                $('#sample_status').val(response.detailData.sample_status).change();
                                $('#collector').val(response.detailData.data_collector).change();
                                $('#spv_id').val(response.detailData.spv_id);
                                $('#spv_name').val(response.detailData.spv).change();
                                // Populasikan data detail lainnya sesuai kebutuhan

                                $('#modal-shoplist-detail').modal('show');
                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });

                $('#dataShopList').on('click', '.showButton', function() {
                    var id = $(this).data('id');

                    if (id) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('shop_detail_change_show', 'id') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            beforeSend: function() {
                                $('#shoplist-changed-show').empty();
                                $('#action-changed').empty();
                            },
                            success: function(response) {
                                $('#modal-shoplist-show').modal('show');
                                // Menampilkan data detail di modal
                                $('#shoplist-changed-show').append(`
                                <table class="table table-responsive table-hover">
                                    <tr>
                                        <td><b>Project</b></td>
                                        <td>` + response.currentdata.project + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.project + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Name</b></td>
                                        <td>` + response.currentdata.shop_name + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shop_name + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>City</b></td>
                                        <td>` + response.currentdata.city + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.city + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Channel Name</b></td>
                                        <td>` + response.currentdata.channel_name + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.channel_name + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Type</b></td>
                                        <td>` + response.currentdata.shop_type + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shop_type + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Region</b></td>
                                        <td>` + response.currentdata.region + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.region + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Region 2</b></td>
                                        <td>` + response.currentdata.region + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.region + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Organisat Type</b></td>
                                        <td>` + response.currentdata.organisat_type + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.organisat_type + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Size</b></td>
                                        <td>` + response.currentdata.shopsize1 + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shopsize1 + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Sample Status</b></td>
                                        <td>` + response.currentdata.sample_status + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.sample_status + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Metode Konversi</b></td>
                                        <td>` + response.currentdata.metode_konversi + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.metode_konversi + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Data Collector</b></td>
                                        <td>` + response.currentdata.data_collector + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.data_collector + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Base Staff</b></td>
                                        <td>` + response.currentdata.base_staff + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.base_staff + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Spv</b></td>
                                        <td>` + response.currentdata.spv + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.spv + `</td>
                                    </tr>
                                </table>`);

                                $('#action-changed').append(
                                    `<button type="button" class="btn btn-default" data-dismiss="modal"
                                    aria-label="Close">Cancel</button>
                                    <button type="button" class="btn btn-success approveButton" data-id="` + response
                                    .detailData.id + `">Setujui Perubahan</button>
                                    <button type="button" class="btn btn-danger rejectButton" data-id="` + response
                                    .detailData.id + `">Tolak Perubahan</button>`
                                );

                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });

                $('#action-changed').on('click', '.approveButton', function() {
                    var id = $(this).data('id');

                    if (id) {
                        // Tampilkan SweetAlert konfirmasi sebelum menghapus data
                        swal.fire({
                            title: 'Are you sure?',
                            text: "You want to approve change",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Jika pengguna mengonfirmasi untuk menghapus
                                $.ajax({
                                    url: "{{ route('shop_detail_change_update', 'id') }}",
                                    method: 'PUT',
                                    data: {
                                        id: id,
                                        status: "approve",
                                        _token: '{{ csrf_token() }}'
                                    },
                                    success: function(response) {
                                        // Tampilkan pemberitahuan bahwa data berhasil dihapus menggunakan SweetAlert
                                        swal.fire(
                                            'Success!',
                                            'Your data has been changed.',
                                            'success'
                                        );
                                        // Tambahkan kode untuk menghapus baris dari tabel jika diperlukan
                                        $("#dataShopList").DataTable().ajax.reload();
                                        $('#modal-shoplist-show').modal('hide');
                                    },
                                    error: function(xhr, status, error) {
                                        console.error(error);
                                        // Tampilkan pesan kesalahan jika terjadi kesalahan saat menghapus
                                        swal.fire(
                                            'Error!',
                                            'Failed to change data.',
                                            'error'
                                        );
                                    }
                                });
                            }
                        });
                    }
                });

                $('#action-changed').on('click', '.rejectButton', function() {
                    var id = $(this).data('id');

                    if (id) {
                        // Tampilkan SweetAlert konfirmasi sebelum menghapus data
                        swal.fire({
                            title: 'Are you sure?',
                            text: "You want to reject change",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Jika pengguna mengonfirmasi untuk menghapus
                                $.ajax({
                                    url: "{{ route('shop_detail_change_update', 'id') }}",
                                    method: 'PUT',
                                    data: {
                                        id: id,
                                        status: "reject",
                                        _token: '{{ csrf_token() }}'
                                    },
                                    success: function(response) {
                                        // Tampilkan pemberitahuan bahwa data berhasil dihapus menggunakan SweetAlert
                                        swal.fire(
                                            'Success!',
                                            'Your data has been reject.',
                                            'success'
                                        );
                                        // Tambahkan kode untuk menghapus baris dari tabel jika diperlukan
                                        $("#dataShopList").DataTable().ajax.reload();
                                        $('#modal-shoplist-show').modal('hide');
                                    },
                                    error: function(xhr, status, error) {
                                        console.error(error);
                                        // Tampilkan pesan kesalahan jika terjadi kesalahan saat menghapus
                                        swal.fire(
                                            'Error!',
                                            'Failed to reject data.',
                                            'error'
                                        );
                                    }
                                });
                            }
                        });
                    }
                });

                $('#dataShopList').on('click', '.deleteButton', function() {
                    var id = $(this).data('id');

                    if (id) {
                        // Tampilkan SweetAlert konfirmasi sebelum menghapus data
                        swal.fire({
                            title: 'Are you sure?',
                            text: "You won't be able to revert this!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Delete'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Jika pengguna mengonfirmasi untuk menghapus
                                $.ajax({
                                    url: '/shoplist/' + id,
                                    method: 'DELETE',
                                    success: function(response) {
                                        // Tampilkan pemberitahuan bahwa data berhasil dihapus menggunakan SweetAlert
                                        swal.fire(
                                            'Deleted!',
                                            'Your data has been deleted.',
                                            'success'
                                        );
                                        // Tambahkan kode untuk menghapus baris dari tabel jika diperlukan
                                    },
                                    error: function(xhr, status, error) {
                                        console.error(error);
                                        // Tampilkan pesan kesalahan jika terjadi kesalahan saat menghapus
                                        swal.fire(
                                            'Error!',
                                            'Failed to delete data.',
                                            'error'
                                        );
                                    }
                                });
                            }
                        });
                    }
                });
            });
        </script>
        {{-- akhir shoplist --}}
        {{-- shop list detail change --}}
        <script>
            $(document).ready(function() {
                var dataShopList = $('#dataShopListChange').DataTable({
                    processing: true,
                    serverSide: true,
                    scrollX: true,
                    ajax: '{{ route('shop_detail_change_all') }}',
                    columns: [{
                            data: 'DT_RowIndex',
                            searchable: false,
                            orderable: false,
                            name: 'DT_RowIndex',
                        },
                        {
                            data: 'shop_name',
                            name: 'shop_name'
                        },
                        {
                            data: 'shop_type',
                            name: 'shop_type'
                        },
                        {
                            data: 'shopsize1',
                            name: 'shopsize1'
                        },
                        {
                            data: 'city',
                            name: 'city'
                        },
                        {
                            data: 'region',
                            name: 'region'
                        },
                        {
                            data: 'status',
                            name: 'status'
                        },
                        {
                            data: 'spv',
                            name: 'spv'
                        },
                        {
                            data: 'aksi',
                            name: 'aksi'
                        }
                    ]
                });
                $('#dataShopListChange').on('click', '.editButton', function() {
                    var id = $(this).data('id');

                    if (id) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('set_periode_get') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            success: function(response) {
                                // Menampilkan data detail di modal
                                $('#id').val(response.detailData.id);
                                $('#gsnr_id').val(response.detailData.gsnr);
                                $('#project').val(response.detailData.project).change();
                                $('#shop_name').val(response.detailData.shop_name);
                                $('#channel_name').val(response.detailData.channel_name).change();
                                $('#organisat_type').val(response.detailData.organisat_type)
                                    .change();
                                $('#metode_konversi').val(response.detailData.metode_konversi)
                                    .change();
                                $('#base_staff').val(response.detailData.base_staff).change();
                                $('#city').val(response.detailData.city).change();
                                $('#shop_type').val(response.detailData.shop_type).change();
                                $('#region').val(response.detailData.region).change();
                                $('#region2').val(response.detailData.region2).change();
                                $('#shop_size').val(response.detailData.shopsize1).change();
                                $('#sample_status').val(response.detailData.sample_status).change();
                                $('#collector').val(response.detailData.data_collector).change();
                                $('#spv_id').val(response.detailData.spv_id);
                                $('#spv_name').val(response.detailData.spv).change();
                                // Populasikan data detail lainnya sesuai kebutuhan

                                $('#modal-shoplist-detail-change').modal('show');
                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });

                $('#dataShopListChange').on('click', '.showButton', function() {
                    var id = $(this).data('id');

                    if (id) { // Jika data ada
                        // Mengambil informasi detail dari sumber data lain berdasarkan ID atau informasi lainnya
                        $.ajax({
                            url: '{{ route('shop_detail_change_show', 'id') }}', // Ganti dengan URL yang sesuai
                            method: 'GET',
                            data: {
                                id: id
                            }, // Misalnya, mengirimkan ID dari baris yang diklik
                            beforeSend: function() {
                                $('#changed-show').empty();
                            },
                            success: function(response) {
                                // Menampilkan data detail di modal
                                $('#changed-show').append(`
                                <table class="table table-responsive table-hover">
                                    <tr>
                                        <td><b>Project</b></td>
                                        <td>` + response.currentdata.project + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.project + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Name</b></td>
                                        <td>` + response.currentdata.shop_name + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shop_name + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>City</b></td>
                                        <td>` + response.currentdata.city + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.city + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Channel Name</b></td>
                                        <td>` + response.currentdata.channel_name + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.channel_name + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Type</b></td>
                                        <td>` + response.currentdata.shop_type + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shop_type + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Region</b></td>
                                        <td>` + response.currentdata.region + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.region + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Region 2</b></td>
                                        <td>` + response.currentdata.region + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.region + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Organisat Type</b></td>
                                        <td>` + response.currentdata.organisat_type + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.organisat_type + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Shop Size</b></td>
                                        <td>` + response.currentdata.shopsize1 + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.shopsize1 + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Sample Status</b></td>
                                        <td>` + response.currentdata.sample_status + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.sample_status + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Metode Konversi</b></td>
                                        <td>` + response.currentdata.metode_konversi + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.metode_konversi + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Data Collector</b></td>
                                        <td>` + response.currentdata.data_collector + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.data_collector + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Base Staff</b></td>
                                        <td>` + response.currentdata.base_staff + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.base_staff + `</td>
                                    </tr>
                                    <tr>
                                        <td><b>Spv</b></td>
                                        <td>` + response.currentdata.spv + `</td>
                                        <td><i class='fas fa-angle-double-right'></i></td>
                                        <td>` + response.detailData.spv + `</td>
                                    </tr>
                                </table>`);
                                $('#modal-shoplist-detail-change-show').modal('show');
                            },
                            error: function(xhr, status, error) {
                                // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengambil data detail
                                console.error(error);
                            }
                        });
                    }
                });

                $('#dataShopListChange').on('click', '.deleteButton', function() {
                    var id = $(this).data('id');

                    if (id) {
                        // Tampilkan SweetAlert konfirmasi sebelum menghapus data
                        swal.fire({
                            title: 'Are you sure?',
                            text: "You won't be able to revert this!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Delete'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Jika pengguna mengonfirmasi untuk menghapus
                                $.ajax({
                                    url: '/shoplist/' + id,
                                    method: 'DELETE',
                                    success: function(response) {
                                        // Tampilkan pemberitahuan bahwa data berhasil dihapus menggunakan SweetAlert
                                        swal.fire(
                                            'Deleted!',
                                            'Your data has been deleted.',
                                            'success'
                                        );
                                        // Tambahkan kode untuk menghapus baris dari tabel jika diperlukan
                                    },
                                    error: function(xhr, status, error) {
                                        console.error(error);
                                        // Tampilkan pesan kesalahan jika terjadi kesalahan saat menghapus
                                        swal.fire(
                                            'Error!',
                                            'Failed to delete data.',
                                            'error'
                                        );
                                    }
                                });
                            }
                        });
                    }
                });
            });
        </script>
        {{-- akhir shop list detail change --}}
        {{-- my expense --}}
        <script>
            $(document).ready(function() {
                var dataClaimExpenses = $('#dataClaimExpenses').DataTable({
                    processing: true,
                    serverSide: true,
                    order: [
                        [1, 'asc']
                    ],
                    scrollX: true,
                    ajax: '{{ route('my_expense_all') }}',
                    columns: [
                        @if (session('status_user') == 'Supervisor' || session('status_user') == 'Administrator')
                            {
                                // Column for Action buttons
                                data: null,
                                orderable: false,
                                searchable: false,
                                render: function(data, type, full, meta) {
                                    return '<input class="checkbox-row" type="checkbox" id="checkbox" name="checkbox" value="' +
                                        data.ids + '">';
                                }
                            },
                        @endif {
                            data: 'no',
                            name: 'no',
                            width: '20px',
                            orderable: false,
                        },
                        {
                            data: 'employee_name',
                            name: 'employee_name',
                            width: '100px'
                        },
                        {
                            data: 'claim_date',
                            name: 'claim_date',
                            width: '100px'
                        },
                        {
                            data: 'project_name',
                            name: 'project_name',
                            width: '100px'
                        },
                        {
                            data: 'claim_type',
                            name: 'claim_type',
                            width: '100px'
                        },
                        {
                            data: 'expense_item',
                            name: 'expense_item',
                            width: '100px'
                        },
                        {
                            data: 'remarks',
                            name: 'remarks',
                            width: '150px'
                        },
                        {
                            data: 'amount',
                            name: 'amount',
                            width: '50px'
                        },
                        {
                            data: 'amount',
                            name: 'amount',
                            width: '50px'
                        },
                        {
                            // Column for Action buttons
                            data: null,
                            orderable: false,
                            searchable: false,
                            render: function(data, type, full, meta) {
                                return '<a href="{{ asset('assets / img ') }}/' +
                                    data.image +
                                    '" data-toggle="lightbox" data-title="Bukti" data-gallery="gallery">Show</a>';
                            },
                            width: '100px'
                        },
                        {
                            // Column for Action buttons
                            data: null,
                            orderable: false,
                            searchable: false,
                            render: function(data, type, full, meta) {
                                if (data.approved_status == 'Wait') {
                                    return data.approved_status;
                                } else {
                                    var approvedAtDate = new Date(data.approved_at);
                                    var formattedDate = approvedAtDate.toLocaleDateString(
                                        'en-GB'); // Format the date as 'dd/mm/yyyy'
                                    return data.approved_status + ' by ' + data.approved_by + ' at ' +
                                        formattedDate;
                                }
                            },
                            width: '200px'
                        },
                        @if (session('status_user') == 'Supervisor' || session('status_user') == 'Administrator')
                            {
                                // Column for Action buttons
                                data: null,
                                orderable: false,
                                searchable: false,
                                render: function(data, type, full, meta) {
                                    return '<div class="btn-group" role="group">' +
                                        '<button class="btn btn-success btn-sm btn-approve" id="btn-approve" data-expense-id=' +
                                        data.ids +
                                        ' aria-label="Approve" title="Approve"><i class="fas fa-check"></i></button>' +
                                        '<button class="btn btn-danger btn-sm btn-reject" id="btn-reject" data-expense-id=' +
                                        data.ids +
                                        ' aria-label="Reject" title="Reject"><i class="fas fa-times"></i></button>' +
                                        '</div>';
                                },
                                width: '100px'
                            }, {
                                // Column for Action buttons
                                data: null,
                                orderable: false,
                                searchable: false,
                                render: function(data, type, full, meta) {
                                    return '<textarea id="notes" name="notes"></textarea>';
                                },
                                width: '150px'
                            },
                        @endif
                    ],
                    columnDefs: [{
                        targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                        className: 'dt-center'
                    }]
                });
                $('#claim_type').on('change', function() {
                    $('#expense_categorys').find('option')
                        .remove()
                        .end()
                    var data = [];
                    if (this.value == "travel") {
                        data = [{
                            text: 'Travel Allowance'
                        }];
                    } else {
                        data = [{
                            text: 'Courier'
                        }, {
                            text: 'Internet'
                        }, {
                            text: 'Local Transport'
                        }, {
                            text: 'Office Supplier'
                        }, {
                            text: 'PC Allowance'
                        }, {
                            text: 'Training'
                        }];
                    }
                    $.each(data, function(index, e) {
                        $('#expense_categorys').append($('<option>', {
                            value: e.text,
                            text: e.text
                        })).trigger('change');
                    });
                });

                $('#expense_categorys').on('change', function() {
                    // alert(this.value)
                    $('#expense_items').find('option')
                        .remove()
                        .end()
                    var data = [];
                    if (this.value == "Travel Allowance") {
                        data = [{
                            text: 'Travel Allowance'
                        }];
                    } else if (this.value == "Courier") {
                        data = [{
                            text: 'Courier'
                        }];
                    } else if (this.value == "Internet") {
                        data = [{
                            text: 'Internet'
                        }];
                    } else if (this.value == "Local Transport") {
                        data = [{
                            text: 'Bus'
                        }, {
                            text: 'MRT'
                        }, {
                            text: 'Taxi'
                        }, {
                            text: 'Own Car'
                        }, {
                            text: 'Two Wheel Vehicle'
                        }, {
                            text: 'Others'
                        }];
                    } else if (this.value == "Office Supplier") {
                        data = [{
                            text: 'Print'
                        }, {
                            text: 'Stationery'
                        }, {
                            text: 'Copy'
                        }];
                    } else if (this.value == "PC Allowance") {
                        data = [{
                            text: 'PC Allowance'
                        }];
                    } else {
                        data = [{
                            text: 'Training Cost'
                        }];
                    }
                    $.each(data, function(index, e) {
                        $('#expense_items').append($('<option>', {
                            value: e.text,
                            text: e.text
                        })).trigger('change');
                    });
                });
                // Checkbox in table header to toggle all checkboxes
                $('#check_all').on('change', function() {
                    var checkboxes = $('#dataClaimExpenses').find('tbody input[type="checkbox"]');
                    checkboxes.prop('checked', $(this).prop('checked'));
                });

                // Lakukan operasi approve pada expense tertentu
                $(document).on('click', '.btn-approve', function() {
                    var expenseId = $(this).data('expense-id');
                    $.ajax({
                        url: '{{ route('expense_approve') }}',
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {
                            expense_id: expenseId
                        },
                        success: function(response) {
                            Toast.fire({
                                icon: 'success',
                                title: response.message
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        },
                        error: function(xhr, status, error) {
                            Toast.fire({
                                icon: 'error',
                                title: 'Harap ulangi kembali!'
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        }
                    });
                });

                // Lakukan operasi reject pada expense tertentu
                $(document).on('click', '.btn-reject', function() {
                    var expenseId = $(this).data('expense-id');
                    $.ajax({
                        url: '{{ route('expense_reject') }}',
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {
                            expense_id: expenseId
                        },
                        success: function(response) {
                            Toast.fire({
                                icon: 'success',
                                title: response.message
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        },
                        error: function(xhr, status, error) {
                            Toast.fire({
                                icon: 'error',
                                title: 'Harap ulangi kembali!'
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        }
                    });
                });

                // Lakukan operasi approve all expenses yang dipilih
                $('#btn-approve-all').on('click', function() {
                    var allExpenses = []; // Simpan semua ID expense yang ada
                    $('input.checkbox-row:checked').each(function() {
                        allExpenses.push($(this).val());
                    });
                    $.ajax({
                        url: '{{ route('expense_approve_all') }}',
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {
                            all_expenses: allExpenses
                        },
                        success: function(response) {
                            Toast.fire({
                                icon: 'success',
                                title: response.message
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        },
                        error: function(xhr, status, error) {
                            Toast.fire({
                                icon: 'error',
                                title: 'Harap ulangi kembali!'
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        }
                    });
                });

                // Lakukan operasi reject all expenses yang dipilih
                $('#btn-reject-all').on('click', function() {
                    var allExpenses = []; // Simpan semua ID expense yang ada
                    $('input.checkbox-row:checked').each(function() {
                        allExpenses.push($(this).val());
                    });
                    console.log(allExpenses);
                    $.ajax({
                        url: '{{ route('expense_reject_all') }}',
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {
                            all_expenses: allExpenses
                        },
                        success: function(response) {
                            Toast.fire({
                                icon: 'success',
                                title: response.message
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        },
                        error: function(xhr, status, error) {
                            Toast.fire({
                                icon: 'error',
                                title: 'Harap ulangi kembali!'
                            }).then(function() {
                                dataClaimExpenses.ajax.reload();
                            });
                        }
                    });
                });

                $('#check_all_event').on('change', function() {
                    var checkboxes = $('#dataTimesheetExpenses').find('tbody input[type="checkbox"]');
                    checkboxes.prop('checked', $(this).prop('checked'));
                });

                var dataTimesheetExpenses = $('#dataTimesheetExpenses').DataTable({
                    scrollX: true,
                    processing: true,
                    serverSide: true,
                    order: [
                        [1, 'asc']
                    ],
                    ajax: '{{ route('my_expense_timesheet') }}',
                    columns: [
                        @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                            {
                                data: 'check',
                                searchable: false,
                                orderable: false,
                                name: 'check',
                            },
                        @endif {
                            data: 'DT_RowIndex',
                            searchable: false,
                            orderable: false,
                            name: 'DT_RowIndex',
                        },
                        @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                            {
                                data: 'user.name',
                                name: 'user.name'
                            },
                        @endif {
                            data: 'financial.location',
                            name: 'financial.location'
                        },
                        @if (auth()->user()->status != 'col')
                            {
                                data: 'totalwork',
                                name: 'totalwork'
                            },
                        @endif {
                            data: 'financial.dailyfee',
                            name: 'financial.dailyfee'
                        },
                        {
                            data: 'total',
                            name: 'total'
                        },
                        {
                            data: 'user.detail.bank_full_name',
                            name: 'user.detail.bank_full_name'
                        },
                        {
                            data: 'user.detail.bank_account_number',
                            name: 'user.detail.bank_account_number'
                        },
                        {
                            data: 'total',
                            name: 'total'
                        },
                        {
                            data: 'approved_status',
                            name: 'approved_status'
                        },
                        @if (auth()->user()->status == 'spv' || auth()->user()->status == 'adm')
                            {
                                data: 'action',
                                name: 'action'
                            }
                        @endif
                    ]
                });
            });

            $(document).on('click', '.btn-approve-event', function() {
                var eventId = $(this).data('expense-id');
                var event = [];
                event.push(eventId);
                $.ajax({
                    url: '{{ route('event_approve') }}',
                    type: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        event_id: event
                    },
                    success: function(response) {
                        Toast.fire({
                            icon: 'success',
                            title: response.message
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    },
                    error: function(xhr, status, error) {
                        Toast.fire({
                            icon: 'error',
                            title: 'Harap ulangi kembali!'
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    }
                });
            });

            // Lakukan operasi reject pada expense tertentu
            $(document).on('click', '.btn-reject-event', function() {
                var eventId = $(this).data('expense-id');
                var event = [];
                event.push(eventId);
                $.ajax({
                    url: '{{ route('event_reject') }}',
                    type: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        event_id: event
                    },
                    success: function(response) {
                        Toast.fire({
                            icon: 'success',
                            title: response.message
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    },
                    error: function(xhr, status, error) {
                        Toast.fire({
                            icon: 'error',
                            title: 'Harap ulangi kembali!'
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    }
                });
            });

            // Lakukan operasi approve all expenses yang dipilih
            $('#btn-approve-all-event').on('click', function() {
                var allEvent = []; // Simpan semua ID expense yang ada
                $('input.checkbox-row:checked').each(function() {
                    allEvent.push($(this).val());
                });
                $.ajax({
                    url: '{{ route('event_approve') }}',
                    type: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        event_id: allEvent
                    },
                    success: function(response) {
                        Toast.fire({
                            icon: 'success',
                            title: response.message
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    },
                    error: function(xhr, status, error) {
                        Toast.fire({
                            icon: 'error',
                            title: 'Harap ulangi kembali!'
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    }
                });
            });

            // Lakukan operasi reject all expenses yang dipilih
            $('#btn-reject-all-event').on('click', function() {
                var allEvents = []; // Simpan semua ID expense yang ada
                $('input.checkbox-row:checked').each(function() {
                    allEvents.push($(this).val());
                });
                console.log(allEvents);
                $.ajax({
                    url: '{{ route('event_reject') }}',
                    type: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        event_id: allEvents
                    },
                    success: function(response) {
                        Toast.fire({
                            icon: 'success',
                            title: response.message
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    },
                    error: function(xhr, status, error) {
                        Toast.fire({
                            icon: 'error',
                            title: 'Harap ulangi kembali!'
                        }).then(function() {
                            $("#dataTimesheetExpenses").DataTable().ajax.reload();
                        });
                    }
                });
            });
        </script>
        {{-- akhir my expense --}}
        {{-- timesheet --}}
        <script>
            $(document).ready(function() {
                var date = new Date();
                var d = date.getDate(),
                    m = date.getMonth(),
                    y = date.getFullYear();

                var Calendar = FullCalendar.Calendar;
                var calendarEl = document.getElementById('calendar');
                var siklus = [];
                @isset($events)
                    {
                        siklus = @json($events);
                    }
                @else
                    []
                @endisset
                if (calendarEl != null) {
                    var calendar = new Calendar(calendarEl, {
                        themeSystem: 'bootstrap',
                        events: siklus,
                        editable: true,
                        eventRender: function(info) {
                            var tooltip = new bootstrap.Tooltip(info.el, {
                                title: info.event.title + '<br>' + 'Start: ' + info.event.start
                                    .toLocaleTimeString() + '<br>' + 'End: ' + info.event.end
                                    .toLocaleTimeString(),
                                placement: 'top',
                                html: true,
                                trigger: 'hover',
                                container: 'body'
                            });
                        },
                        dateClick: function(info) {
                            $('#eventModal').modal('show');
                            $('#eventDate').val(info.dateStr);
                            $('#eventId').val('');
                            $('#eventTitle').val('');
                            $('#eventStartTime').val('');
                            $('#eventEndTime').val('');
                        },
                        eventClick: function(info) {
                            $('#eventModalLabel').text('Edit Event');
                            $('#eventId').val(info.event.id).change();
                            $('#eventTitle').val(info.event.title).change();
                            var startTime = info.event.start.getHours().toString().padStart(2, '0') + ':' +
                                info
                                .event.start.getMinutes().toString().padStart(2, '0');
                            var endTime = info.event.end.getHours().toString().padStart(2, '0') + ':' + info
                                .event.end.getMinutes().toString().padStart(2, '0');

                            // Format start and end dates to 'Y-m-d' format
                            var startDateString = formatDate(info.event.start);
                            var endDateString = formatDate(info.event.end);

                            $('#eventStartTime').val(startTime).change();
                            $('#eventEndTime').val(endTime).change();
                            $('#eventDate').val(startDateString);
                            $('#eventModal').modal('show');
                        }
                    });

                    calendar.render();
                }

                // Save Event
                $('#saveEvent').on('click', function() {
                    var title = $('#eventTitle').val();
                    var startTime = $('#eventStartTime').val();
                    var endTime = $('#eventEndTime').val();
                    var date = $('#eventDate').val();
                    var eventId = $('#eventId').val();
                    if (title && date && startTime && endTime) {
                        if (eventId) {
                            // Edit existing event
                            var event = calendar.getEventById(eventId);
                            event.setProp('title', title);
                            event.setStart(date + 'T' + startTime);
                            event.setEnd(date + 'T' + endTime);
                        } else {
                            // Add new event
                            $.ajax({
                                url: '{{ route('check_date_event') }}',
                                method: 'GET',
                                data: {
                                    start: date,
                                    startTime: date + ' ' + startTime + ':00',
                                    _token: '{{ csrf_token() }}'
                                },
                                dataType: "json",
                                success: function(res) {

                                    if (res.status == 200) {
                                        calendar.addEvent({
                                            id: generateId(),
                                            title: title,
                                            start: date + 'T' + startTime,
                                            end: date + 'T' + endTime,
                                            allDay: false
                                        });
                                    } else {
                                        Toast.fire({
                                            icon: 'error',
                                            title: res.msg
                                        })
                                    }

                                }
                            });

                        }
                        $('#eventModal').modal('hide');
                        $('#eventId').val('');
                        $('#eventTitle').val('');
                        $('#eventStartTime').val('');
                        $('#eventEndTime').val('');
                        $('#eventDate').val('');
                    } else {
                        alert('Please enter title, start time, end time, and date');
                    }
                });
                // Save Event
                $('#saveTimesheet').on('click', function() {
                    var events = [];

                    calendar.getEvents().forEach(function(event) {
                        var eventData = {
                            id: event.id,
                            title: event.title,
                            start: event.startStr,
                            end: event.endStr
                        };
                        events.push(eventData);
                    });

                    $.ajax({
                        type: 'POST',
                        url: '/timesheet-add',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: JSON.stringify({
                            schedule: events
                        }), // Send data as JSON string
                        contentType: 'application/json', // Set content type to JSON
                        success: function(response) {
                            Toast.fire({
                                icon: 'success',
                                title: 'Timesheet Saved Successfully'
                            })
                        },
                        error: function(xhr, status, error) {
                            Toast.fire({
                                icon: 'error',
                                title: 'Timesheet Not Saved Successfully, Please Try Again!'
                            })
                        }
                    });
                });

                $('#submitTimesheet').on('click', function() {
                    var events = [];

                    calendar.getEvents().forEach(function(event) {
                        var eventData = {
                            id: event.id,
                            title: event.title,
                            start: event.startStr,
                            end: event.endStr
                        };
                        events.push(eventData);
                    });
                    swal.fire({
                        title: 'Are you sure you want to submit?',
                        text: "You cannot edit data after submitting it",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Jika pengguna mengonfirmasi untuk menghapus
                            $.ajax({
                                type: 'POST',
                                url: '/timesheet-submit',
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                },
                                data: JSON.stringify({
                                    schedule: events
                                }), // Send data as JSON string
                                contentType: 'application/json', // Set content type to JSON
                                success: function(response) {
                                    Toast.fire({
                                        icon: 'success',
                                        title: 'Timesheet Submit Successfully'
                                    })
                                },
                                error: function(xhr, status, error) {
                                    Toast.fire({
                                        icon: 'error',
                                        title: 'Timesheet Not Submit Successfully, Please Try Again!'
                                    })
                                }
                            });
                        }
                    });
                });
            });
        </script>
        {{-- akhir timesheet --}}
        <script>
            $(document).ready(function() {
                if ($("#gsnr_id").length) {
                    $("#gsnr_id").autocomplete({
                        source: function(request, response) {
                            $.ajax({
                                url: "/data-collection-get-gsnr", // Ganti dengan URL yang sesuai
                                method: 'GET',
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response(data);
                                }
                            });
                        },
                        minLength: 2,
                        select: function(event, ui) {
                            // $("#nameofshop").val(ui.item.value);
                            $("#gsnr_id").val(ui.item.label); // Jika Anda juga ingin mengisi gsnr_id
                            return false;
                        },
                        focus: function(event, ui) {
                            // $("#nameofshop").val(ui.item.value);
                            $("#gsnr_id").val(ui.item.label); // Jika Anda juga ingin mengisi gsnr_id
                            return false;
                        }
                    }).data("ui-autocomplete")._renderItem = function(ul, item) {
                        return $("<li>")
                            .append("<div>" + item.value + "</div>")
                            .appendTo(ul);
                    };
                }
                $('#expense_category').on('change', function() {
                    var category = $(this).val();
                    $('#expense_item')
                        .empty(); // Mengosongkan elemen expense_item sebelum menambahkan opsi yang sesuai
                    switch (category) {
                        case 'Airfare':
                            $('#expense_item').append(
                                '<option></option>');
                            break;
                        case 'HotelPayment':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="HotelUpcountry">Hotel Upcountry</option>');
                            $('#expense_item').append('<option value="HotelOverseas">Hotel Overseas</option>');
                            break;
                        case 'LocalTransportOverseas':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="TaxiOverseas">Taxi Overseas</option>');
                            $('#expense_item').append('<option value="TrainOverseas">Train Overseas</option>');
                            break;
                        case 'LocalTransportUpcountry':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="TaxiUpcountry">Taxi Upcountry</option>');
                            $('#expense_item').append(
                                '<option value="Train/BusUpcountry">Train/Bus Upcountry</option>');
                            $('#expense_item').append('<option value="BoatUpcountry">Boat Upcountry</option>');
                            break;
                        case 'TravelAllowance':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="TravelAllowance">Travel Allowance</option>');
                            break;
                        case 'ClientEntertainment':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="ClientEntertainment">Client Entertainment</option>');
                            break;
                        case 'Courier':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="Courier">Courier</option>');
                            break;
                        case 'Internet':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="Internet">Internet</option>');
                            break;
                        case 'Newspaper':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="Newspaper">Newspaper</option>');
                            break;
                        case 'OfficeSupplier':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="Print">Print</option>');
                            $('#expense_item').append('<option value="Stationery">Stationery</option>');
                            $('#expense_item').append('<option value="Copy">Copy</option>');
                            break;
                        case 'Salary':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="MedicalReimbursement">Medical Reimbursement</option>');
                            break;
                        case 'Telephone':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="Telephone-LandLine">Telephone-Land Line</option>');
                            $('#expense_item').append(
                                '<option value="Telephone-Mobile">Telephone-Mobile</option>');
                            break;
                        case 'PCAllowance':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="PCAllowance">PC Allowance</option>');
                            break;
                        case 'Utilities':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="ElectricalFees">Electrical Fees</option>');
                            $('#expense_item').append('<option value="WaterFees">Water Fees</option>');
                            $('#expense_item').append(
                                '<option value="CleaningServices">Cleaning Services</option>');
                            $('#expense_item').append(
                                '<option value="MaintenanceFees">Maintenance Fees</option>');
                            break;
                        case 'Otherofficeexpenses':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="SocialCosts">Social Costs</option>');
                            $('#expense_item').append('<option value="MinorAssets">Minor Assets</option>');
                            break;
                        case 'Training':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append('<option value="TrainingCosts">Training Costs</option>');
                            break;
                        case 'Entertainment':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="StaffEntertainment(OT)">Staff Entertainment (OT)</option>');
                            $('#expense_item').append(
                                '<option value="OverseaVisitorsEntertainment">Oversea Visitors Entertainment</option>'
                            );
                            break;
                        case 'LocalTransport':
                            $('#expense_item').append(
                                '<option></option>');
                            $('#expense_item').append(
                                '<option value="LocalTransport-Bus">Local Transport - Bus</option>');
                            $('#expense_item').append(
                                '<option value="LocalTransport-MRT">Local Transport - MRT</option>');
                            $('#expense_item').append(
                                '<option value="LocalTransport-Taxi">Local Transport - Taxi</option>');
                            $('#expense_item').append(
                                '<option value="LocalTransport-OwnCar">Local Transport - Own Car</option>');
                            $('#expense_item').append(
                                '<option value="LocalTransport-TwoWheelVehicle">Local Transport - Two Wheel Vehicle</option>'
                            );
                            $('#expense_item').append(
                                '<option value="LocalTransport-Others">Local Transport - Others</option>');
                            break;
                        default:
                            break;
                    }
                });
            });
        </script>
        {{-- kumpulan function --}}
        <script>
            const x = document.getElementById("demo");
            $(document).on("click", '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox({
                    alwaysShowClose: true,
                });
            });

            function generateId() {
                // Example: Generate a random UUID
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
                    var r = Math.random() * 16 | 0,
                        v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            }

            function formatDate(date) {
                var year = date.getFullYear();
                var month = String(date.getMonth() + 1).padStart(2, '0');
                var day = String(date.getDate()).padStart(2, '0');
                return year + '-' + month + '-' + day;
            }

            function changeCollectionStatus(value) {
                if (value == "collected") {
                    $('#show-collected').css('display', '');
                    $('#show-uncollected').css('display', 'none');
                } else if (value == "uncollected") {
                    $('#show-collected').css('display', 'none');
                    $('#show-uncollected').css('display', '');
                } else {
                    $('#show-collected').css('display', 'none');
                    $('#show-uncollected').css('display', 'none');
                }
            }

            function changeNewModel(value) {
                if (value == "no") {
                    $('#show-new-model-no').css('display', '');
                } else {
                    $('#show-new-model-no').css('display', 'none');
                }
            }

            function changeRecruitStatus(value) {
                if (value == "no") {
                    $('#show-no-recruit').css('display', '');
                } else {
                    $('#show-no-recruit').css('display', 'none');
                }
            }

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.watchPosition(showPosition);
                } else {
                    x.innerHTML = `<span id="status-dot" class="dot offline"></span>`;

                }
            }

            function showPosition(position) {
                x.innerHTML = `<span id="status-dot" class="dot online"></span>`;
                $('#latitude').val(position.coords.latitude).change();
                $('#longitude').val(position.coords.longitude).change();
            }

            function formatRupiah(angka) {
                if (angka.length) {
                    angka = angka.replace(/\./g, ',');
                    angka = angka.replace(/[^\d,]/g, '');
                    var parts = angka.split(',');
                    var ribuan = parts[0];
                    var desimal = parts[1] || '00';
                    var reverse = ribuan.toString().split('').reverse().join('');
                    var ribuanFormatted = reverse.match(/\d{1,3}/g).join('.').split('').reverse().join('');
                    return 'Rp. ' + ribuanFormatted + ',' + desimal;
                } else {
                    return "";
                }
            }
        </script>
        <script>
            $(document).ready(function() {
                var selectedValue = $('#project_type').val();
                $('#project_type').on('change', function() {
                    selectedValue = $(this).val();
                    if (selectedValue === 'adhoc') {
                        $('#wbs_number').attr('required', 'required');
                    } else {
                        $('#wbs_number').removeAttr('required');
                    }
                });
            });

            $("#your_task").change(function(e) {
                e.preventDefault();
                if (this.value == "todo") {
                    $("#todo").show();
                    $("#finance").hide();
                    $("#expenses").hide();
                    $("#reportfinance").val('').trigger('change');
                    $("#reportexpenses").val('').trigger('change');
                    $("#periode_num").val('').trigger('change');
                } else if (this.value == "project") {
                    $("#todo").hide();
                    $("#finance").hide();
                    $("#expenses").hide();
                    $("#reportfinance").val('').trigger('change');
                    $("#reportexpenses").val('').trigger('change');
                    $("#reporttodo").val('').trigger('change');
                    $("#periode_num").val('').trigger('change');
                } else if (this.value == "expenses") {
                    $("#todo").hide();
                    $("#finance").hide();
                    $("#expenses").show();
                    $("#reportfinance").val('').trigger('change');
                    $("#reporttodo").val('').trigger('change');
                    $("#periode_num").val('').trigger('change');
                } else {
                    $("#todo").hide();
                    $("#finance").show();
                    $("#expenses").hide();
                    $("#reportexpenses").val('').trigger('change');
                    $("#reporttodo").val('').trigger('change');
                    $("#periode_num").val('').trigger('change');
                }
            });
        </script>
        {{-- financial detail --}}
        <script>
            $(document).ready(function() {
                list_financial_details();
                editFinance();
                $('#user_id').select2({
                    dropdownParent: $('#modal-add-financialDetails'),
                    placeholder: "choose Employe Name",
                    width: 'auto',
                    allowClear: true,
                });
                $('#start_dateEdt').daterangepicker({
                    singleDatePicker: true,
                    autoUpdateInput: false,
                    locale: {
                        cancelLabel: 'Clear',
                        format: 'DD/MM/YYYY'
                    }
                });

                $('#end_dateEdt').daterangepicker({
                    singleDatePicker: true,
                    autoUpdateInput: false,
                    locale: {
                        cancelLabel: 'Clear',
                        format: 'DD/MM/YYYY'
                    }
                });

                $('#start_dateEdt').on('apply.daterangepicker', function(ev, picker) {
                    $(this).val(picker.startDate.format('DD/MM/YYYY'));
                });
                $('#start_dateEdt').on('cancel.daterangepicker', function(ev, picker) {
                    $(this).val('');
                });

                $('#end_dateEdt').on('apply.daterangepicker', function(ev, picker) {
                    $(this).val(picker.endDate.format('DD/MM/YYYY'));
                });
                $('#end_dateEdt').on('cancel.daterangepicker', function(ev, picker) {
                    $(this).val('');
                });
            });

            function list_financial_details() {
                var tableFinancialDetail = $('#dataFinancialDetail').DataTable({

                    processing: true,
                    serverSide: true,
                    "bDestroy": true,
                    searching: false,
                    ajax: {
                        url: "{{ route('financial_details.index') }}",
                    },
                    columns: [{
                            data: 'DT_RowIndex',
                            searchable: false,
                            orderable: false,
                            name: 'DT_RowIndex',
                            className: "text-center"
                        },
                        {
                            data: 'user.name',
                            name: 'user.name',
                            className: "text-center"
                        },
                        {
                            data: 'role',
                            name: 'role',
                        },
                        {
                            data: 'dailyfee',
                            name: 'dailyfee'
                        },
                        {
                            data: 'joindate',
                            name: 'joindate'
                        },
                        {
                            data: 'contract',
                            name: 'contract',
                            className: "text-center"
                        },
                        {
                            data: 'status',
                            name: 'status'
                        },
                        {
                            data: 'action',
                            name: 'action',
                            className: "text-center"
                        },
                    ]
                });
                return tableFinancialDetail;
            }

            $('#btnSubmitFinancialDetails').on('click', function(e) {
                e.preventDefault();
                var form = $('#formFinancialDetail')[0];
                var data = new FormData(form);
                var url = '{{ route('financial_details.store') }}';
                $.ajax({
                    url: url,
                    type: "POST",
                    data: data,
                    dataType: "json",
                    contentType: false,
                    cache: false,
                    processData: false,
                    beforeSend: function() {

                        $('.progress').show();
                    },
                    success: function(res) {
                        if (res.status == 200) {
                            Toast.fire({
                                icon: 'success',
                                title: res.msg
                            }).then(function() {
                                $('#dataFinancialDetail').DataTable().ajax.reload();
                            });
                        }
                        $('#formFinancialDetail').get(0).reset();
                        $("#modal-add-financialDetails").modal('hide');
                    },
                    error: function(xhr) {
                        if (xhr.status == 422) {
                            var errors = xhr.responseJSON.errors

                            $.map(errors, function(val, index) {
                                Toast.fire({
                                    icon: 'error',
                                    title: val
                                }).then(function() {
                                    $('#dataFinancialDetail').DataTable().ajax.reload();
                                });
                            });
                        }
                    },
                    complete: function() {
                        $('.progress').hide();
                    }
                })
            });

            function editFinance() {
                $(document).on('click', '.btnEditFinance', function(e) {
                    e.preventDefault();
                    let id = $(this).data('id');
                    var url = "{{ route('financial_details.edit', 'id') }}";
                    url = url.replace('id', id);
                    $.ajax({
                        url: url,
                        method: 'GET',
                        data: {
                            id: id,
                            _token: '{{ csrf_token() }}'
                        },
                        dataType: "json",
                        success: function(res) {
                            $('#idEdt').val(res.id);
                            $('#user_idEdt').val(res.user_id).trigger('change');
                            $('#statusEdt').val(res.status).trigger('change');
                            $('#locationEdt').val(res.location);
                            $('#dailyfeeEdt').val(res.dailyfee);
                            $('#start_dateEdt').val(res.start_dateEdt);
                            $('#end_dateEdt').val(res.end_dateEdt);
                        }
                    });
                });
            }

            $('#btnUpdateFinancialDetails').on('click', function(e) {
                e.preventDefault();
                var form = $('#formEditFinancialDetail')[0];
                var data = new FormData(form);
                var url = '{{ route('update_contract') }}';

                $.ajax({
                    url: url,
                    type: "POST",
                    data: data,
                    dataType: "json",
                    contentType: false,
                    cache: false,
                    processData: false,
                    beforeSend: function() {

                        $('.progress').show();
                    },
                    success: function(res) {
                        if (res.status == 200) {
                            Toast.fire({
                                icon: 'success',
                                title: res.msg
                            }).then(function() {
                                $('#dataFinancialDetail').DataTable().ajax.reload();
                            });
                        }
                        $('#formEditFinancialDetail').get(0).reset();
                        $("#modal-edit-financialDetails").modal('hide');
                    },
                    error: function(xhr) {
                        if (xhr.status == 422) {
                            var errors = xhr.responseJSON.errors

                            $.map(errors, function(val, index) {
                                Toast.fire({
                                    icon: 'error',
                                    title: val
                                }).then(function() {
                                    $('#dataFinancialDetail').DataTable().ajax.reload();
                                });
                            });
                        }
                    },
                    complete: function() {
                        $('.progress').hide();
                    }
                })
            });

            $(document).on('click', '.btnDeleteFinance', function(e) {
                e.preventDefault();
                let id = $(this).data('id');
                var url = "{{ route('financial_details.destroy', 'id') }}";
                url = url.replace('id', id);
                Swal.fire({
                    title: 'Are You Sure?',
                    text: "Want to Delete this Data?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#4fa7f3',
                    cancelButtonColor: '#d57171',
                    confirmButtonText: 'Yes'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: url,
                            method: 'delete',
                            data: {
                                id: id,
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(res) {
                                Toast.fire({
                                    icon: 'success',
                                    title: res.msg
                                }).then(function() {
                                    $('#dataFinancialDetail').DataTable().ajax.reload();
                                });
                            }
                        });
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function() {
                list_collection();
                collectionDetail();
            });

            function list_collection() {
                var datacollection = $('#data-collection').DataTable({

                    processing: true,
                    serverSide: true,
                    "bDestroy": true,
                    searching: false,
                    ajax: {
                        url: "{{ route('getTableCollection') }}",
                        data: function(d) {
                            d.city = $('#city').val()
                            d.region = $('#region').val()
                            d.spv = $('#spv').val()
                        },
                    },
                    columns: [{
                            data: 'DT_RowIndex',
                            searchable: false,
                            orderable: false,
                            name: 'DT_RowIndex',
                            className: "text-center"
                        },
                        @if (auth()->user()->status == 'adm' || auth()->user()->status == 'spv')
                            {
                                data: 'collection_staffname',
                                name: 'collection_staffname',
                                className: "text-center"
                            },
                        @endif {
                            data: 'periode_name',
                            name: 'periode_name',
                            className: "text-center"
                        },
                        {
                            data: 'nameofshop',
                            name: 'nameofshop',
                        },
                        {
                            data: 'collection_status',
                            name: 'collection_status'
                        },
                        @if (auth()->user()->status == 'adm' || auth()->user()->status == 'spv')
                            {
                                data: 'action',
                                name: 'action',
                                className: "text-center"
                            }
                        @endif
                    ]
                });
                $("#city").change(function(e) {
                    e.preventDefault();
                    datacollection.draw();
                });
                $("#region").change(function(e) {
                    e.preventDefault();
                    datacollection.draw();
                });
                $("#spv").change(function(e) {
                    e.preventDefault();
                    datacollection.draw();
                });
                return datacollection;
            }

            function collectionDetail() {

                $(document).on('click', '.btnShowCollection', function(e) {
                    e.preventDefault();
                    let id = $(this).data('id');
                    var url = "{{ route('getTableCollectionDetail', 'id') }}";
                    url = url.replace('id', id);
                    var datacollectiondetail = $('#data-collection-detail').DataTable({
                        processing: true,
                        serverSide: true,
                        "bDestroy": true,
                        searching: false,
                        ajax: {
                            url: url,
                        },
                        columns: [{
                                data: 'DT_RowIndex',
                                searchable: false,
                                orderable: false,
                                name: 'DT_RowIndex',
                                className: "text-center"
                            },
                            {
                                data: 'collection_staffname',
                                name: 'collection_staffname',
                                className: "text-center"
                            },
                            {
                                data: 'periode_name',
                                name: 'periode_name',
                                className: "text-center"
                            },
                            {
                                data: 'nameofshop',
                                name: 'nameofshop',
                            },
                            {
                                data: 'collection_status',
                                name: 'collection_status'
                            },
                            {
                                data: 'reason',
                                name: 'reason'
                            }
                        ]
                    });
                    return datacollectiondetail;

                });
            }
        </script>
        {{-- akhir kumpulan function --}}
</body>

</html>

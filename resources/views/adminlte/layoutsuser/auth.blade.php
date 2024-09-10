<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Field Management Tool</title>

    <!-- Google Font: Lato -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="shortcut icon" href="{{ asset('assets/image/gfk_auth_logo.png') }}" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Select 2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css') }}">
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
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css') }}">
    <style>
        #password-strength {
            font-weight: bold;
        }

        .weak {
            color: red;
        }

        .normal {
            color: orange;
        }

        .strong {
            color: green;
        }

        #password-weaknesses {
            margin-top: 5px;
            margin-left: 10px;
            /* Sesuaikan dengan kebutuhan Anda */
        }

        #password-weaknesses ul {
            list-style-type: none;
            padding-left: 0;
        }

        #password-weaknesses li {
            color: red;
        }
    </style>
</head>
@yield('content')

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
<!-- jQuery UI -->
<script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
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
<!-- SweetAlert2 -->
<script src="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<!-- Toastr -->
<script src="{{ asset('assets/plugins/toastr/toastr.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('assets/dist/js/adminlte.min.js') }}"></script>
<!-- Strong Password lib -->
<script src="{{ asset('js/zxcvbn.js') }}"></script>
<script>
    $(document).ready(function() {
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });
        @if($message = Session::get('success'))
        Toast.fire({
            icon: 'success',
            title: '{{ $message }}'
        })
        @endif
        @if($message = Session::get('info'))
        Toast.fire({
            icon: 'info',
            title: '{{ $message }}'
        })
        @endif
        @if($message = Session::get('error'))
        Toast.fire({
            icon: 'error',
            title: '{{ $message }}'
        })
        @endif
        @if($message = Session::get('warning'))
        Toast.fire({
            icon: 'warning',
            title: '{{ $message }}'
        })
        @endif
        // Initialize Select2
        $('.select2auth').select2({
            placeholder: "Please Select",
            theme: 'bootstrap4',
            allowClear: true
        });
        $('#fullname').on('input', function() {
            var fullname = $(this).val().trim();
            var usernameField = $('#username');
            var usernameFeedback = $('#usernameFeedback');

            if (fullname === '') {
                usernameField.val('');
                usernameFeedback.text('');
                return;
            }

            var fullnameWords = fullname.split(' ');
            var username = '';

            if (fullnameWords.length === 1) {
                username = fullnameWords[0] + '.' + fullnameWords[0];
            } else if (fullnameWords.length === 2) {
                username = fullnameWords.join('.');
            } else {
                username = fullnameWords[0] + '.' + fullnameWords[fullnameWords.length - 1];
            }

            usernameField.val(username.toLowerCase());
            usernameFeedback.text('');
        });
        $('#password_register').on('input', function() {
            var password = $(this).val();
            var result = zxcvbn(password);
            console.log(result);

            // Menampilkan kekuatan kata sandi
            switch (result.score) {
                case 0:
                case 1:
                    $('#password-strength').removeClass().addClass('weak').text('Weak');
                    break;
                case 2:
                    $('#password-strength').removeClass().addClass('normal').text('Normal');
                    break;
                case 3:
                case 4:
                    $('#password-strength').removeClass().addClass('strong').text('Strong');
                    break;
                default:
                    break;
            }

            // Menampilkan pesan kriteria
            var criteriaMessage = '<ul>';

            if (password.length < 8) {
                criteriaMessage += '<li>Minimal 8 karakter.</li>';
            }
            if (!password.match(/[A-Z]/)) {
                criteriaMessage += '<li>Minimal 1 huruf kapital.</li>';
            }
            if (!password.match(/[0-9]/)) {
                criteriaMessage += '<li>Minimal 1 angka.</li>';
            }
            if (!password.match(/[!@#$%^&*(),.?":{}|<>]/)) {
                criteriaMessage += '<li>Minimal 1 tanda baca.</li>';
            }

            criteriaMessage += '</ul>';

            $('#password-criteria').html(criteriaMessage);
        });
        $('#reload').click(function() {
            $.ajax({
                type: 'GET',
                url: '{{ route('reload_captcha') }}',
                success: function(data) {
                    $(".captcha span").html(data.captcha);
                }
            });
        });

        
    });
    function readURL(input, idpicture) {
        console.log('here');
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                console.log(idpicture);
                $('#' + idpicture).attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
            // Ubah teks label sesuai dengan nama file yang dipilih
            var fileName = input.files[0].name;
            $('#inputtaxcardtext').text(fileName);
            console.log(fileName)
        }
    }

    // $("#inputtaxcard").change(function() {
    //     console.log('here');
    //     return;
    //     readURL(this, 'previewImage');
    // });
    // $("#inputidcard").change(function() {
    //     console.log('here1');
    //     return;

    //     readURL(this, 'previewImageidcard');
    // });
</script>
</body>

</html>
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Tickets OS') }}</title>
    <!-- Fonts -->
    <link href="{{ asset('plugins/fontawesome/css/all.min.css') }}" rel="stylesheet">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
    <div id="app">

        <div class="wrapper">
          <!-- Navbar -->
          @guest
            <nav class="navbar navbar-expand-md navbar-light  bg-info shadow-sm">
                <div class="container">
                    <a class="navbar-brand text-white" href="{{ url('/') }}">
                        {{ config('app.name', 'Laravel') }}
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Left Side Of Navbar -->
                        <ul class="navbar-nav mr-auto">

                        </ul>

                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            @else
                @include('layouts.nav')

                @include('layouts.aside')
            @endguest
            <main>
                @yield('content')

            </main>
     
          <!-- /.content-wrapper -->

          <!-- Control Sidebar -->
          <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
            <div class="p-3">
              <h5>Title</h5>
              <p>Sidebar content</p>
            </div>
          </aside>
          <!-- /.control-sidebar -->

          <!-- Main Footer -->
          @auth
          <footer class="main-footer">

            <!-- Default to the left -->
            <strong>Copyright &copy; 2020-2021  Facturacion_Peru</strong> All rights reserved.
          </footer>
         <modal-profile user="{{ Auth::user() }}" img_default="{{ asset('img/avatar5.png')}}" user_img="{{asset('storage/profile')}}"></modal-profile>
         @endauth
        </div>
    <!-- ./wrapper -->
    </div>
 
    @yield('scripts_before_init')
    <script>
        const app_base_url = "{{ url('/')}}";
        const app_base_asset = "{{ asset('storage')}}";
        const app_avatar_default = "{{ asset('img')}}";
    </script>
     <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
</body>
</html>

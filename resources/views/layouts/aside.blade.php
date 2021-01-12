      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="{{ url('home') }}" class="brand-link text-center">
          <!--img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
               style="opacity: .8"-->
          <span class="brand-text font-weight-light">{{ config('app.name', 'Laravel') }}</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
              <img src="{{ asset('storage/profile/'.Auth::user()->id.'/'.Auth::user()->img_src)}}" id="img_aside" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
              <a href="#" class="d-block">{{ Auth::user()->name }}</a>
            </div>
            <div class="info" style="position: absolute; right: 0px;">
              <a href="#" class="d-block" data-toggle="modal" data-target="#editProfileModal"><i class="fas fa-edit"></i></a>
            </div>
          </div>

          <!-- Sidebar Menu -->
          <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->
              <li class="nav-item">
                <a href="{{ url('/home')}}" class="nav-link {{ (request()->is('home')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Inicio
                  </p>
                </a>
              </li>
              <li class="nav-item has-treeview  {{ (request()->is('usuarios*') || request()->is('rol*') || request()->is('categorias*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->is('usuarios*') || request()->is('rol*') || request()->is('categorias*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Usuarios
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="{{ url('/usuarios')}}" class="nav-link {{ (request()->is('usuarios*')) ? 'active' : '' }}">
                      <i class="fas fa-certificate"></i>
                      <p>
                        Usuarios
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="{{ url('/rol')}}" class="nav-link {{ (request()->is('rol*')) ? 'active' : '' }}">
                      <i class="fas fa-certificate"></i>
                      <p>
                        Rol
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="{{ url('/categorias')}}" class="nav-link {{ (request()->is('categorias*')) ? 'active' : '' }}">
                      <i class="fas fa-certificate"></i>
                      <p>
                        Categorias
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
               <li class="nav-item">
                <a href="{{ url('/tickets')}}" class="nav-link {{ (request()->is('tickets*')) ? 'active' : '' }}" >
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Tickets
                  </p>
                </a>

              </li>
              <li class="nav-item">
                <a href="{{ url('/estatus')}}" class="nav-link {{ (request()->is('estatus*')) ? 'active' : '' }}" >
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Estatus Ticket
                  </p>
                </a>

              </li>
            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
      </aside>
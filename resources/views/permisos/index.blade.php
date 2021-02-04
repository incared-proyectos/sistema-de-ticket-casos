@extends('layouts.app')

@section('content')
 <div class="content-wrapper">

    <!-- Main content -->
    <div class="content mt-2">
      <div class="container-fluid">
        <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                   <i class="fas fa-atom"></i> Permisos
                </div>
                <div class="card-body">
                  <button  class="btn btn-primary mb-2" data-toggle="modal" data-target="#createModal"><i class="fas fa-folder-plus"></i> Agregar</button>
 
                  <hr>
                    <!--TABLA REALIZADA CON VUEJS Y DATATABLES LE PASAMOS LAS COLUMNAS Y HEAD PARA QUE SEA DINAMICA PARA CUALQUIER VISTA-->
                    <table-vue :columns="{{ json_encode($columns) }}" :head="{{ json_encode($head) }}" tipe="all" ></table-vue>
                </div>
              </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    @include('permisos.add')
</div>

<div id="response_edit"></div>

@endsection
@section('scripts_before_init')
  <script>
    const base_url_http = "{{ url('datatables/permisos')}}";
  </script>

@endsection
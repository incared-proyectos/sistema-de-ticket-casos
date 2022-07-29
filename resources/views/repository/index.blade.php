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
                   <i class="fas fa-atom"></i> Repositorio de archivos
                </div>
                <div class="card-body">
                    <repository-index></repository-index>

                </div>
              </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<div id="response_edit"></div>
@include('rol.add')
@endsection

@section('scripts_before_init')
  <script>
    const base_url_http = "{{ url('datatables/rol')}}";
  </script>
@endsection
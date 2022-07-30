@extends('layouts.app')

@section('content')
 <div class="content-wrapper">

    <!-- Main content -->
    <div class="content mt-2">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-12 text-right">
                <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Agregar Archivos
            </button>
          </div>
          
        </div>
        <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                   <i class="fas fa-atom"></i> Repositorio de archivos
                </div>
                <div class="card-body">

                  <repository-index :user_id="{{auth()->user()->id}}"></repository-index>

                </div>
              </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Agregar Archivos</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <repository-form></repository-form>
          </div>
        </div>
      </div>
    </div>
</div>
<div id="response_edit"></div>
@include('rol.add')
@endsection

@section('scripts_before_init')
  <script>
    const base_url_http = "{{ url('datatables/rol')}}";
  </script>
@endsection
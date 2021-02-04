<!-- Modal -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Crear Boton</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="alert alert-danger" id="errors_form" style="display: none"></div>
        <div class="alert alert-success" id="success_form" style="display: none"></div>
        <form action="{{ url('buttons') }}" method="POST" id="submit_form">

          <div class="row">
            <div class="col-6 ">
              <label for="">Nombre</label>
              <input type="text" name="nombre" class="form-control" placeholder="Nombre boton">
            </div>
            <div class="col-6 ">
              <label for="">Icon</label>
              <input type="text" name="icon" class="form-control" placeholder="icono html">
            </div>
          </div>
          <hr>
          <div class="row mt-2" >
            <div class="col-6">
              <label for="">Class</label>
              <input type="text" name="class" class="form-control" placeholder="Clase css"> 
            </div>
            <div class="col-6">
              <label for="">Url</label>
              <input type="text" name="url_to" class="form-control" placeholder="Clase css"> 
            </div>
          </div>
          <hr>
          <div class="row mt-2">
            <div class="col-12 text-center">
              <button class="btn btn-primary">Guardar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

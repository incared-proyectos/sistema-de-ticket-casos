<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Ticket</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="alert alert-danger" id="errors_form_update" style="display: none"></div>
        <div class="alert alert-success" id="success_form_update" style="display: none"></div>
        <form action="" data-action="{{ url('tickets') }}" method="PUT" id="updated_form">

          <div class="row">
            <div class="col-12 ">
              <label for="">Titulo</label>
              <input type="text" name="titulo" id="titulo_input" class="form-control" placeholder="titulo del ticket"  readonly="">
            </div>
            
          </div>
          <hr>
          <div class="row mt-2">
            <div class="col-6">
                <label for="exampleFormControlSelect1">Categorias </label>
                <select class="form-control change_select" id="change_select_updated"  data-live-search="true" data-two="on">
                  <option value="">Seleccionar Categoria.</option>

                  @foreach($categorias as $p)
                    <option value="{{$p->nombre}}" data-id="{{$p->id}}">{{$p->nombre}}</option>
                  @endforeach
                </select>
            </div>
            <div class="col-6 " >
              <label for="">Caducidad</label>
              <input type="text" class="form-control datetimepicker-input datetimepicker" id="datetimepicker_edit" data-toggle="datetimepicker" data-target="#datetimepicker5" name="fecha_caducidad" value="" />
            </div>
          </div>
          <div class="row">
            <div class="col-12 " >
              <div class="row  justify-content-center options_selects_category" id="options_select_updated">
                <input type="hidden" id="check_categories" name="check_categories_log" value="0">
              </div>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-12 ">
              <label for="">Descripcion</label>
              <br>
              <textarea name="descripcion" id="descripcion_edit"  class="form-control"></textarea>
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
<!-- Modal -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Crear usuarios</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="alert alert-danger" id="errors_form" style="display: none"></div>
        <div class="alert alert-success" id="success_form" style="display: none"></div>
        <form action="{{ url('usuarios') }}" method="POST" id="submit_form">

          <div class="row">
            <div class="col-6 col-md-4 col-lg-4 ">
              <label for="">Nombre</label>
              <input type="text" name="name" class="form-control">
            </div>
            <div class="col-6 col-md-4 col-lg-4 ">
              <label for="">Email</label>
              <input type="text" name="email" class="form-control">
            </div>
            <div class="col-6 col-md-4 col-lg-4 ">
              <label for="">Password</label>
              <input type="password" name="password" class="form-control">
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-6">
              <label for="">Direccion</label>
              <input type="text" name="direccion" class="form-control">
            </div> 
            <div class="col-6">
              <label for="">Sede</label>
              <input type="text" name="sede" class="form-control">
            </div> 
          </div>
          <hr>
          <div class="row">
            <div class="col-6">
              <label for="exampleFormControlSelect1">Rol</label>
              <select class="form-control" data-live-search="true" name="rol" required="" >
                <option value=""> Seleccionar...</option>
                @foreach($roles as $r)
                  <option value="{{$r->name}}">{{$r->name}}</option>
                @endforeach
              </select>
            </div>
            <div class="col-6">
              <label for="exampleFormControlSelect1">Categorias </label>
              <select class="form-control change_select" id="change_select"  data-live-search="true" >
                <option value="">Seleccionar Categoria.</option>

                @foreach($categoria as $p)
                  <option value="{{$p->nombre}}" data-id="{{$p->id}}">{{$p->nombre}}</option>
                @endforeach
              </select>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-6">
              
            </div>
            <div class="col-6 " >
              <div class="row  justify-content-center" id="options_select">
                
              </div>
            </div>
          </div>
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
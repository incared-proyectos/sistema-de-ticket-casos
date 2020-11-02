<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar usuario {{$user->name}}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="alert alert-danger" id="errors_form_update" style="display: none"></div>
        <div class="alert alert-success" id="success_form_update" style="display: none"></div>
        <form action="{{ url('usuarios/'.$user->id) }}" method="PUT" id="updated_form">

          <div class="row">
            <div class="col-6 col-md-4 col-lg-4 ">
              <label for="">Nombre</label>
              <input type="text" name="name" class="form-control" value="{{$user->name}}">
            </div>
            <div class="col-6 col-md-4 col-lg-4 ">
              <label for="">Email</label>
              <input type="text" name="email" class="form-control" value="{{$user->email}}">
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
              <input type="text" name="direccion" class="form-control" value="{{$user->direccion}}">
            </div> 
            <div class="col-6">
              <label for="">Sede</label>
              <input type="text" name="sede" class="form-control" value="{{$user->sede}}">
            </div> 
          </div>
          <hr>
          <?php 
            $rol='';
            $rol_name='';
            if(count($user->roles) > 0 ){
              foreach ($user->roles as $r) {
                $rol=$r->id;
                $rol_name=$r->name;
              }
            }
            $permissions= array();
            if (count($user->permissions) > 0) {
              foreach ($user->permissions as $p) {
                $permissions[] = $p->name;
              }           
            }
          ?>
          <input type="hidden" name="rol_actually"  value="{{$rol_name}}">
          <input type="hidden" name="permissions_actually"  value="{{json_encode($permissions)}}">
          <div class="row">
            <div class="col-6">
              <label for="exampleFormControlSelect1">Roles</label>
              <select class="form-control" data-live-search="true" name="rol" >
                @foreach($roles as $r)
                  <option value="{{$r->name}}" {{($r->id==$rol) ? 'selected' : ''}} >{{$r->name}}</option>
                @endforeach
              </select>
            </div>

            <div class="col-6">
              <label for="exampleFormControlSelect1">Permisos</label>
              <select class="form-control " id="change_select_updated"  data-live-search="true" >
                <option value="">Seleccionar Permiso.</option>
                @foreach($permisos as $p)
                  <option value="{{$p->name}}" data-id="{{$p->id}}" >{{$p->name}}</option>
                @endforeach
              </select>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-6">
              
            </div>
            <div class="col-6 " >
              <div class="row  justify-content-center" id="options_permisos_updated">
                @foreach($user->permissions as $p)
                  <span class="item_permisos" id="item_update{{$p->id}}"><input type="hidden" name="permisos[]" value="{{$p->name}}"><i class="fab fa-adn"></i> {{$p->name}} <a href="#" class="delete_select text-white" data-id="{{$p->id}}"><i class="far fa-trash-alt"></i></a></span>
                @endforeach
              </div>
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
<script>
  $('select').selectpicker();
</script>
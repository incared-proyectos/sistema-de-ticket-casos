

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar - {{$empresa->name}}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div id="error-content" class="alert alert-danger" style="display: none;">
            </div>
            <div id="success-content" class="alert alert-success" style="display: none;">
            </div>
            <form onsubmit="saveForm(this); return false" data-url="{{route('empresa.update',$empresa->id)}}">
                <input type="hidden" name="empresa_id" value="{{$empresa->id}}">
                <div class="row">
                    <div class="col-lg-4">
                        <label for="">Identificacion:</label>
                        <input type="text" name="ruc" class="form-control" placeholder="Ingrese Ruc" required value="{{$empresa->ruc}}">
                    </div>
                    <div class="col-lg-4">
                        <label for="">Nombre:</label>
                        <input type="text" name="name" class="form-control" placeholder="Ingrese nombre" required value="{{$empresa->name}}">
                    </div>
                    <div class="col-lg-4">
                        <label for="">Apellido:</label>
                        <input type="text" name="surname" class="form-control" placeholder="Ingrese apellido" required value="{{$empresa->surname}}">
                    </div>

                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-4">
                        <label for="">Razon social :</label>
                        <input type="text" name="rsocial" class="form-control" placeholder="Razon Social" required  value="{{$empresa->rsocial}}">
                    </div>
                    <div class="col-lg-4">
                        <label for="">Logo:</label>
                        <input type="file" name="logo" class="form-control" onchange="showPreview(event);">
                    </div>
                    <div class="col-lg-4">
                        <label for="">Color:</label>
                        <input type="text" name="color" class="form-control" placeholder="Ingrese un color ejemplo: #00000" required  value="{{$empresa->color}}">
                    </div>

                </div>
                <!--Seccion de preview para imagen de logotipo-->
                <div class="row">
                    <div class="col-lg-4">

                    </div>
                    <div class="col-lg-4" >
                        @if(file_exists(public_path('storage/empresa/'.$empresa->id.'/'.$empresa->logo)))

                            <img src="{{asset('storage/empresa/'.$empresa->id.'/'.$empresa->logo)}}" alt="" class="w-100" id="file-preview" style=" height:350px;">
                        @else
                            <img src=""  class="w-100" id="file-preview" style="display: none; height:350px;">

                        @endif
                    </div> 
                    <div class="col-lg-4">

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
 



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
                   <i class="fas fa-atom"></i> Empresa
                </div>
                <div class="card-body">
                    <div id="error-content" class="alert alert-danger" style="display: none;">
                    </div>
                    <form onsubmit="saveForm(this); return false">
                        <div class="row">
                            <div class="col-lg-4">
                                <label for="">Identificacion:</label>
                                <input type="text" name="ruc" class="form-control" placeholder="Ingrese Ruc" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="">Nombre:</label>
                                <input type="text" name="name" class="form-control" placeholder="Ingrese nombre" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="">Apellido:</label>
                                <input type="text" name="surname" class="form-control" placeholder="Ingrese apellido" required>
                            </div>

                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-lg-4">
                                <label for="">Razon social :</label>
                                <input type="text" name="rsocial" class="form-control" placeholder="Razon Social" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="">Logo:</label>
                                <input type="file" name="logo" class="form-control" onchange="showPreview(event);">
                            </div>
                            <div class="col-lg-4">
                                <label for="">Color:</label>
                                <input type="text" name="color" class="form-control" placeholder="Ingrese un color ejemplo: #00000" required>
                            </div>

                        </div>
                        <!--Seccion de preview para imagen de logotipo-->
                        <div class="row">
                            <div class="col-lg-4">

                            </div>
                            <div class="col-lg-4" >
                                <img src="" alt="" class="w-100" id="file-preview" style="display: none; height:350px;">
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
      </div><!-- /.container-fluid -->
    </div>
</div>
@endsection

@section('scripts_before_init')
  <script>
    const base_url_http = "{{ url('empresa/datatable')}}";
    function showPreview(event){
        if(event.target.files.length > 0){
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-preview");
            preview.src = src;
            preview.style.display = "block";
        }
    }
    function saveForm(i){
        $.ajaxblock(event.currentTarget);
        const formData = new FormData(i);
        $('#error-content').fadeOut(100).html('')
        axios.post(route('empresa.store'), formData, {
            headers: {
            "Content-Type": "multipart/form-data",
            },
        })
        .then((res) => {
            location.href = route('empresa.index')
		    $.ajaxunblock();
        })
        .catch((err) => {
            if (error.response.status == 422){
                $('#error-content').fadeIn(100)
                $.each(error.response.data.errors, function(index, item) {
                    $.each(item, function(key, val) {
                        $('#error-content').append(`<p>* ${val}</p>`)
                    })
                });
            }else if (error.response.status == 500) {
                alert(error.response.data.message)
            }
            $.ajaxunblock();
        });
    }
  </script>
@endsection

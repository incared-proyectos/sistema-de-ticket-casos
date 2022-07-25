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
                  @if(Session::has('success'))
                    <div class="alert alert-success">
                    {{Session::get('success') }}

                    </div>
                  @endif

                  <a  class="btn btn-primary mb-2" href="{{url('empresa/create')}}"><i class="fas fa-folder-plus"></i> Agregar</a>
 
                  <hr>
                  
                    <!--TABLA REALIZADA CON VUEJS Y DATATABLES LE PASAMOS LAS COLUMNAS Y HEAD PARA QUE SEA DINAMICA PARA CUALQUIER VISTA-->
                    <table-vue :columns="{{ json_encode($columns) }}" :head="{{ json_encode($head) }}" tipe="all" ></table-vue>
                </div>
              </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
</div>
<div id="response_edit"></div>

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
        $('#success-content').fadeOut(100).html('')
        axios.post($(i).attr('data-url'), formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        })
        .then((res) => {
            $('#success-content').fadeIn(100).html(res.data.success)
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


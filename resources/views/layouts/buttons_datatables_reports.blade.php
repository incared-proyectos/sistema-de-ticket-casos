@hasanyrole('administrador|tecnico')

<a href="{{route('report.pdf',$id)}}" class="btn btn-danger  btn-sm button-pdf" data-id="{{$id}}" ><i class="fas fa-file-pdf"></i></a>
<a href="{{route('report.word',$id)}}" class="btn btn-primary  btn-sm button-word" data-id="{{$id}}" ><i class="fas fa-file-word"></i></a>
<a href="{{route('report.edit',$id)}}" class="btn btn-info  btn-sm button-edit"  ><i class="fas fa-edit"></i></a>
<a href="#" class="btn btn-danger  btn-sm row_delete" data-id="{{$id}}"  data-url="{{$url}}" ><i class="fas fa-trash"></i></a>
@endhasanyrole

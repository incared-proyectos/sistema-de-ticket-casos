@hasanyrole('administrador|tecnico')

<a href="{{route('report.pdf',$id)}}" class="btn btn-danger  btn-sm button-pdf" data-id="{{$id}}" ><i class="fas fa-file-pdf"></i></a>
<a href="{{route('report.word',$id)}}" class="btn btn-primary  btn-sm button-word" data-id="{{$id}}" ><i class="fas fa-file-word"></i></a>
@endhasanyrole

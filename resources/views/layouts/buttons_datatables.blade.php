@if(isset($ticket))

	<a href="{{$url}}" class="btn btn-info  btn-sm " data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-eye text-white"></i></a>
	@hasanyrole('administrador|tecnico')
		<a href="#" class="btn btn-primary btn-sm row_edit_ticket" data-id="{{$id}}" data-url="{{$url}}/edit"><i class="fas fa-edit"></i></a>

		<a href="{{url('print/ticket/'.$id)}}" class="btn btn-info  btn-sm " ><i class="fas fa-print"></i></a>
	@endhasanyrole

@else 
	<a href="#" class="btn btn-primary btn-sm row_edit" data-id="{{$id}}" data-url="{{$url}}/edit"><i class="fas fa-edit"></i></a>
@endif
@hasanyrole('administrador|tecnico')

	<a href="#" class="btn btn-danger  btn-sm row_delete" data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-trash"></i></a>
@endhasanyrole

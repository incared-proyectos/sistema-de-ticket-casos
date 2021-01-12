@if(isset($ticket))
	<a href="{{$url}}" class="btn btn-info  btn-sm " data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-eye text-white"></i></a>

	<a href="#" class="btn btn-primary btn-sm row_edit_ticket" data-id="{{$id}}" data-url="{{$url}}/edit"><i class="fas fa-edit"></i></a>

	<a href="{{url('print/ticket/'.$id)}}" class="btn btn-info  btn-sm " >Prin</a>
@else 
	<a href="#" class="btn btn-primary btn-sm row_edit" data-id="{{$id}}" data-url="{{$url}}/edit"><i class="fas fa-edit"></i></a>
@endif
<a href="#" class="btn btn-danger  btn-sm row_delete" data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-trash"></i></a>

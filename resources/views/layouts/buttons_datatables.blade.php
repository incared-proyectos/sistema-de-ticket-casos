<a href="#" class="btn btn-primary btn-sm row_edit" data-id="{{$id}}" data-url="{{$url}}/edit"><i class="fas fa-edit"></i></a>
@if(isset($ticket))
	<a href="{{$url}}/{{$id}}" class="btn btn-info  btn-sm " data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-eye text-white"></i></a>
@endif
<a href="#" class="btn btn-danger  btn-sm row_delete" data-id="{{$id}}" data-url="{{$url}}"><i class="fas fa-trash"></i></a>

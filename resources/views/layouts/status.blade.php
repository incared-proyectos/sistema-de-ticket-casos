
<?php $color_active = ''; ?>
@foreach($estatus as $es)
	@if($es->nombre == $status)
		<?php $color_active = $es->color; ?>
	@endif
@endforeach
<button type="button" style="background: {{$color_active}} ;border:0px;" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
   {{$status}}
</button>
<div class="dropdown-menu">
	@foreach($estatus as $es)
		@if($es->nombre == $status)

		@else
			<a class="dropdown-item row_status" href="#" data-ticket="{{$id_ticket}}" data-id="{{$es->id}}" data-url="{{$url_action}}">{{$es->nombre}}</a>
		@endif 
	@endforeach
</div>


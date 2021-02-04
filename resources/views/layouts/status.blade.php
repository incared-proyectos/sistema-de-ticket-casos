
<?php $color_active = ''; ?>
@foreach($estatus as $es)
	@if($es->nombre == $status)
		<?php $color_active = $es->color; ?>
	@endif
@endforeach
<span  style="background: {{$color_active}} ;border:0px;" class="btn btn-primary " >
   {{$status}}
</span>


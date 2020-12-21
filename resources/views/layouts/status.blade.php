@if($status == 'active')
	<span class="status_label status_label_success row_status" data-id="{{$id_ticket}}" data-url="{{$url_action}}">
		Active
	</span>
@elseif($status == 'inactive')
	<span class="status_label status_label_danger row_status" data-id="{{$id_ticket}}" data-url="{{$url_action}}">
		Inactive
	</span>
@else
	<span class="status_label status_label_non row_status" data-id="{{$id_ticket}}" data-url="{{$url_action}}">
		sin status
	</span>
@endif

@if(!empty($ticket['users_asigne_json']))
	<?php $users = json_decode($ticket['users_asigne_json']); ?>
	@foreach($users as $user)
		<span class="item_select" id="item_update"><i class="fab fa-adn"></i> {{$user->name}} </span>
	@endforeach
@endif

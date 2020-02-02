<style type="text/css">
	.top-notification .item {
		padding: 7px;
		border-bottom: 1px solid #EEE;
	}
	.top-notification .item:last-child {
		border-bottom: 0px solid transparent;
	}
	.notification-count-alert {
    width: 24px;
    height: 24px;
    padding: -1px 1px;
    line-height: 24px;
    font-weight: bold;
    padding: -1px;
    height: 2;
    text-align: center;
    font-size: 12px;
    right: 0;
    top: 0;
    color: #FFF;
    border-radius: 50%;
    position: absolute;
	}

	.top-notification .item {
		position: relative;
		padding: 7px 9px;
	}
	.top-notification .item.not-seen-class {
		background-color: #F7F7F7;
	}
	.top-notification .item .redirect-link {
		margin-bottom: 4px;
	}
	.top-notification .item .notf-content {
		max-height: 40px;
		overflow-y: scroll;
		margin-bottom: 3px;
	}
	.top-notification .item .notf-type {
		position: absolute;
		right: 6px;
		bottom: 6px;
	}
</style>

<li class="nav-item dropdown" style="width:45px;">
  <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top: 8px;">
  	@if(\App\Models2\NotificationMobHistory::getCountOfUnSeenNotifications(20) > 0)
    	<div class="bg-danger notification-count-alert" id="notification-count-alert">
    		{{ \App\Models2\NotificationMobHistory::getCountOfUnSeenNotifications(20) }}
    	</div>
  	@endif
  	<i class="fa fa-bell" style="color: #FAFAFA; font-size: 25px;"></i>
  </a>
  <div class="dropdown-menu dropdown-menu-right top-notification"
  	id="notification-dropdown"
  	style="
  		padding: 0; max-height: 285px;
  		overflow-y: scroll;
	    border-radius: 0 0 7px 7px;
	    box-shadow: 0px 4px 15px rgba(45,45,45,.3);
  		"
  	>
  	@php
  		$query = \App\Models2\NotificationMobHistory::where('user_id', Auth::guard('web')->user()->id);
  		if(Auth::guard('web')->user()->role == 'admin' || Auth::guard('web')->user()->role == 'teacher') {
  			$query->whereNotIn('type', ['attendance', 'assignment', 'exams', 'homework']);
  		}
  		$count = $query->count();
  		$data = $query->orderBy('id', 'DESC')->limit(20)->get()->toArray();
  	@endphp
  	@if($count)
      @foreach($data as $item)
      	<?php
      		$not_seen_class = '';
      		if(!$item['is_seen']) {
      			$not_seen_class = 'not-seen-class';
      		}
      	?>
      	@if($item['check_payload_item'])
	      	<div class="item {{ $not_seen_class }}" data-redirect-link="{{ $item['redirect_link'] }}">
	      		@if(strlen($item['name']))
	      			<div class="redirect-link">
	          		<a href="{{ $item['redirect_link'] }}">
	            		<b class="text-danger">{{ $item['name'] }}</b>
	            	</a>
	      			</div>
	      		@endif
	      		<div class="notf-content">
	      			<a class="text-muted" href="{{ $item['redirect_link'] }}">
		      			@if(!$item['is_seen'])
		      				<b>{!! $item['value'] !!}</b>
		      			@else
		      				{!! $item['value'] !!}
		      			@endif
		      		</a>
	      		</div>
	      		<small class="text-muted">{{ $item['date_diff'] }}</small>
	      		<small class="text-muted notf-type">
	      			{{ $item['type'] }}
	      		</small>
	      	</div>
      	@endif
      @endforeach
    @else
    	<span style="padding: 10px; display: block;">
    		There is no notifications
    	</span>
    @endif
  </div>
</li>

@section('scripts')
	<script type="text/javascript">
		$(document).ready(function(){
			var audioElementNotification = document.createElement('audio');
      audioElementNotification.setAttribute('src', 'assets/sounds/accomplished.mp3');
      audioElementNotification.setAttribute('autoplay', 'autoplay');

			setInterval(function(){
				$.ajax({
					url: 'index.php/get-notification-count-alert',
					type: 'get',
					success: function(res){
						// set notification counter alert
						$('#notification-count-alert').text(res.unseen_notif_count);

						// reset container
						$('#notification-dropdown').text('');

						// fill-up container
						if(Object.keys(res.all_notifications).length > 0) {
							for (var i = Object.keys(res.all_notifications).length - 1; i >= 0; i--) {
								var item = res.all_notifications[i];

								item_name_collection = '';
								if(item.name.length > 0) {
									item_name_collection = `
										<div class="redirect-link">
				          		<a href="${item.redirect_link}">
				            		<b class="text-danger">${item.name}</b>
				            	</a>
				      			</div>
									`;
								}

								check_seen_collection = `${item.value}`;
								not_seen_class = '';
								if(item.is_seen != 1) {
									check_seen_collection = `<b>${item.value}</b>`
									not_seen_class = 'not-seen-class'
								}

								$('#notification-dropdown').append(`
									<div class="item ${not_seen_class}" data-redirect-link="${item.redirect_link}">
					      		${item_name_collection}
					      		<div class="notf-content">
					      			<a class="text-muted" href="${item.redirect_link}">
						      			${check_seen_collection}
						      		</a>
					      		</div>
					      		<small class="text-muted">${item.date_diff}</small>
					      		<small class="text-muted notf-type">
					      			${item.type}
					      		</small>
					      	</div>
								`);

								if(res.unseen_notif_count > window.current_unseen_notif_count) {
									audioElementNotification.play()
								}

								window.current_unseen_notif_count = res.unseen_notif_count;
							}
						} else {
							$('#notification-dropdown').append(`
								<span style="padding: 10px; display: block;">
									There is no notifications
								<span>
							`);
						}
					}
				});
			}, 1 * 60 * 1000);

			$('[data-redirect-link]').click(function(){
				window.location.href = $(this).data('redirect-link');
			})
		});
	</script>
@append
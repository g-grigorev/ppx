/* Message PX
*	простые сообщения/подсказки на коленке
*
*	message.error('Ошибка!');
*	message.success('Успех!');
*/
    var $notice = $('.notice');
	var message = {
		error: 	function (msg) {
			var cls = 'warning';
			message.init(msg,cls);
		},
		success: 	function (msg) {
			var cls = 'success';
			message.init(msg,cls);
		},
		init: function(msg, cls) {
			$(document.body).append('<div class="notice notice--'+cls+'" style="opacity:0;"><div class="row text-center">'+msg+'</div></div>');

			var height_notice = $('.notice').height();
			$('.notice').css('bottom', '-'+height_notice+'px');
			$('.notice').animate({
			  	bottom: 0,
			    opacity: 1
			}, 300);

			message.close(3000);
			return false;
		},
		close: function(time) {
			function notice_hide() {
				$(".notice").animate({
					opacity: 0},
					500, function() {
						$(this).remove();
				});
			}
			setTimeout(notice_hide, time);
		}
	}

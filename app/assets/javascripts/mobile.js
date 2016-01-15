$(document).on("ready", function () {
  bindMobileListeners();
});

// $("#menu-toggle").click(function(e) {
//         e.preventDefault();
//         $("#wrapper").toggleClass("active");
// });

function bindMobileListeners() {
	$('.nav-menu').on('tap', function(e) {
		e.preventDefault();
		if($('.nav-list').is(':hidden')) {
			$(this).css('background-color', '#a2b571');
			$('.nav-list').slideDown(200);
		} else {
			$(this).css('background-color', '#b5ca7e');
			$('.nav-list').slideUp(200);
		};
	});
};

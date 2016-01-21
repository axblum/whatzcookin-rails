$(function() {
  $("body").swipe( {
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      if(direction === 'left') {
        swipeLeft();
      }
    },
    allowPageScroll:"vertical"
  });
});


var swipeLeft = function(){
  window.location.href = '/random_recipe'
};



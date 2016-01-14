$(function() {
  $("#swipe").swipe( {
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      if(direction === 'left') {
        swipeLeft();
      }
    }
  });
});


var swipeLeft = function(){
  window.location.href = '/random_recipe'
};



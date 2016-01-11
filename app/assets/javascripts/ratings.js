$(document).ready(function(){
  console.log('here')
  bindListeners()
});

var bindListeners = function(){
  console.log('bound listeners')
  $('.star-rating').on('click', function(e){
    e.preventDefault();
    console.log('in the suck');
    console.log($(this));
    console.log($('.star-rating-on').length); // includes the average rating stars too
    console.log('granddaddy')
    console.log($(this).parent().parent())
    var stars = $('.star-rating').length
    var url = $(this).parent().parent()
    createRating(stars, url);
  })
};


var createRating = function(stars, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: stars
  })
};

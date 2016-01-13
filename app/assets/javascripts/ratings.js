$(document).ready(function() {
  bindRatingsListeners()
  debugger
});

var bindRatingsListeners = function(){
  $('.star-rating').on('click', function(e){
    e.preventDefault();
    var rating = $(this)[0].className.split(" ")[3].split("-")[1]
    var formData = {"stars": rating}
    var recipe_id = $(this).parent().parent().attr('id').split("_")[1];
    var url = '/recipes/' + recipe_id + '/ratings'
    createRating(formData, url);
  });
  $('.rating-cancel').on('click', function(e){
    e.preventDefault();
    var recipe_id = $(this).parent().parent().attr('id').split("_")[1];
    var url = '/recipes/' + recipe_id + '/ratings/0';
    deleteRating(url);
  })
};


var createRating = function(formData, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: formData,
    dataType: "JSON"
  })
  .done(function(response) {
    console.log('we\'re done')
    console.log(response)
  })
};

var deleteRating = function(url) {
  $.ajax({
    method: 'DELETE',
    url: url
  })
  .done(function(response) {
    console.log('deleted')
  })
}

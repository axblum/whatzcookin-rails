$(document).ready(function(){
  bindListeners()
});

var bindListeners = function(){
  $('.star-rating').on('click', function(e){
    e.preventDefault();
    var formData = {"stars": String($('.star-rating-on').length)}
    var recipe_id = $(this).parent().parent().attr('id').split("_")[1];
    var url = '/recipes/' + recipe_id + '/ratings'
    console.log('recipe id');
    console.log(recipe_id);
    console.log('form data');
    console.log(formData);
    console.log('url');
    console.log(url);
    createRating(formData, url);
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

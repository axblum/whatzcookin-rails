$(document).ready(function(){
  bindFavoriteListeners();
});

var bindFavoriteListeners = function(){
  $('.fav_button').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    var recipeID = $(this).attr('class').split("_")[2];
    var formData = {"recipe_id": String(recipeID)}
    console.log(recipeID);
    console.log(formData);
    createFavorite(formData, url);
  });
};

var createFavorite = function(data, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: data,
    dataType: 'JSON'
  })
  .done(function(response){
    console.log(response);
  });
};

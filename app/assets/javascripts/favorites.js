$(document).ready(function(){
  bindFavoriteListeners();
});

var bindFavoriteListeners = function(){
  if ($('.fav_button').text() === "Unfavorite"){
    $('.fav_button').on('click', function(e){
      e.preventDefault();
      e.stopPropagation();
      var url = $(this).attr('href');
      var recipeID = $(this).attr('class').split("_")[2];
      var formData = {recipe_id: String(recipeID)}
      console.log(recipeID);
      console.log(formData);
      deleteFavorite(formData, url);
    });

  }
  else {
    $('.fav_button').on('click', function(e){
      e.preventDefault();
      e.stopPropagation();
      var url = $(this).attr('href');
      var recipeID = $(this).attr('class').split("_")[2];
      var formData = {recipe_id: String(recipeID)}
      console.log(recipeID);
      console.log(formData);

      createFavorite(formData, url);
    });
  }
};

var createFavorite = function(data, url) {
  console.log('DATA');
  console.log(data);
  $.ajax({
    method: 'POST',
    url: url,
    data: data,
    datatype: "JSON"

  })
  .done(function(response) {
    $(".fav_button").text("Unfavorite")
  })
  .fail(function(response){
    console.log("I am BROKEN")
  })
};

var deleteFavorite = function(data, url) {
  console.log('DATA');
  console.log(data);
  $.ajax({
    method: 'DELETE',
    url: url,
    data: data,
    datatype: "JSON"

  })
  .done(function(response) {
    $(".fav_button").text("Favorite!")
  })
  .fail(function(response){
    console.log("I am BROKEN")
  })
};

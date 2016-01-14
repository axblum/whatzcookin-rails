$(document).ready(function(){
  bindFavoriteListeners();
});

var bindFavoriteListeners = function(){
  // if ($('.fav_button').text() === "Unfavorite"){
  //   $('.fav_button').on('click', function(e){
  //     e.preventDefault();
  //     e.stopPropagation();
  //     var url = $(this).attr('href');
  //     var recipeID = $(this).attr('class').split("_")[2];
  //     var formData = {recipe_id: String(recipeID)}
  //     console.log(recipeID);
  //     console.log(formData);
  //     deleteFavorite(formData, url);
  //   });

  // }
  // else {
  //   $('.fav_button').on('click', function(e){
  //     e.preventDefault();
  //     e.stopPropagation();
  //     var url = $(this).attr('href');
  //     var recipeID = $(this).attr('class').split("_")[2];
  //     var formData = {recipe_id: String(recipeID)}
  //     console.log(recipeID);
  //     console.log(formData);

  //     createFavorite(formData, url);
  //   });
  // }
  $('.fav-div').on('click', '.fav-button', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href');
    var recipeID = $(this).attr('class').split("_")[1];
    var formData = {recipe_id: String(recipeID)};
    createFavorite(formData, url);
  });
  $('.fav-div').on('click', '.unfav-button', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href');
    var recipeID = $(this).attr('class').split("_")[1];
    var formData = {recipe_id: String(recipeID)};
    deleteFavorite(formData, url);
  });
};

var createFavorite = function(data, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: data,
    datatype: "JSON"
  })
  .done(function(response) {
    $('.fav-div').children().remove();
    $('.fav-div').append(response);
  })
  .fail(function(response){
    console.log("Failed to set favorite.")
  })
};

var deleteFavorite = function(data, url) {
  $.ajax({
    method: 'DELETE',
    url: url,
    data: data,
    datatype: "JSON"

  })
  .done(function(response) {
    $('.fav-div').children().remove();
    $('.fav-div').append(response);
  })
  .fail(function(response){
    console.log("Failed to remove favorite.")
  })
};

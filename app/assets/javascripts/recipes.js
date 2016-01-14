$(document).ready(function(){
  swipeLeft();
  swipeRight();
});

var swipeLeft = function(){

  // Bind the swipeleftHandler callback function to the swipe event on div.box
  $( "#swipe-left" ).on( "swipeleft", function (e){
  	// $.ajax({
   //    method: "GET",
   //    url: "/random_recipe",
  	// })
  	// .done(function(response) {
  	// 	$("#content").html(response);
  	// 	var id = $("#content").children().first().attr("id");
  	// 	var url = "/recipes/" + id;
  	// 	history.pushState(null, null,url);
  	// })
    window.location.href = '/random_recipe'
  });
  };
  var swipeRight = function() {
  $( "#swipe-right" ).on( "swiperight", function (e){
  e.stopPropagation()
    var url = $(".fav-div a").attr('href');
    var recipeID = $(".fav-div a").attr('class').split("_")[1];
    var formData = {recipe_id: String(recipeID)};
    createFavorite(formData, url)
});
}




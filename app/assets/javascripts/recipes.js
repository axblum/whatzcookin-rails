$(document).ready(function(){
  swipeLeft();
});

var swipeLeft = function(){

  // Bind the swipeleftHandler callback function to the swipe event on div.box
  $( "body" ).on( "swipeleft", function (e){
    alert("swipe")
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

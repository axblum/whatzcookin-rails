$(document).ready(function(){
  swipeLeft()
});

var swipeLeft = function(){
  // Bind the swipeleftHandler callback function to the swipe event on div.box
  $( "body" ).on( "swipeleft", function (e){
  	alert("Fuck this shit")
  	$.ajax({
      method: "GET",
      url: "/random_recipe",
  	})
  	.done(function(response) {
  		console.log(response)
  	})
  });
};
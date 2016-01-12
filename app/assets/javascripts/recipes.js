$(document).ready(function(){
  swipe()
});

var swipe = function(){
  // Bind the swipeleftHandler callback function to the swipe event on div.box
  $( "body" ).on( "swipeleft", function (e){
  	alert("Fuck this shiit")
    $( event.target ).append("Hi")
  });
  // Callback function references the event target and adds the 'swipeleft' class to it
};
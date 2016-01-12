$(document).ready(function(){
  swipe()
});

var swipe = function(){
  // Bind the swipeleftHandler callback function to the swipe event on div.box
  $( "body" ).on( "swipeleft", swipeleftHandler );
  // Callback function references the event target and adds the 'swipeleft' class to it
  function swipeleftHandler( event ){
  	console.log("Hi")
    $( event.target ).append("Hi")
  }
});
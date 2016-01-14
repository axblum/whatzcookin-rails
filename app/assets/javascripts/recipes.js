$(function() {
  $("body").swipe( {
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      if(direction === 'left') {
        swipeLeft();
      }
    },
    doubleTap:function(event, target) {
      alert('double')
    }, allowPageScroll:"vertical",
    doubleTapThreshold:200
  });
  // $("#swipe-left").swipe( {
  //   swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
  //     if(direction === 'left') {
  //       swipeLeft();
  //     }
  //   }, allowPageScroll:"vertical"
  // });
});

var swipeRight = function() {
  var url = $(".fav-div a").attr('href');
  var recipeID = $(".fav-div a").attr('class').split("_")[1];
  var formData = {recipe_id: String(recipeID)};
  flash()
  // createFavorite(formData, url)
}

var swipeLeft = function(){
  // Bind the swipeleftHandler callback function to the swipe event on div.box
  // $( "#swipe-left" ).on( "swipeleft", function (e){
  //   $.ajax({
  //     method: "GET",
  //     url: "/random_recipe",
  //   })
  //   .done(function(response) {
  //     $("#content").html(response);
  //     var id = $("#content").children().first().attr("id");
  //     var url = "/recipes/" + id;
  //     history.pushState(null, null,url);
  //   })
  window.location.href = '/random_recipe'
};

var flash = function() {
  alert("hey")
  $('.show-favorite').fadeIn(3000).addClass('fa-spin');
  $('.show-favorite').fadeOut(3000);
}


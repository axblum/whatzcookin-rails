$(document).ready(function(){
  bindListeners();
});

function bindListeners() {
  $(".new-comment-form").on("submit", "#new_comment", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var action = $(this).attr("action")
    createComment(data, action);
  });
  $("li").on("click", ".edit-comment-form", function(e) {
  debugger
    e.preventDefault();
    var action = $(this).attr("action")
    editComment(actions);
  });
};

function createComment(data, action) {
  $.ajax({
    method: 'POST',
    url: action,
    data: data,
  })
  .done(function(response){
    $('.comments ul').append(response)
    $('.new_comment textarea').val("")
  });
};

function editComment(action) {
  $.ajax({
    method: 'GET',
    url: action + '/edit'
  })
};


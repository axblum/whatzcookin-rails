$(document).ready(function(){
  bindListeners();
});

function bindListeners() {
  $(".new-comment-form").on("submit", "#new_comment", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action")
    createComment(data, url);
  });
  $("li").on("click", ".edit-comment-button", function(e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $(this).toggle();
    editComment(url);
  });
  $("li").on("submit", ".edit_comment", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action");
    updateComment(data, url);
  });
};

function createComment(data, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: data
  })
  .done(function(response) {
    debugger
    $('ul.comments').append(response)
    $('.new_comment textarea').val("")
  });
};

function editComment(url) {
  $.ajax({
    method: 'GET',
    url: url
  })
  .done(function(response) {
    var id = this.url.split("/")[4]
    $("li#" + id).append(response);
  });
};

function updateComment(data, url) {
  $.ajax({
    method: 'PATCH',
    url: url,
    data: data
  })
  .done(function(response) {
    $("li#" + response.id).children().first().text(response.text);
    $("li#" + response.id + " form").hide();
    $("li#" + response.id + " .edit-comment-button").toggle();
  });
};
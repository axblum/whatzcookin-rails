$(document).ready(function(){
  bindCommentListeners();
});

function bindCommentListeners() {
  $(".new-comment-form").on("submit", "#new_comment", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action");
    createComment(data, url);
  });
  $("ul").on("click", ".edit-comment-button", function(e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $(this).parent().children().toggle();
    editComment(url);
  });
  $("ul").on("submit", ".edit_comment", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action");
    updateComment(data, url);
  });
  $("ul").on("click", ".delete-comment-button", function(e) {
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr("href");
    deleteComment(url);
  });
};

function createComment(data, url) {
  $.ajax({
    method: 'POST',
    url: url,
    data: data
  })
  .done(function(response) {
    $('ul.comments').append(response);
    $('.new_comment textarea').val("");
  });
};

function editComment(url) {
  $.ajax({
    method: 'GET',
    url: url
  })
  .done(function(response) {
    var id = this.url.split("/")[4];
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
    var li = "li#" + response.id;
    $(li).children().first().text(response.text);
    $(li + " .edit_comment").remove();
    $(li).children().toggle();
  });
};

function deleteComment(url) {
  $.ajax({
    method: 'DELETE',
    url: url
  })
  .done(function(response) {
    var li = "li#" + response.id;
    $(li).remove();
  });
};

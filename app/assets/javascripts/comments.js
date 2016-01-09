$(document).ready(function(){
  createComment();
});

var createComment = function(){
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = $(this).serialize();
    debugger
    var request = $.ajax({
      method: 'POST',
      url: '/recipes/5/comments',
      data: formData,
      dataType: 'JSON',
    });
    console.log('BETWEEN')
    request.done(function(response){
      console.log('DONE')
      $('.comments ul').append('<li>' + response.body + '</li>');
    });
  });
}

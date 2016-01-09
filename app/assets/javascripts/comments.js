$(document).ready(function(){
  createComment();
});

var createComment = function(){
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    console.log('IN THE BEGINNING')
    var formData = $('.new_comment').serialize();
    console.log(formData)
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

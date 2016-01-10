$(document).ready(function(){
  createComment();
});

var createComment = function(){
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = $('.new_comment').serialize();
    var formArray = $('.new_comment').serializeArray();
    var request = $.ajax({
      method: 'POST',
      url: '/recipes/' + formArray[1]['value'] + '/comments',
      data: formData,
      dataType: 'JSON',
    });
    request.done(function(response){
      console.log(response)
      $('.comments ul').append('<li>' + response.text + '</li>');
    });
  });
}

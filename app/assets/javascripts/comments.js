$(document).ready(function(){
  createComment();
});

var createComment = function(){
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    console.log('IN THE BEGINNING')
    var formData = $('.new_comment').serialize();
    var formArray = $('.new_comment').serializeArray();
    console.log(formData)
    console.log(formArray[1]['value'])
    var request = $.ajax({
      method: 'POST',
      url: '/recipes/' + formArray[1]['value'] + '/comments',
      data: formData,
      dataType: 'JSON',
    });
    console.log('BETWEEN')
    request.done(function(response){
      console.log('DONE')
      console.log(response)
      $('.comments ul').append('<li>' + response.text + '</li>');
    });
  });
}

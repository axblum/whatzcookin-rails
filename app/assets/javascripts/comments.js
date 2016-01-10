$(document).ready(function(){
  $('body').submit('.new_comment', createComment);
});

var createComment = function(e){
  e.preventDefault();
  var formData = $('.new_comment').serialize();
  var formArray = $('.new_comment').serializeArray();
  console.log(formData)
  console.log(formArray)
  var request = $.ajax({
    method: 'POST',
    url: '/recipes/' + formArray[2]["value"] +'/comments',
    data: formData,
    dataType: 'JSON',
  }).done(function(response){
    console.log(response)
     $('.comments ul').append('<li>' + response.text + '</li>');
     $('.new_comment textarea').val("")
  });
}

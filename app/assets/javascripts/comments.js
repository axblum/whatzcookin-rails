$(document).ready(function(){
  $('.new_comment').submit(createComment);
  // showEditForm();
});

var createComment = function(e){
  e.preventDefault();
  var formData = $('.new_comment').serialize();
  var url = $(this).attr("action")
  var request = $.ajax({
    method: 'POST',
    url: url,
    data: formData,
  }).done(function(response){
    console.log(response)
     $('.comments ul').append(response)
     $('.new_comment textarea').val("")
  });
};

var showEditForm = function(e){
  $('.comments').on('submit', '', function(e){
    e.preventDefault()
    $(this).toggle()
    console.log(this)
    console.log($(this).attr('action'))
    var request = $.ajax({
      method: 'GET',
      url: $(this).attr('action') + '/edit'
    })
  })
}

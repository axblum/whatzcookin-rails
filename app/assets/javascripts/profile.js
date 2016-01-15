$(document).ready(function(){
  bindProfileListeners();
});

function bindProfileListeners() {
  $('#taste-profile').on('click', function(e) {
    e.preventDefault();
    var formData = $('form').serializeArray();
    var data = [];
    for (i=3; i<formData.length; i++){
      data.push(parseFloat(formData[i].value));
    };
    if ($('#highcharts').length){
      display_taste_profile(data);
    }
    console.log(formData);
    console.log(data);
  });

  $('.tab').on('click', function(e) {
    e.preventDefault();
    $('.tab').removeClass('active');
    $(this).addClass('active');

    var activeSheet = $(this).children('a').attr('href');
    $('.sheet').addClass('hidden');
    $('#' + activeSheet).removeClass('hidden');
  });

  $('.profile').on('submit', '#update-dietary-restrictions', function(e) {
    e.preventDefault()
    var data = $(this).serialize();
    var url = $(this).attr('action')
    updateDietaryRestriction(data, url);
  });

  $('.profile').on('click', '#delete-excluded-ingredient', function(e) {
    e.preventDefault()
    var action = $(this).parent().attr('action');
    var query = $(this).parent().attr('ingredient_id');
    var url = action + "?ingredient_id=" + query
    deleteExcludedIngredient(url);
  });

  $('.profile').on('submit', '#create-excluded-ingredient', function(e) {
    e.preventDefault()
    var data = $(this).serialize();
    createExcludedIngredient(data);
  });
}

function createExcludedIngredient(data) {
  $.ajax({
    method: 'POST',
    url: '/restrictions',
    data: data
  })
  .done(function(response) {
    $('#restrictions').children().remove()
    $('#restrictions').append(response)
  });
};

function deleteExcludedIngredient(url) {
  $.ajax({
    method: 'DELETE',
    url: url
  })
  .done(function(response) {
    $('#restrictions').children().remove()
    $('#restrictions').append(response)
  });
};

function updateDietaryRestriction(data, url) {
  $.ajax({
    method: 'PUT',
    url: url,
    data: data
  })
  .done(function(response) {
    $('#restrictions').children().remove()
    $('#restrictions').append(response)
  });
};

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
}


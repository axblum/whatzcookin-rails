$(document).ready(function(){
  bindTasteProfileListeners();
});

function bindTasteProfileListeners() {
  $('#taste-profile').on('click', function(e) {
    e.preventDefault();
    var data = []
    var formData = $('form').serializeArray();
    for (i=(formData.length-3); i>(formData.length-23); i--){
      if (formData[i].value === 'NaN' || isNaN(formData[i].value)){
        data.push(0)
      } else {
        data.push(parseFloat(formData[i].value));
      };
    };
    userData = data.slice(0,10)
    cuisineData = data.slice(10,20)
    name = formData[(formData.length-2)].value
    if ($('#highcharts').length){
      display_taste_profile(userData, cuisineData, name);
    }
  });
}
var display_taste_profile = function(userData, cuisineData, name){
    $('#highcharts').highcharts({
        chart: {
            polar: true,
            type: 'line'
        },
        title: {
            text: 'Your Taste Profile',
            x: -80
        },
        pane: {
            size: '80%'
        },
        xAxis: {
            categories: ['Bitter', 'Earthy', 'Grassy', 'Licorice',
                    'Nutty', 'Peppery', 'Sour', 'Spicy', 'Sweet', 'Woody'],
            tickmarkPlacement: 'on',
            lineWidth: 0
        },
        yAxis: {
            gridLineInterpolation: 'polygon',
            lineWidth: 0,
            min: 0
        },
        tooltip: {
            shared: true,
            pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
        },
        legend: {
            align: 'right',
            verticalAlign: 'top',
            y: 70,
            layout: 'vertical'
        },
        series: [{
            name: 'Your Taste Profile',
            data: userData,
            pointPlacement: 'on'
        },{
            name: name,
            data: cuisineData,
            pointPlacement: 'on'
        }]
    });
}

$(document).ready(function(){
  bindTasteProfileListeners();
});

function bindTasteProfileListeners() {
  $('#taste-profile').on('click', function(e) {
    e.preventDefault();
    var data = []
    var formData = $('form').serializeArray();
    console.log(formData)
    for (i=9; i<(formData.length-1); i++){
      if (formData[i].value === 'NaN' || isNaN(formData[i].value)){
        data.push(0)
      } else {
        data.push(parseFloat(formData[i].value));
      };
    };
    console.log('data')
    console.log(data)
    console.log('User Data')
    userData = data.slice(0,9)
    console.log(userData)
    cuisineData = data.slice(9,19)
    console.log('cuisine data')
    console.log(cuisineData)
    name = formData[29].value
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

$(document).ready(function(){

  bindProfileListeners();
});

function bindProfileListeners() {
	$('body').on("click", function(e) {
    console.log('hit it')
	});
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
  })
}

var display_taste_profile = function(data){
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
            pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
        },
        legend: {
            align: 'right',
            verticalAlign: 'top',
            y: 70,
            layout: 'vertical'
        },
        series: [{
            name: 'Your Taste Profile',
            data: data,
            pointPlacement: 'on'
        }, {
            name: 'African Food Taste Profile',
            data: [0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862],
            pointPlacement: 'on'
        }]
    });
}

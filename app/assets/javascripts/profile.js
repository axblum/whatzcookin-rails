$(document).ready(function(){
  display_taste_profile();
  bindProfileListeners();
});

function bindProfileListeners() {
	$('body').on("click", function(e) {

	})
}

var display_taste_profile = function(){
    var chartdiv = $('#highcharts').find()
    chartdiv.highcharts({
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
            data: [0.1428571429,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.2142857143,0.2142857143,0.07142857143,0],
            pointPlacement: 'on'
        }, {
            name: 'African Food Taste Profile',
            data: [0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862],
            pointPlacement: 'on'
        }]
    });
}

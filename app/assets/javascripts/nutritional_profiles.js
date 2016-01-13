$(document).ready(function(){
  display_taste_profile();
});

var display_taste_profile = function(){
    $('#container').highcharts({
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
            data: [43000, 19000, 60000, 35000, 17000, 10000, 17000, 17000, 17000, 17000],
            pointPlacement: 'on'
        }, {
            name: 'Actual Spending',
            data: [50000, 39000, 42000, 31000, 26000, 14000, 17000, 17000, 17000, 17000],
            pointPlacement: 'on'
        }]
    });
}

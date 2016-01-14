$(document).ready(function(){

  bindTasteProfileListeners();
});

function bindTasteProfileListeners() {
  $('#taste-profile').on('click', function(e) {
    e.preventDefault();
    var data = []
    var formData = $('form').serializeArray();
    for (i=3; i<(formData.length); i++){
      if (formData[i].value === 'NaN'){
        data.push(0)
      } else {
        data.push(parseFloat(formData[i].value));
      };
    };
    if ($('#highcharts').length){
      display_taste_profile(data);
    }
  });
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
            data: data,
            pointPlacement: 'on'
        },]
    });
}

// var compareProfile = function(data, name, cusineData){
//   $('#highcharts').highcharts({
//       chart: {
//           polar: true,
//           type: 'line'
//       },
//       title: {
//           text: 'Your Taste Profile',
//           x: -80
//       },
//       pane: {
//           size: '80%'
//       },
//       xAxis: {
//           categories: ['Bitter', 'Earthy', 'Grassy', 'Licorice',
//                   'Nutty', 'Peppery', 'Sour', 'Spicy', 'Sweet', 'Woody'],
//           tickmarkPlacement: 'on',
//           lineWidth: 0
//       },
//       yAxis: {
//           gridLineInterpolation: 'polygon',
//           lineWidth: 0,
//           min: 0
//       },
//       tooltip: {
//           shared: true,
//           pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
//       },
//       legend: {
//           align: 'right',
//           verticalAlign: 'top',
//           y: 70,
//           layout: 'vertical'
//       },
//       series: [{
//           name: 'Your Taste Profile',
//           data: data,
//           pointPlacement: 'on'
//       }, {
//           name: name,
//           data: cuisineData,
//           pointPlacement: 'on'
//       }]
//   });
// }


// {
//             name: 'African Food Taste Profile',
//             data: [0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862],
//             pointPlacement: 'on'
//         }


// var cuisineData = {
//   'chinese': [0.1428571429,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.2142857143,0.2142857143,0.07142857143,0],
//   "african": [0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862],
//   'japanese': [0.06666666667,0.1333333333,0,0,0.2,0.06666666667,0.2,0.2666666667,0.06666666667,0],
//   'korean': [0.07692307692,0.07692307692,0.1538461538,0.07692307692,0.07692307692,0.1538461538,0.2307692308,0.1538461538,0,0],
//   'vietnamese': [0.08823529412,0.08823529412,0.08823529412,0.1176470588,0.02941176471,0.1176470588,0.1764705882,0.1470588235,0.1470588235,0],
//   'thai': [0.15,0.05,0.1,0.05,0,0.15,0.2,0.25,0.05,0],
//   'indian': [0.125,0.09375,0.03125,0.03125,0.0625,0.15625,0.09375,0.15625,0.21875,0.03125],
//   'british': [0.06896551724,0.2068965517,0.06896551724,0,0,0.1379310345,0.06896551724,0.06896551724,0.2413793103,0.1379310345],
//   'irish': [0.1052631579,0.2105263158,0.1578947368,0.05263157895,0,
//   0.1052631579,0.1052631579,0.1052631579,0.05263157895,0.1052631579],
//   'french': [0.2083333333,0.08333333333,0.125,0.04166666667,0,0.2083333333,0.125,0.04166666667,0.125,0.04166666667],
//   'italian': [0.125,0.04166666667,0.08333333333,0,0,0.2083333333,0.08333333333,0.125,0.2083333333,0.125],
//   'mexican': [0.06451612903,0.1290322581,0.06451612903,0,0.06451612903,0.1612903226,0.1612903226,0.03225806452,0.2580645161,0.06451612903],
//   'spanish': [0.1333333333,0.1333333333,0.03333333333,0,0,0.1666666667,0.03333333333,0.2,0.2,0.1],
//   'middle eastern': [0.06896551724,0.275862069,0.1034482759,0,0,0.2068965517,0.03448275862,0.06896551724,0.2068965517,0.03448275862],
//   'jewish': [0.08,0.24,0.04,0,0,0.2,0.08,0.12,0.2,0.04],
//   'american': [0.05263157895,0.2631578947,0,0,0,0.2105263158,0.05263157895,0.1578947368,0.1578947368,0.05263157895],
//   'cajun': [0.1666666667,0.2083333333,0.04166666667,0,0,0.1666666667,0.04166666667,0.2083333333,0.125,0.04166666667],
//   'southern': [0.2352941176,0.05882352941,0.1764705882,0,0,0.1176470588,0.05882352941,0.2352941176,0.1176470588,0],
//   'greek': [0.1428571429,0.2380952381,0.04761904762,0,0,0.09523809524,0.1904761905,0.04761904762,0.1904761905,0.04761904762],
//   'german': [0.09523809524,0.1428571429,0.2380952381,0,0,0.2857142857,0.09523809524,0.04761904762,0.09523809524,0],
//   'nordic': [0.03225806452,0.1612903226,0.1935483871,0.06451612903,0,0.2903225806,0.06451612903,0,0.1290322581,0.06451612903],
//   'eastern european': [0.12,0.2,0.08,0,0,0.12,0.08,0.08,0.24,0.08],
//   'caribbean': [0.1111111111,0.1666666667,0,0,0,0.1111111111,0.05555555556,0.1666666667,0.2777777778,0.1111111111],
//   'latin american': [0.1111111111,0.05555555556,0.1666666667,0,0.05555555556,0.2222222222,0.05555555556,0.1111111111,0.2222222222,0]
// }

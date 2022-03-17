<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

<title>일별 매출현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<style>
	.chart-container{
	width: 60%;
	height: 60%;
	boarder: 1px solid #ddd;
	padding:10px;
	border-radius:8px;
	}

</style>

</head>
<body>

	<div class="chart-container">
		<div class=col-8>
				<div>
					<canvas id="canvas" ></canvas>
				</div>
		</div>
	</div>


	<script>
		var chartLabels = [];

		var chartData = [];

		$.getJSON("http://localhost:8282/incomeList", function(data) {

			$.each(data, function(inx, obj) {

				chartLabels.push(obj.day);

				chartData.push(obj.income);

			});

			createChart();

			console.log("create Chart")

		});

		var lineChartData = {

			labels : chartLabels,

			datasets : [

			{

				label : "일 매출 현황",

				fillColor : "rbga(151,187,205,0.2)",

				strokeColor : "rbga(151,187,205,1)",

				pointColor : "rbga(151,187,205,1)",

				pointStrokeColor : "#fff",

				pointHighlightFill : "#fff",

				pointHighlightStroke : "rbga(151,187,205,1)",

				backgroundColor:'white';
				
				data : chartData

			}],
			
		}

		function createChart() {

			var ctx = document.getElementById("canvas").getContext("2d");

			var LineChart = new Chart(ctx, {
				type: 'line',
				
				data : lineChartData,

				options : {					
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}

				}

			})

		}
	</script>



</body>

</html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Corlate</title>
<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link href="css/order.css" rel="stylesheet">

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">


<script src="js/jquery-3.5.0.js"></script>

<!-- Styles -->
<style>
#chartdiv {
float: left;
  width: 400px;
  height: 300px;
}

</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.PieChart);

// Add data
chart.data = [ {
  "성별": "여",
  "litres": 50,
 
}, {
  "성별": "남",
  "litres": 50
}];

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "litres";
pieSeries.dataFields.category = "성별";
pieSeries.slices.template.stroke = am4core.color("#fff");
pieSeries.slices.template.strokeWidth = 2;
pieSeries.slices.template.strokeOpacity = 1;

// This creates initial animation
pieSeries.hiddenState.properties.opacity = 1;
pieSeries.hiddenState.properties.endAngle = -90;
pieSeries.hiddenState.properties.startAngle = -90;

}); // end am4core.ready()
</script>



<!-- Styles -->
<style>
#chartdiv2 {

float: right;
  width: 500px;
  height: 400px;
  margin-bottom: 50px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end


var chart = am4core.create("chartdiv2", am4charts.XYChart);

chart.data = [{
 "country": "USA",
 "visits": 2025
}, {
 "country": "China",
 "visits": 1882
}, {
 "country": "Japan",
 "visits": 1809
}, {
 "country": "Germany",
 "visits": 1322
}];

chart.padding(40, 40, 40, 40);

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 60;
categoryAxis.renderer.inversed = true;
categoryAxis.renderer.grid.template.disabled = true;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.extraMax = 0.1;
//valueAxis.rangeChangeEasing = am4core.ease.linear;
//valueAxis.rangeChangeDuration = 1500;

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.cornerRadiusTopLeft = 10;
//series.interpolationDuration = 1500;
//series.interpolationEasing = am4core.ease.linear;
var labelBullet = series.bullets.push(new am4charts.LabelBullet());
labelBullet.label.verticalCenter = "bottom";
labelBullet.label.dy = -10;
labelBullet.label.text = "{values.valueY.workingValue.formatNumber('#.')}";

chart.zoomOutButton.disabled = true;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function (fill, target) {
 return chart.colors.getIndex(target.dataItem.index);
});

setInterval(function () {
 am4core.array.each(chart.data, function (item) {
   item.visits += Math.round(Math.random() * 200 - 100);
   item.visits = Math.abs(item.visits);
 })
 chart.invalidateRawData();
}, 2000)

categoryAxis.sortBySeries = series;

}); // end am4core.ready()
</script>


</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	
	    <section id="middle" class="skill-area" style="background-image: url(images/skill-bg.png)">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 fadeInDown">
                    <div class="skill">
                        <h2>with♥Trip 데이터</h2>
                        <p></p>
                    </div>
                </div>
                <!--/.col-sm-6-->              
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#middle-->
    
    	<section id="feature">
        <div class="container">

            <div class="row">
                <div class="features">
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <div class="icon">
                                <i class="fa fa-check"></i>
                            </div>
                            <h2>총 가입자수</h2>
                            <p><fmt:formatNumber value="${total.memberCount }" pattern="###,###,###" /></p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <div class="icon">
                                <i class="fa fa-check"></i>
                            </div>
                            <h2>총 판매액</h2>
                            <p><fmt:formatNumber value="${total.revenue }" pattern="###,###,###" /></p>
                        </div>
                    </div>
                   <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <div class="icon">
                                <i class="fa fa-check"></i>
                            </div>
                            <h2>총 조회수</h2>
                            <p><fmt:formatNumber value="${total.boardCount }" pattern="###,###,###" /></p>
                        </div>
                    </div>
                    <!--/.col-md-3-->
                </div>
                <!--/.services-->
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
	
	<section id="portfolio">
		<div class="container">
			<h1></h1>
			<div id="chartdiv" class="row"></div>
			<div id="chartdiv2" class="row"></div>
			

    <!--/#feature-->
    		<div style="clear: both;">
    		<h2>일별 데이터</h2>
    		</div>
			<table class="ot_info">
					<tr>
						<th>날짜<th>
						<th>증감율</th>
						<th>가입자수</th>
						<th>판매액</th>
						<th>조회수</th>
					</tr>
					<tr>
						<th>2020.06.23<th>
						<td>▲33.3</td>
						<td>255</td>
						<td>2,000</td>
						<td>22</td>
					</tr>
					<tr>
						<th>2020.06.24<th>
						<td>▼11.3</td>
						<td>8</td>
						<td>1,000,000</td>
						<td>100</td>
					</tr>
					<tr>
						<th>2020.06.25<th>
						<td>▲11.3</td>
						<td>8</td>
						<td>2,000,000</td>
						<td>100</td>
					</tr>
					<tr>
						<th>2020.06.26<th>
						<td>▼30.3</td>
						<td>38</td>
						<td>3,000,000</td>
						<td>4100</td>
					</tr>
					<tr>
						<th>2020.06.27<th>
						<td>▲30.3</td>
						<td>550</td>
						<td>1,000,000</td>
						<td>300</td>
					</tr>
				</table>
				
		</div>
	</section>

<jsp:include page="/inc/bottom.jsp" />
	<!--/#footer-->
	<script src="js/product_modal.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
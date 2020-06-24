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
$(document).ready(function() {
	
	am4core.ready(function() {
		
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.PieChart);

		// Add data
		chart.data = [ {
		  "취향": "여행",
		  "litres": Math.round($("#htype").val()/$("#htype3").val()*100)		 
		}, {
		  "취향": "맛집",
		  "litres": Math.round($("#htype2").val()/$("#htype3").val()*100)
		}];

		// Add and configure Series
		var pieSeries = chart.series.push(new am4charts.PieSeries());
		pieSeries.dataFields.value = "litres";
		pieSeries.dataFields.category = "취향";
		pieSeries.slices.template.stroke = am4core.color("#fff");
		pieSeries.slices.template.strokeWidth = 2;
		pieSeries.slices.template.strokeOpacity = 1;

		// This creates initial animation
		pieSeries.hiddenState.properties.opacity = 1;
		pieSeries.hiddenState.properties.endAngle = -90;
		pieSeries.hiddenState.properties.startAngle = -90;

		}); // end am4core.ready()
});

</script>



<!-- Styles -->
<style>

#chartdiv {
	float: left;
  width: 500px;


}

</style>



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
$(document).ready(function() {
	
	am4core.ready(function() {
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var chart = am4core.create("chartdiv2", am4charts.XYChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
		chart.data = [{
			 "count": $('#hdate1').val(),
			 "visits": "300"
			}, {
			 "count": $('#hdate2').val(),
			 "visits": $('#hmember2').val()
			}, {
			 "count": $('#hdate3').val(),
			 "visits": $('#hmember3').val()
			}, {
			 "count": $('#hdate4').val(),
			 "visits": $('#hmember4').val()
			}, {
			 "count": $('#hdate5').val(),
			 "visits": $('#hmember5').val()
			}, {
			 "count": $('#hdate6').val(),
			 "visits": $('#hmember6').val()
			}, {
			 "count": $('#hdate7').val(),
			 "visits": $('#hmember7').val()
			}];

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.dataFields.category = "count";
		categoryAxis.renderer.minGridDistance = 40;
		categoryAxis.fontSize = 11;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.min = 0;
		valueAxis.max = 1000;
		valueAxis.strictMinMax = true;
		valueAxis.renderer.minGridDistance = 30;
		// axis break
		var axisBreak = valueAxis.axisBreaks.create();
		axisBreak.startValue = 500;
		axisBreak.endValue = 600;
		//axisBreak.breakSize = 0.005;

		// fixed axis break
		var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
		axisBreak.breakSize = 0.05 * (1 - d) / d; 

		// make break expand on hover
		var hoverState = axisBreak.states.create("hover");
		hoverState.properties.breakSize = 1;
		hoverState.properties.opacity = 0.1;
		hoverState.transitionDuration = 1500;

		axisBreak.defaultState.transitionDuration = 1000;
		/*
		// this is exactly the same, but with events
		axisBreak.events.on("over", function() {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
		    1500,
		    am4core.ease.sinOut
		  );
		});
		axisBreak.events.on("out", function() {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
		    1000,
		    am4core.ease.quadOut
		  );
		});*/

		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "count";
		series.dataFields.valueY = "visits";
		series.columns.template.tooltipText = "{valueY.value}";
		series.columns.template.tooltipY = 0;
		series.columns.template.strokeOpacity = 0;

		// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
		series.columns.template.adapter.add("fill", function(fill, target) {
		  return chart.colors.getIndex(target.dataItem.index);
		});

		}); // end am4core.ready()
	
})

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
	
	<section id="portfolio">
		<div class="container">
		<h2 style=" height: 60px; padding: 20px;">데이터 총계</h2>
				<table class="ot_info">
		<tr>
			<th>총 가입자 수</th>
			<th>총 판매액</th>
			<th>총 조회수</th>
		</tr>
		<tr>
			<td><fmt:formatNumber value="${total.memberCount }" pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${total.revenue }" pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${total.boardCount }" pattern="###,###,###" /></td>
		</tr>
		</table>
		
			<!-- 취향 비율 -->
			<input type="hidden" id="htype" value="${type[0] }">
			<input type="hidden" id="htype2" value="${type[1] }">
			<input type="hidden" id="htype3" value="${type[0] + type[1] }">
			<!-- /취향 비율 -->
			<!--  가입자 추이 -->
			<c:forEach var="hList" items="${list }" varStatus="status">
			<input type="hidden" id="hdate${status.count}" value="<fmt:parseDate var="dateString" value="${hList.date}" pattern="yyyy-MM-dd" /><fmt:formatDate value="${dateString }" pattern="MM.dd" />">			
			<input type="hidden" id="hmember${status.count}" value="${hList.member}">			
			</c:forEach>
			
			<!--  /가입자 추이 -->
			
			<h2 style=" height: 60px; padding: 20px;">관심사 & 가입자 수 차트</h2>
			<div style=" height: 500px; padding: 50px; background-color: #f4f4f4">
			<div id="chartdiv" class="row" ></div>
			<div id="chartdiv2" class="row" ></div>
			</div>			
		
    <!--/#feature-->
    		<div style="clear: both;">
    		<h2 style=" height: 60px; padding: 20px;">일별 데이터 증감율</h2>
    		</div>
			<table class="ot_info">
					<tr>
						<th>날짜<th>
						<th>증감율</th>
						<th>가입자수</th>
						<th>증감율</th>
						<th>판매액</th>
						<th>증감율</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.date }<td>
						<c:choose>
						<c:when test="${list.mrate > 0 }">
							<td style="color: red;">▲${list.mrate }%</td>
						</c:when>
						<c:when test="${list.mrate == 0 }">
							<td>${list.mrate }%</td>
						</c:when>
						<c:otherwise>
							<td style="color: blue;">▼${list.mrate }%</td>
						</c:otherwise>
						</c:choose>
						
						<td>${list.member }</td>
						
						<c:choose>
						<c:when test="${list.rrate > 0 }">
							<td style="color: red;">▲${list.rrate }%</td>
						</c:when>
						<c:when test="${list.rrate == 0 }">
							<td>${list.rrate }%</td>
						</c:when>
						<c:otherwise>
							<td style="color: blue;">▼${list.rrate }%</td>
						</c:otherwise>
						</c:choose>
						
						<td>${list.revenue }</td>
				
						<c:choose>
						<c:when test="${list.brate > 0 }">
							<td style="color: red;">▲${list.brate }%</td>
						</c:when>
						<c:when test="${list.brate == 0 }">
							<td>${list.brate }%</td>
						</c:when>
						<c:otherwise>
							<td style="color: blue;">▼${list.brate }%</td>
						</c:otherwise>
						</c:choose>
						
						<td>${list.board }</td>
						
					</tr>
					</c:forEach>
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
<%@page import="event.vo.EventWinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*

포인트 불러오기
포인트 교환권 사용하기
당첨내역 불러오기
당첨등록

*/



%>
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

<!-- 이벤트 css, js -->
<link href="css/event.css" rel="stylesheet">
<link rel="stylesheet" href="event/assets/countdown/jquery.countdown.css" />

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="event/assets/countdown/jquery.countdown.js"></script>
<script src="<c:url value="js/event.js" />"></script>
<script src="<c:url value="js/eventPop.js" />"></script>
<script src="<c:url value="js/jquery-3.5.0.js" />"></script>

<!-- /이벤트 css, js -->

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>

<script type="text/javascript">

function eventWinList(sel) {
	
	if($("#sel option:selected").val() != "선택") {
		sel = 
		$.ajax({  

		    type : "POST",
		    url : "eventChangeList.ev",  
		    data : {"sel": sel},  
		    dataType : "json",  
		    success : function(rdata){
		    	
		    	$("#table1 tr:not(:first)").empty();
		    	$("#table2 tr:not(:first)").empty();
		    	
		    	$("#table1").append("<tr><td>"+rdata[1].e_round+"</td><td>"+rdata[1].e_sdate+"</td><td>"+rdata[1].e_edate+"</td></tr>");
		    	
		    	$.each(rdata[0], function(index, item) {
		    		$("#table2").append("<tr><td>"+item.member_id+"</td><td>"+item.ew_date+"</td><td>"+item.cp_3+"</td><td>"+item.cp_5+"</td><td>"+item.cp_10+"</td></tr>");
		    	});
		    }  
		});
	}

}

</script>
<script type="text/javascript">

$(document).ready(function() {
	
	eventWinList();

	$("#selboxDirect").hide();
	
	$("#sel").change(function() {
		
		if($("#sel").val() == "직접입력") {

			$("#selboxDirect").show();
			
		}else {
				
			var sel = $("#sel option:selected").val();
				
			$("#selboxDirect").hide();
			
			eventWinList(sel);
		}

	});
	
	$("#selectBtn").click(function() {
		
		var sel = $("#selboxDirect").val();
		eventWinList(sel);	
	});
}); 
</script>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>이벤트 관리</h1>
    </div>

    <section id="contact-page">

<h1>이벤트시작, 종료 및 당첨내역??</h1>
<input type="text" id="selboxDirect" name="selboxDirect"/>
<select id="sel">
<option value="선택">선택</option>

<c:forEach var="wList" items="${eventWinList}" varStatus="status" step="3">
<option>${status.count}</option>
</c:forEach>
<option value="직접입력">직접입력</option>
</select>
<input type="button" value="확인" id="selectBtn"/>


<h2>이벤트 회차</h2>

<table border="1" id="table1">
<tr><td>회차</td><td>시작일</td><td>종료일</td></tr>
</table>

<h2>당첨내역</h2>


<table border="1" id="table2">
<tr><td>당첨자</td><td>당첨일</td><td>30000P</td><td>50000P</td><td>100000P</td></tr>
</table>


    </section>
    <!--/#bottom-->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!--/#footer-->

<!--     <script src="js/jquery.js"></script> -->

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>
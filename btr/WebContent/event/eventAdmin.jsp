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

</script>
<script type="text/javascript">



</script>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>이벤트 관리</h1>
    </div>

    <section id="contact-page">

<h1>이벤트시작, 종료 및 당첨내역??</h1>

<h2>이벤트 회차</h2>
<table border="1">
<tr><td>회차</td><td>시작일</td><td>종료일</td></tr>


<c:forEach var="List" items="${eventList}">
<tr><td>${List.e_num}</td><td>${List.e_sdate}</td><td>${List.e_edate}</td></tr>
</c:forEach>



</table>



<h2>당첨내역</h2>
<select id="sel">
<option>96</option>
<option>1</option>
<option>3</option>
</select>
<table border="1" id="table2">
<tr><td>회차</td><td>당첨자</td><td>당첨일</td></tr>


<c:forEach var="wList" items="${eventWinList}">
<tr><td>${wList.round}</td><td>${wList.member_id}</td><td>${wList.e_date}</td></tr>
</c:forEach>



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
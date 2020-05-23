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

<!-- /이벤트 css, js -->

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>무료 이벤트</h1>
    </div>

    <section id="contact-page">
<br>

    	<div class="event">
    	<input type="hidden" id="hid" value="${date}">
			<p>나의 포인트  <em><i id="myCoupon">${point}</i>점</em></p>
			<a href="javascript:void(0);" class="getCoupon" onclick="return eventPop()">당첨내역</a>
			<a href="javascript:void(0);" class="getCoupon" onclick="return adminPop()">관리자</a>
		</div>
		
		<p class="description">* 매일 하루 <b>한번</b> 씩 최대 <b>5번</b> 뽑기 가능하며, 1회당 <b>100포인트</b>가 차감됩니다.</p>
		<div style="border: 1px solid; width: 800px; height: 920px;margin: auto; background-image: url('images/event8.png'); background-size: contain;">
		<div id="countdown" style="margin-top: 50px;"></div>
		<ul class="ul">
		<li class="li">Day</li>
		<li class="li">Hour</li>
		<li class="li">Minute</li>
		<li class="li">Second</li>
		</ul>
		<h2 id="sample02"></h2>
		
		<p class="p1"><img src="images/box.png" id="img"></p>
		<div id="eventBox">
		<input type="button" value="지금 뽑기" id="btn" width="100" height="100"><br>
		</div>
		</div>	
				<div class="couponArea" id="cpArea">
				<h3>이벤트 당첨쿠폰</h3>
				<div class="cpStatus ">
					<ul>
						<li style="background-image: url('images/event10.png'); background-size: contain;">
							<a onclick="" class="" >
								<i class="ico"></i>
								<strong>포인트 30000</strong>
								<p>보유쿠폰: <em>${article.ew_30000}</em> 장</p>
								<input type="button" value="교환" onclick="location.href='eventExchangePoint.ev?point=30000'">
							</a>
						</li>
						<li class="review  emth5">
							<a onclick="" class="">
								<i class="ico"></i>
								<strong>포인트 50000</strong>
								<p>보유쿠폰: <em>${article.ew_50000}</em> 장</p>
								<input type="button" value="교환" onclick="location.href='eventExchangePoint.ev?point=50000'">
							</a>
						</li>
						<li class="ad  emth8">
							 <a onclick="" class="">
								<i class="ico"></i>
								<strong>포인트 100000</strong>
								<p>보유쿠폰: <em>${article.ew_100000}</em> 장</p>
								<input type="button" value="교환" onclick="location.href='eventExchangePoint.ev?point=100000'">
							</a>
						</li>
					</ul>
				</div>

			</div>

					<div class="warning">
				<h3>이벤트 응모 시 유의사항</h3>
				<ul class="first">
					<li>비정상적으로 참여하거나 상업적 용도로 참여하는 경우 당첨에 제외되며, 취소될 수 있습니다. </li>
					<li>포인트 쿠폰은 당첨 즉시 사용 가능합니다.</li>		
					<li>본 이벤트는 부득이한 사정에 의해 조기종료 될 수 있습니다.</li>
				</ul>
							</div>

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
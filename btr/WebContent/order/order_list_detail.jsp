<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- core CSS -->
<link href="css/product_modal.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link href="css/order.css" rel="stylesheet">


<script src="js/jquery-3.5.0.js"></script>

<style type="text/css">
.o_info {background: #f4f4f4;}
.loginInput {
  
  
  padding: -5px 10px;
  border: 1px solid #ccc;
  margin-bottom: 5px;
 
}
</style>
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	<div class="page-title"
		style="background-image: url(images/page-title.png);">
		<h1>Order</h1>
	</div>
	<section id="portfolio">
		<div class="center" style="padding: 0; margin: 0;">
			<h2>상세정보</h2>
		</div>
		<div class="container" style=" margin-top: -50px;">
			<div class="o_info o_input" style="font-size: 12pt;">
				<h2><span>구매일자: 2020.06.10</span></h2>
			</div>
			<div class="o_list">
				<h2>주문내역</h2>
				<table class="ot_list">
					<tr>
						<th colspan="2">상품정보</th>	
						<th>가격</th>
						<th>수령</th>
						<th>합계</th>
					</tr>
					
					<tr>
						<td>이미지</td>
						<td>상품명</td>
						<td>1000원</td>
						<td>20</td>
						<td>20000원</td>
					</tr>
				</table>
			</div>
			<div class="o_list">
				<h2>결제정보</h2>
				<table class="ot_list">
					<tr style="height: 200px;">
						<td style="border-right: 1px solid #e6e6e6; text-align: center; width: 33%;  font-size: 16pt;">총 상품 금액<br>20000원</td>	
						<td style="border-right: 1px solid #e6e6e6; text-align: center; width: 33%; font-size: 16pt;">쿠폰할인금액<br>0 원</td>
						<td style="text-align: center; width: 33%; font-size: 16pt;">결제<br>20000원<br>카드결제</td>
					</tr>
					
					<tr style="height: 100px; font-size: 16pt;" >
						<th colspan="3" style="text-align: right; padding-right: 20px;">총 결제금액 <span style="color: red;">  20000원</span></th>
					</tr>
					<tr style="text-align: right;">
						<td colspan="3">withTrip 적립 포인트: <span style="color: orange;">20P</span></td>
					</tr>
				</table>
			</div>
	</div>
	</section>



	<jsp:include page="/inc/bottom.jsp" />
	<!--/#footer-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
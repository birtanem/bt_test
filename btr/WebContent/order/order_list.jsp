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
		<h1>Order22</h1>
	</div>
	<section id="portfolio">
		<div class="center" style="padding: 0; margin: 0;">
			<h2>주문내역</h2>
		</div>
		<div class="container" style="margin-top: -50px;">
			<div class="o_info o_input" style="font-size: 12pt;">
				<h2>구매기간 <input type="button" value="1개월"><input type="button" value="3개월"><input type="button" value="6개월"></h2><br>
				<select class="loginInput">
				<option>2018</option>
				<option>2019</option>
				<option>2020</option>
				</select>년
				<select class="loginInput">
				<c:forEach var="i" begin="1" end="12">
						<option>${i }</option>
				</c:forEach>		
				</select>월
				<select class="loginInput">
				<c:forEach var="i" begin="1" end="30">
						<option>${i }</option>
				</c:forEach>
				</select>일  ~     
				
				<select class="loginInput">
				<option>2018</option>
				<option>2019</option>
				<option>2020</option>
				</select>년
				<select class="loginInput">
				<c:forEach var="i" begin="1" end="12">
						<option>${i }</option>
				</c:forEach>		
				</select>월
				<select class="loginInput">
				<c:forEach var="i" begin="1" end="30">
						<option>${i }</option>
				</c:forEach>
				</select>일
			</div>
			<div class="o_list">
				<h2>주문내역</h2>
				<table class="ot_list">
					<tr>
						<th>주문일자</th>
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
					
					<tr>
						<td><a href="orderListDetail.or">2020.06.01<br>상세보기</a></td>
						<td>이미지</td>
						<td>상품명</td>
						<td>10</td>
						<td>100000원</td>
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
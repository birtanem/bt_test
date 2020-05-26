
<%@page import="product.vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//ArrayList<ProductBean> productList = (ArrayList<ProductBean>) request.getAttribute("productList");
	//int ListCount = (int) request.getAttribute("ListCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>

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

<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">

<script type="text/javascript">
function changeRegionCode(p_num, regionCode){
	location.href="productUpdatePro.pr?p_num="+p_num+"&region_region_code="+regionCode;
}

function changeCategory(p_num, category){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_category="+category;
}
function changeName(p_num, name){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_name="+name;
}
function changeCategory(p_num, price){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_price="+price;
}
function changeCategory(p_num, amount){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_amount="+amount;
}
</script>

</head>

<body>

	<jsp:include page="/inc/top.jsp" />

	<div class="container">
		<c:choose>
			<c:when test="${ListCount>0 && productList !=null}">
				<table>
					<tr>
						<td>번호</td>
						<td>지역코드</td>
						<td>카테고리</td>
						<td>상품명</td>
						<td>이미지</td>
						<td>가격</td>
						<td>수량</td>
						<td>관리</td>
					</tr>
					<c:forEach var="list" items="${productList }" varStatus="vs">
						<tr>
							<td>${list.p_num}</td>
							<td><select name="regionCode" onchange="changeRegionCode('${list.p_num }',this.value);">
									<option selected value="${list.region_region_code }">${list.region_name }</option>
									<option value="1">부산진구</option>
									<option value="2">남포동</option>
									<option value="3">용호동</option>
									<option value="4">기장</option>
									<option value="5">영도</option>
							</select></td>
							<td><select name="category" onchange="changeCategory('${list.p_num }',this.value);">
									<option selected value=${list.p_category }>${list.p_category }</option>
									<option value="아쿠아리움">아쿠아리움</option>
									<option value="전시">전시</option>
									<option value="요트">요트</option>
									<option value="체험">체험</option>
							</select></td>
							<td><input type="text" name=name value="${list.p_name }" onchange="changeName('${list.p_num }',this.value);"></td>
							<td><input type="text" name=img value="${list.p_image }"></td>
							<td><input type="text" name=price value="${list.p_price }" onchange="changePrice('${list.p_num }',this.value);"></td>
							<td><input type="text" name=amount value="${list.p_amount }" onchange="changeAmount('${list.p_num }',this.value);"></td>
							<td><input type="button" value="내용수정하기" id="myBtn"></td>
						</tr>

						<!-- 	The Modal -->
						<div id="myModal" class="modal">
							<!-- Modal content -->

							<div class="modal-content">
								<div class="modal-header">
									<span class="close">&times;</span>
									<h2>
										<input type="text" class="text" value="${list.p_name}">
									</h2>
								</div>

								<div class="modal-body">
									<textarea rows="20" cols="120">${list.p_content}</textarea>
								</div>
								<div class="modal-footer">
									<h3>
										<input type="button" value="수정" onclick="#"> <input
											type="button" value="취소" onclick="#">
									</h3>
								</div>
							</div>
						</div>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<section id="emptyArea">등록된 상품이 없습니다.</section>
			</c:otherwise>
		</c:choose>





	</div>



	<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					&copy; 2013 <a target="_blank" href="http://shapebootstrap.net/"
						title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>.
					All Rights Reserved.
				</div>
				<div class="col-sm-6">
					<ul class="pull-right">
						<li><a href="#">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Faq</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->
	<script src="js/product_modal.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
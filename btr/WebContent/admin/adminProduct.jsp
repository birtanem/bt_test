
<%@page import="product.vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ProductBean> productList = (ArrayList<ProductBean>) request.getAttribute("productList");
	int ListCount = (int) request.getAttribute("ListCount");
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

</head>

<body>

	<jsp:include page="/inc/top.jsp" />
	<div class="container">
		<table>
			<tr>
				<td>번호</td>
				<td>카테고리</td>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>관리</td>
			</tr>

			<%
				if (productList != null && ListCount > 0) {
					for (int i = 0; i < productList.size(); i++) {
			%>
			<tr>
				<td><%=productList.get(i).getP_num()%></td>
				<td><%=productList.get(i).getP_category()%></td>
				<td><%=productList.get(i).getP_name()%></td>
				<td><%=productList.get(i).getP_price()%></td>
				<td><%=productList.get(i).getP_amount()%></td>
				<td><input type="button" value="수정하기"
					id="myBtn"></td>
			</tr>

			<!-- 	The Modal -->
			<div id="myModal" class="modal">
				<!-- Modal content -->
					
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>
						<h2><input type="text" class="text" value="<%=productList.get(i).getP_name()%>"></h2>
					</div>

					<div class="modal-body">
						<textarea rows="20" cols="120"><%=productList.get(i).getP_content()%></textarea>
					</div>
					<div class="modal-footer">
						<h3>

							가격: <input type="text" value="<%=productList.get(i).getP_price()%>">
							수량: <input type="text" value="1">
							<input type="button" value="수정" onclick="#"> <input
								type="button" value="취소" onclick="#">
						</h3>
					</div>
				</div>
				
			</div>	
			<%
				}
				} else {
			%>
			<section id="emptyArea">등록된 상품이 없습니다.</section>
			<%
				}
			%>

		</table>

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
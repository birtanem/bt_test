<%@page import="place.vo.PlaceBean"%>
<%@page import="place.vo.PlacePageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="nowPage" value="${page }" />
    <%String id = (String)session.getAttribute("id");
      String nowPage = request.getParameter("page");
      String adminid = "admin";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | AdminPage</title>
<!-- core CSS -->
<link href="css/product_modal.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/review.css" rel="stylesheet">
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
<!--/head-->
<body>
	<jsp:include page="/inc/top.jsp" />
	<!--/header-->
	<div class="page-title"
		style="background-image: url(images/page-title.png)">
		<h1>Place(부산 명소 소개)</h1>
	</div>
	<section id="writeForm"">
 	<div class="blog container">
		<h1>장소 소개 글 등록</h1>
		<form action="PlaceWritePro.pl" method="post" enctype="multipart/form-data" name="placeForm">
			<input type="hidden" name="pl_num" value=${article.pl_num }>
			<table>
			<tr><td>장소명 :</td><td> <input type="text" name="pl_name" value="${article.pl_name } required="required" /></td></tr>
			<tr><td>장소 소개 내용 </td><td><textarea name="pl_content" cols="40" rows="15" value="${article.pl_content } required="required" style="resize: none;"></textarea></td></tr>
			<tr><td>주소 : </td><td><input type="text" name="pl_address" value="${article.pl_address } required="required"/></td></tr>
			<tr><td>사진파일 : </td><td>
				<input type="file" name="pl_image"><c:out value="${article.pl_image }"/>
		    	<input type="hidden" name="oldfile" value="${article.pl_image }">
			
			
			<tr><td>주제 : </td><td><input type="text" name="pl_theme" value="${article.pl_theme } required="required"/></td></tr>
			<tr><td>지역 : </td><td>
						<select name="region_code">
		            			<option value="0">지역 선택하세요</option>
		            			<option value="1">강서구</option>
		            			<option value="2">금정구</option>
		            			<option value="3">기장군</option>
		            			<option value="4">남구</option>
		            			<option value="5">동구</option>
		            			<option value="6">동래구</option>
		            			<option value="7">부산진구</option>
		            			<option value="8">북구</option>
		            			<option value="9">사상구</option>
		            			<option value="10">사하구</option>
		            			<option value="11">서구</option>
		            			<option value="12">수영구</option>
		            			<option value="13">연제구</option>
		            			<option value="14">영도구</option>
		            			<option value="15">중구</option>
		            			<option value="16">해운대구</option>
		            			<option value="17">기타지역(부산외)</option>
		                 	</select></td></tr>
				
				<tr><td colspan=2><input type="submit" value="등록">
								<input type="reset" value="다시쓰기"></td></tr>
			</table>
		</form>
		</div>
	</section>

	
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
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>

<%@page import="product.vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="js/jquery-3.5.0.js"></script>
<style type="text/css">
.p_file {
	display: none;
}
</style>
<script type="text/javascript">

function changeRegionCode(p_num, regionCode,idx){
	location.href="productUpdatePro.pr?p_num="+p_num+"&region_region_code="+regionCode;
	alert("내용 변경됨");
}
function changeCategory(p_num, category){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_category="+category;
	alert("내용 변경됨");
}
function popImg(p_num){
	window.open("productimage.pr?p_num="+p_num,"","width=400,height=150,left=200,top=300,scrollbars=yes,resizable=yes");
}
function popContent(idx){
 	document.getElementById('myModal'+idx).style.display = "block";
}
function closepop(idx){
	document.getElementById('myModal'+idx).style.display = "none";
}
function updateContent(){
	location.href="productUpdatePro.pr?p_num="+p_num+"&p_category="+category;
}
function reload(){
	location.reload();
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
						<td><input type="checkbox"></td>
						<td>번호</td>
						<td>지역코드</td>
						<td>카테고리</td>
						<td>상품명</td>
						<td>이미지</td>
						<td>내용</td>
						<td>가격</td>
						<td>수량</td>
						<td>관리</td>
					</tr>
					<c:forEach var="list" items="${productList }" varStatus="vs">
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>${list.p_num}</td>

							<td><select name="regionCode" id="regionCode${vs.count }"
								onchange="changeRegionCode('${list.p_num }',this.value,${vs.count });">
									<option selected value="${list.region_region_code }">${list.region_name }</option>
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
									<option value="17">기타지역(부산 외)</option>
							</select></td>
							<td><select name="category"
								onchange="changeCategory('${list.p_num }',this.value);">
									<option selected value=${list.p_category }>${list.p_category }</option>
									<option value="아쿠아리움">아쿠아리움</option>
									<option value="전시">전시</option>
									<option value="요트">요트</option>
									<option value="체험">체험</option>
							</select></td>
							<form action="productUpdatePro.pr" enctype="multipart/form-data"  method="post" name="fr">
								<td><input type="hidden" name="p_num"
									value="${list.p_num }"> <input type="text" name="name"
									value="${list.p_name }"></td>
								<td><input type="text" name="img" value="${list.p_image }"
									id="p_img${vs.count }" readonly="readonly"
									onclick="popImg(${list.p_num})"></td>
								<td><input type="text" name="p_content"
									value="${list.p_content }" onclick="popContent(${vs.count})"></td>
								<td><input type="text" name="price"
									value="${list.p_price }"></td>
								<td><input type="text" name="amount"
									value="${list.p_amount }"></td>
								<td><input type="submit" value="내용수정하기" id="myBtn"
									class="btn"></td>
							</form>
						</tr>


							<!-- Modal content -->
						<div id="myModal${vs.count }" class="modal">
							<div class="modal-content">
								<div class="modal-header">
									<span class="close" onclick="closepop(${vs.count})">&times;</span>
									<h2>
										${list.p_name}
									</h2>
								</div>
								<form action="productUpdatePro.pr" enctype="multipart/form-data"  method="post" name="fr">
								<div class="modal-body">
									<textarea rows="20" cols="120" name="content">${list.p_content}</textarea>
								</div>
								</form>
								<div class="modal-footer">
									<h3>
										<input type="submit" value="수정" class="btn" onclick="updateContent(${p_num})">
										<input type="button" value="취소" class="btn"
											onclick="closepop(${vs.count})">
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

	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | ProductDetail</title>

<!-- core CSS -->
<link href="css/productDetail.css" rel="stylesheet">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#minus').click(function(){
		var count=Number(document.getElementById("amount").value)-1;
		var meg="주문가능한 최소 수량은 1 입니다.";
		var max=${productDetail.p_amount};
		if(count<1){
			count=1;
			$(".detailCheck").css('color','red').html(meg);
			return false;
		}else if(count>max){
			$(".detailCheck").css('color','red').html("주문 가능한 수량을 초과했습니다.");
		}else{
			$(".detailCheck").html("");
		}
		document.getElementById("amount").value=count;
	});
	$('#plus').click(function(){
		var count=Number(document.getElementById("amount").value)+1;
		var max=${productDetail.p_amount};
		var meg="주문 가능한 수량을 초과했습니다.";
		if(count>max){
			$(".detailCheck").css('color','red').html(meg);
			return false;
		}else{
			$(".detailCheck").html("");
		}
		document.getElementById("amount").value=count;
	});
	
	 $("#orderBtn").click(function() {
		 
		 	var messageChk = ${productDetail.p_num};
		 	var amountChk = document.getElementsByName("amount");
		 	var priceChk = document.getElementsByName("price");
		 	var price = 0;
		    var testList = new Array() ;
		         
		        // 객체 생성
		        var data = new Object() ;
		         
		     // 리스트에 생성된 객체 삽입
		        	price += Number(priceChk[i].value);
		        	data.num =  messageChk[i].value;
				    data.amount = amountChk[i].value;
				    data.price = document.getElementById("td"+(i+1)).innerText;
				    testList.push(data) ;
				    
//		     // String 형태로 변환
		    var jsonData = JSON.stringify(testList) ;
		     
			$.ajax("orderFront.or", {
				type:"POST",
				data: {"jsonData": jsonData,
					   "total": price},
				success: function() {
					location.href="orderForm.or"
				}
			});
	});
	
	
	
	
});
function goCart(){
	var id='admin'; 
	var amount=Number(document.getElementById("amount").value);
	var max=${productDetail.p_amount};
	if(id==null || id=="null"){
		alert("로그인 후 이용해주세요");
		location.href="MemberLoginForm.me";
		return false;
	}if(amount>max){
		document.getElementById("detailCheck").innerText="주문 가능한 수량을 초과했습니다.";
		return false;
	}
	location.href="ProductCartAdd.ca?p_num="+${productDetail.p_num}+"&p_amount="+amount;
}


</script>
</head>
<body>
	<!-- 탑 -->
	<jsp:include page="/inc/top.jsp" />
	<div class="page-title"
		style="background-image: url(images/page-title.png)">
		<h1>ProductDetail</h1>
	</div>
	<!-- 본문 -->

<section id="portfolio">
	<div>
		<div id="product_img">
			<img src="product/productUpload/${productDetail.p_image }"
				alt="product">
		</div>
		<div id="product_detail">
			<div>

				<p>#${productDetail.p_category}&nbsp;
					#${productDetail.region_name }</p>
				<p>${productDetail.p_name }</p>
				<p>
					<fmt:formatNumber value="${productDetail.p_price }"
						pattern="###,###,###" />
				</p>
				<br>
			</div>
			<div>
				<span>수량 &nbsp; </span> <input type="button" value="-" class="btn"
					id="minus"> <input type="text" value="1" id="amount"
					name="amount"> <input type="button" value="+" class="btn"
					id="plus">
				<p class="detailCheck" id="detailCheck"></p>
			</div>
			<div>
				<input type="button" value="구매하기" class="btn" id="orderBtn"> <input
					type="button" value="장바구니" class="btn" onclick="goCart()">
			</div>
		</div>
		<div id="content">
			<p>${productDetail.p_content }</p>
		</div>



	</div>

	<section id="bottom">
		<div class="container fadeInDown" data-wow-duration="1000ms"
			data-wow-delay="600ms">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Company</h3>
						<ul>
							<li><a href="#">About us</a></li>
							<li><a href="#">We are hiring</a></li>
							<li><a href="#">Meet the team</a></li>
							<li><a href="#">Copyright</a></li>
							<li><a href="#">Terms of use</a></li>
							<li><a href="#">Privacy policy</a></li>
							<li><a href="#">Contact us</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Support</h3>
						<ul>
							<li><a href="#">Faq</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Forum</a></li>
							<li><a href="#">Documentation</a></li>
							<li><a href="#">Refund policy</a></li>
							<li><a href="#">Ticket system</a></li>
							<li><a href="#">Billing system</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Developers</h3>
						<ul>
							<li><a href="#">Web Development</a></li>
							<li><a href="#">SEO Marketing</a></li>
							<li><a href="#">Theme</a></li>
							<li><a href="#">Development</a></li>
							<li><a href="#">Email Marketing</a></li>
							<li><a href="#">Plugin Development</a></li>
							<li><a href="#">Article Writing</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Our Partners</h3>
						<ul>
							<li><a href="#">Adipisicing Elit</a></li>
							<li><a href="#">Eiusmod</a></li>
							<li><a href="#">Tempor</a></li>
							<li><a href="#">Veniam</a></li>
							<li><a href="#">Exercitation</a></li>
							<li><a href="#">Ullamco</a></li>
							<li><a href="#">Laboris</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->
			</div>
		</div>
	</section>
	<!--/#bottom-->
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
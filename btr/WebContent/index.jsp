<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | With Trip</title>

<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">

<!--  맵 css, js -->
<link href="css/map.css" rel="stylesheet">

<script src="<c:url value="/js/map.js" />"></script>
<script src="js/jquery-3.5.0.js"></script>
<!--  맵 css, js -->



<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var apiURL = 'http://api.openweathermap.org/data/2.5/forecast?q=Busan,KR&appid=69dfa3d384134e76fbafdfc2dcf8765e&units=metric&cnt=8';
						$
								.getJSON(
										apiURL,
										function(rdata) {

											$
													.each(
															rdata.list,
															function(index,
																	item) {

																var today = new Date(
																		item.dt_txt);
																var icon = item.weather[0].icon;
																var hour = today
																		.getHours();

																$('.time')
																		.append(
																				"<div style='float:left; width: 65px; height: 100px; text-align: center; color: black;'>"
																						+ hour
																						+ '시'
																						+ '<br>'
																						+ '<img src="icon/'+icon+'.png" width = "50" height = "50" />'
																						+ item.main.temp
																								.toFixed(0)
																						+ "˚C"
																						+ "</div>");

															});

										});

						var apiURL = 'http://api.openweathermap.org/data/2.5/forecast?q=Busan,KR&appid=69dfa3d384134e76fbafdfc2dcf8765e&units=metric';
						var week = new Array('일', '월', '화', '수', '목', '금', '토');

						$.getJSON(apiURL,function(rdata) {
											$.each(rdata.list,function(index,item) {

																if (index % 8 == 2) {

																	var icon = item.weather[0].icon;
																	var date = new Date(
																			item.dt_txt)
																			.getDay();
																	var label = week[date];

																	$('.day')
																			.append(
																					"<div style='float:left; width: 104px; height: 100px; text-align: center; color: black;'>"
																							+ label
																							+ "<br>"
																							+ '<img src="icon/'+icon+'.png" width = "50" height = "50" />'
																							+ '<br>'
																							+ item.main.temp
																									.toFixed(0)
																							+ "˚C"
																							+ "</div>");
																}

															});

										});

					});
</script>

<script type="text/javascript">
	$(function() {
		var ranNum = Math.floor(Math.random() * 16);

		$(".tabcontent:eq(" + ranNum + ")").css("display", "block")
		$(".tablinks:eq(" + ranNum + ")").css("background-color", "#ddd");

	});

	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>

<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	width: 1550px;
	text-align: center;
	overflow: hidden;
	border: 0 solid #ccc;
	background-color: #f1f1f1;
	padding: 5px;
	margin: 0 auto;
}

.tabcontainer {
	
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
	width: 1550px;
	margin: 0 auto;
}
</style>


<!-- 실시간검색어 -->

<style type="text/css">
#realcontent {
	width: 250px;
	margin: 5px;
	padding: 10px;
	background: white;
	text-align: center;
	float: right;
}

#rank-list a {
	color: black;
	text-decoration: none;
}

#rank-list a:hover {
	text-decoration: underline;
}

#rank-list {
	overflow: hidden;
	width: 250px;
	text-align: left;
	height: 20px;
	margin: 0;
}

#rank-list dd {
	position: relative;
	margin: 0;
}

#rank-list ol {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#rank-list li {
	width: 150px;
	text-align: right;
	height: 20px;
	line-height: 20px;
}

.rankingcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
	width: 250px;
	left: 0;
}

#maincontent {
	border: 5px solid;
}

#mainImg {
	width: 100%;
	height: 1200px;
	background-position: center;
	background-attachment: fixed;
}

#bgImg {
	width: 110%;
	height: 100%;
}

.mainText {
	text-align: center;
	padding-top: 300px;
	padding-bottom: 300px;
}

.mainBox span {
	padding-top: 5px; color : white;
	font-size: 32px;
	color: white;
}

.mainBox h2 {
	margin-top: 40%;
}

.mainBox {
	width: 500px;
	height: 500px;
	border: 3px solid white;
	text-align: center;
	margin: 0 auto;
}

.topH {
	position: absolute;
	width: 100%;
	margin-left: 80px;
}

a:hover {
	color: #EC5538;
}

.topLogin {
	float: right;
	margin-top: 20px;
	margin-right: 200px;
}

.logo {
	margin-top: 50px;
	margin-left: 40px;
	float: left;
}

.topli {
	margin-top: 50px;
	float: right;
}
</style>
<script type="text/javascript">
	$(function() {
		var count = $('#rank-list li').length;
		var height = $('#rank-list li').height();

		function step(index) {
			$('#rank-list ol').delay(2000).animate({
				top : -height * index,
			}, 500, function() {
				step((index + 1) % count);
			});
		}
		step(1);
	});
</script>

<!-- placeList main -->
<script type="text/javascript">
	// 메인사진 랜덤 출력
	$(document).ready(function() {
		var imgRan = Math.round(Math.random() * 14);
		var imgPath = ('images/main/busan' + imgRan + '.jpg');
		// 	document.getElementById('bgImg').src=imgPath;
		$('#mainImg').css('background-image', 'url(' + imgPath + ')');
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//0: 세션없음  1: 세션있음 ; 데이터가져옴
		var session= "<%=session.getAttribute("id")%>";
		var check=1;
		if(session==null||session=="null"){
			check=0;
			}
		else{
			check=1;
		}
		$('#test').click(function(){
		$.ajax('PlaceList.pl?check='+check+'&id='+session,{
			dataType: "json",
			success:function(rdata){
				$.each(rdata, function(index, item){
					var imgpath="placeUpload/"+item.pl_img;
					alert(item.session+ item.pl_theme);
// 					$('#here').append(item.session);
					if((item.session)==item.pl_theme){
						alert("yeah");
						$('#mig').attr("alt",item.pl_theme);
						$('#mig').attr("src",imgpath);					
					}else{
						alert("노일치");
						$('#mig').attr("src",imgpath);
					}
					
				});
			}
		});
		});
		});
		
	
</script>


</head>
<!--/head-->

<body class="homepage">
	<div class="topH">
		<%-- 		<jsp:include page="inc/top.jsp"></jsp:include> --%>
		<header id="header">
			<div class="topLogin">
				<c:choose>
					<c:when test="${empty sessionScope.id}">
						<a href="MemberLoginForm.me">로그인</a> | 
			<a href="MemberJoinForm.me">회원가입</a>
					</c:when>

					<c:otherwise>
						<span style="color: black;">${sessionScope.id}&nbsp;&nbsp;님</span> |
			<a href="MemberMypage.me">마이페이지</a> | 
			<a href="MemberLogout.me">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
			<nav>
				<div class="topnav">
					<a class="navbar-brand logo" href="index.html"><img
						src="images/logo.png" alt="logo" width="150"></a>
					<ul class="nav navbar-nav topli">
						<!-- 관리자 'admin' 일 경우 관리자 메뉴 노출 -->

						<c:if test="${sessionScope.id == 'admin'}">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">관리자 메뉴 <i class="fa fa-angle-down"></i></a>
								<ol class="dropdown-menu">
									<li><a href="adminPage.ad">관리자 페이지</a></li>
									<li><a href="adminLog.ad">통계</a></li>
									<li><a href="adminProduct.ad">상품 관리</a></li>
									<li><a href="PlaceWriteForm.pl">Place 글 등록</a></li>
									<li><a href="#">여행지 관리</a></li>
									<li><a href="adminSuggestion_List.su">문의 게시판</a></li>
									<li><a href="adminEvent.ad">이벤트 관리</a></li>
								</ol></li>
						</c:if>
						<li class="active"><a href="index.html">Home</a></li>
						<li><a href="PlaceList.pl?check=2">Place</a></li>
						<li><a href="Review_List.re">Review</a></li>
						<li><a href="productList.pr">여행상품</a></li>
						<li><a href="Suggestion_Menu.su">고객센터</a></li>
						<li><a href="event.ev">이벤트</a></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>


	<section id="portfolio" class="no-margin">
		<div id="mainImg" class="mainImg">
			<div class="mainText">
				<div class="mainBox">
					<h2>
						<span>당신과 함께, 부산</span>
					</h2>
				</div>
			</div>
			<!-- 				<img id="bgImg"> -->
		</div>
		<!-- ---------- ------기존 이미지-------------------- -->

		<!--         <div class="carousel slide"> -->
		<!--             <ol class="carousel-indicators"> -->
		<!--                 <li data-target="#main-slider" data-slide-to="0" class="active"></li> -->
		<!--                 <li data-target="#main-slider" data-slide-to="1"></li> -->
		<!--                 <li data-target="#main-slider" data-slide-to="2"></li> -->
		<!--             </ol> -->
		<!--             <div class="carousel-inner"> -->

		<!-- 		                <div class="item active" style="background-image: url(''); background-size: cover;"> -->


		<!--                     <div class="container" style="clear: both;"> -->
		<!--                         <div class="row"> -->
		<!--                             <div class="col-md-7"> -->
		<!--                                 <div class="carousel-content"> -->
		<!--                                     <h1 class="animation animated-item-1"></h1> -->
		<!--                                     <div class="animation animated-item-2"> -->

		<!--                                     </div> -->

		<!--                                 </div> -->
		<!--                             </div> -->

		<!--                         </div> -->
		<!--                     </div> -->
		<!--                 </div> -->
		<!--                 /.item -->

		<!--                 <div class="item" style="background-image: url(images/Busan-main02.jpg);"> -->
		<!--                     <div class="container"> -->
		<!--                         <div class="row"> -->
		<!--                             <div class="col-md-7"> -->
		<!--                                 <div class="carousel-content"> -->
		<!--                                     <h1 class="animation animated-item-1"></h1> -->
		<!--                                     <div class="animation animated-item-2"> -->

		<!--                                     </div> -->

		<!--                                 </div> -->
		<!--                             </div> -->
		<!--                         </div> -->
		<!--                     </div> -->
		<!--                 </div> -->
		<!--                 /.item -->
		<!--                                 <div class="item" style="background-image: url(images/Busan-main03.jpg);"> -->
		<!--                     <div class="container"> -->
		<!--                         <div class="row"> -->
		<!--                             <div class="col-md-7"> -->
		<!--                                 <div class="carousel-content"> -->
		<!--                                     <h1 class="animation animated-item-1"></h1> -->
		<!--                                     <div class="animation animated-item-2"> -->

		<!--                                     </div> -->

		<!--                                 </div> -->
		<!--                             </div> -->
		<!--                         </div> -->
		<!--                     </div> -->
		<!--                 </div> -->
		<!--/.item-->

		<!--             </div> -->
		<!--/.carousel-inner-->
		<!--         </div> -->
		<!--/.carousel-->
		<!--         <a class="prev hidden-xs hidden-sm" href="#main-slider" data-slide="prev"> -->
		<!--             <i class="fa fa-chevron-left"></i> -->
		<!--         </a> -->
		<!--         <a class="next hidden-xs hidden-sm" href="#main-slider" data-slide="next"> -->
		<!--             <i class="fa fa-chevron-right"></i> -->
		<!--         </a> -->
	</section>
	<!-- 메인 지도 -->

	<section id="maincontent">


		<div class="weather"
			style="margin: 0 auto; width: 600px; height: 300px; text-align: left; transform: scale(0.9);">
			<h2 style="margin-left: 20px; color: black;">오늘</h2>
			<div class="time"></div>
			<h2 style="margin-left: 20px; color: black; margin-top: 120px;">주간</h2>
			<div class="day"></div>
		</div>

		
<!-- 		메인 플레이스 -->
		<div class="place">
		 	<div>
				<h2>섹션</h2>
			<div id="here" class="here"><img id="mig"></div>
				<input type="button" id="test" value="test">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
					<input type="hidden" id="sessionId">
						<h2>세션없어?</h2>
					</c:when>
					<c:otherwise>
						<h2>세션있지?? <c:out value="${sessionScope.id }"></c:out>  

						</h2>



					</c:otherwise>
				</c:choose>
			</div>
		</div>




		<!-- <div class="tabcontainer"> -->
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'Buk-gu')">북구</button>
			<button class="tablinks" onclick="openCity(event, 'jin-gu')">진구</button>
			<button class="tablinks" onclick="openCity(event, 'Dong-gu')">동구</button>
			<button class="tablinks" onclick="openCity(event, 'Dongnae-gu')">동래구</button>
			<button class="tablinks" onclick="openCity(event, 'Gangseo-gu')">강서구</button>
			<button class="tablinks" onclick="openCity(event, 'Geumjeong-gu')">금정구</button>
			<button class="tablinks" onclick="openCity(event, 'Haeundae-gu')">해운대구</button>
			<button class="tablinks" onclick="openCity(event, 'Jung-gu')">중구</button>
			<button class="tablinks" onclick="openCity(event, 'Nam-gu')">남구</button>
			<button class="tablinks" onclick="openCity(event, 'Saha-gu')">사하구</button>
			<button class="tablinks" onclick="openCity(event, 'Sasang-gu')">사상구</button>
			<button class="tablinks" onclick="openCity(event, 'Seo-gu')">서구</button>
			<button class="tablinks" onclick="openCity(event, 'Suyeong-gu')">수영구</button>
			<button class="tablinks" onclick="openCity(event, 'Yeongdo-gu')">영도구</button>
			<button class="tablinks" onclick="openCity(event, 'Yeonje-gu')">연제구</button>
			<button class="tablinks" onclick="openCity(event, 'Gijang-gun')">기장군</button>
			<div id="realcontent">
				<dl id="rank-list">
					<dt>인기 여행지</dt>
					<dd>
						<ol>
							<li><a href="#">1 순위</a></li>
							<li><a href="#">2 순위</a></li>
							<li><a href="#">3 순위</a></li>
							<li><a href="#">4 순위</a></li>
							<li><a href="#">5 순위</a></li>
						</ol>
					</dd>

				</dl>

			</div>

		</div>


		<div id="Buk-gu" class="tabcontent">
			<h3>북구</h3>
			<p>북구</p>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4 single-work">
					<div class="recent-work-wrap">
						<img class="img-responsive" src="images/portfolio/item-1.png"
							alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<a class="preview" href="images/portfolio/item-1.png"
									rel="prettyPhoto"><i class="fa fa-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-4 single-work">
					<div class="recent-work-wrap">
						<img class="img-responsive" src="images/portfolio/item-2.png"
							alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<a class="preview" href="images/portfolio/item-2.png"
									rel="prettyPhoto"><i class="fa fa-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-4 single-work">
					<div class="recent-work-wrap">
						<img class="img-responsive" src="images/portfolio/item-3.png"
							alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<a class="preview" href="images/portfolio/item-3.png"
									rel="prettyPhoto"><i class="fa fa-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

			</div>




		</div>

		<div id="jin-gu" class="tabcontent">
			<h3>진구</h3>
			<p>진구</p>
		</div>
		<div id="Dong-gu" class="tabcontent">
			<h3>동구</h3>
			<p>동구</p>
		</div>
		<div id="Dongnae-gu" class="tabcontent">
			<h3>동래구</h3>
			<p>동래구</p>
		</div>
		<div id="Gangseo-gu" class="tabcontent">
			<h3>강서구</h3>
			<p>강서구</p>
		</div>
		<div id="Geumjeong-gu" class="tabcontent">
			<h3>금정구</h3>
			<p>금정구</p>
		</div>
		<div id="Haeundae-gu" class="tabcontent">
			<h3>해운대구</h3>
			<p>해운대구</p>
		</div>
		<div id="Jung-gu" class="tabcontent">
			<h3>중구</h3>
			<p>중구</p>
		</div>
		<div id="Nam-gu" class="tabcontent">
			<h3>남구</h3>
			<p>남구</p>
		</div>
		<div id="Saha-gu" class="tabcontent">
			<h3>사하구</h3>
			<p>사하구</p>
		</div>
		<div id="Sasang-gu" class="tabcontent">
			<h3>사상구</h3>
			<p>사상구</p>
		</div>
		<div id="Seo-gu" class="tabcontent">
			<h3>서구</h3>
			<p>서구</p>
		</div>
		<div id="Suyeong-gu" class="tabcontent">
			<h3>수영구</h3>
			<p>수영구</p>
		</div>
		<div id="Yeongdo-gu" class="tabcontent">
			<h3>영도구</h3>
			<p>영도구</p>
		</div>
		<div id="Yeonje-gu" class="tabcontent">
			<h3>연제구</h3>
			<p>연제구</p>
		</div>
		<div id="Gijang-gun" class="tabcontent">
			<h3>기장군</h3>
			<p>기장군</p>
		</div>
		<!-- </div> -->

		<div class="clearfix text-center" style="clear: both;">
			<br> <br> <a href="#portfolio" class="btn btn-primary">+</a>
		</div>


	</section>

	<!--/#bottom-->

	<jsp:include page="inc/bottom.jsp"></jsp:include>
	<!--/#footer-->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>

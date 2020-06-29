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
<link href="https://fonts.googleapis.com/css2?family=Covered+By+Your+Grace&family=Gochi+Hand&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
$(document).ready(function(){
	location.href="index.jsp#main-map";
});
</script>
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




<!-- 실시간검색어 -->

<style type="text/css">
#realcontent {
	width: 250px;
	margin-top: 30px;
	margin-left: 120px;
	padding: 10px;
	background: white;
	text-align: center;
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

.pl_t{
font-family: 'Noto Sans KR', sans-serif;
font-size: 30px;
margin-bottom: 35px;
font-weight: bold;
}
.eng{font-family: 'Covered By Your Grace', cursive;
letter-spacing: 5px;
}
.place{
width: 800px;
margin: 0 auto;
}
#mig{
margin-right: 10px;
margin-bottom: 10px;
}
#mig:hover {
	box-shadow: 0px 0 5px 5px #ccc; 
	transition: 0.3s;
}



</style>
<script type="text/javascript">
	$(function() {
		var count = $('#rank-list li').length;
		var height = $('#rank-list li').height();

		function step(index) {
			$('#rank-list ol').delay(2000).animate({
				top : -height * index,
			}, 300, function() {
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
		
		$.ajax('PlaceList.pl?check='+check+'&id='+session,{
			dataType: "json",
			success:function(rdata){
				$.each(rdata, function(index, item){
					var imgpath="placeUpload/"+item.pl_img;
					if((item.session)==item.pl_theme){
						$('.here').append('<a href="PlaceDetail.pl?pl_num='+item.pl_num+'"><img src="'+imgpath+'"alt="'+item.pl_theme+'"id="mig" width="300" height="300"></a>');
					}else if(item.session==null){
						$('.here').append('<a href="PlaceDetail.pl?pl_num='+item.pl_num+'"><img src="'+imgpath+'"id="mig" width="300" height="300"></a>');
					}
					
				});
			}
		});
		});
</script>


</head>
<!--/head-->

<body class="homepage">
<jsp:include page="/inc/top.jsp" />



	<section id="main-map" class="no-margin">
		<div id="mainImg" class="mainImg">
			<div class="mainText">
				<div class="mainBox">
					<h2>
						<span>당신과 함께, 부산</span>
					</h2>
					
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
			</div>
			<!-- 				<img id="bgImg"> -->
		</div>

	</section>


	<section id="maincontent">


		<div class="weather"
			style="margin: 0 auto; width: 600px; height: 300px; text-align: left; transform: scale(0.9);">
			<h2 style="margin-left: 20px; color: black;">오늘</h2>
			<div class="time"></div>
			<h2 style="margin-left: 20px; color: black; margin-top: 120px;">주간</h2>
			<div class="day"></div>
		</div>

	</section>
		
<!-- 		메인 플레이스 -->
<section id="portfolio">
		<div class="place">
		 	<div class="container portfolio-item row isotope ">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<p class="pl_t"><span class="kor">방문자 </span>&nbsp;님을 위한 추천 여행지  </p>
			<div id="here" class="row here isotope-item">
			
			</div>			
					</c:when>
					<c:otherwise>
						<p class="pl_t"><span class="eng">${sessionScope.id }</span> &nbsp;님을 위한 추천 여행지  </p>  
			<div id="here" class="row here">
<!-- 			<img id="mig" width="300" height="300"> -->
			</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
</section>


    <section id="partner">
        <div class="container">
            <div class="center">
                <h2>다른 사이트 넣기123</h2>
                <p class="lead"></p>
            </div>

            <div class="partners">
                <ul>
                    <li>
                        <a href="http://www.busan.go.kr/open/index.jsp" target="_blank"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="images/partners/부산.gif"></a>
                    </li>
                    <li>
                        <a href="http://www.bfo.or.kr/main/index.asp" target="_blank"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="images/partners/관광.jpg"></a>
                    </li>
                    <li>
                        <a href="https://bto.or.kr/kor/Main.do" target="_blank"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="images/partners/공사.jpg"></a>
                    </li>      
                    <li>
                        <a href="http://busan.grandculture.net/?local=busan" target="_blank"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="images/partners/역사.jpg"></a>
                    </li>
                     <li>
                        <a href="https://korean.visitkorea.or.kr/main/main.do" target="_blank"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="images/partners/구석.jpg"></a>
                    </li>
                </ul>
            </div>
        </div>
        <!--/.container-->
    </section>
    <!--/#partner-->


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

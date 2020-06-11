<%@page import="member.vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// String id = (String)session.getAttribute("id");
MemberBean memberInfo = (MemberBean)request.getAttribute("memberInfo");
%>
<html lang="en">
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
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css">

#infoContainer {
	width: 350px;
}

#info {
    margin-top: 25px;
	padding-left: 20px;
    padding-top: 10px;
	margin-top: 50px;
    border: #adc1e6;
    border-style: inset;
    width: 350px;
    height: 400px;
}

#infoH{
	margin-top: 10px;
    font-size: 20px;
    font-family: initial;
    font-weight: bold;
    border-bottom-style: outset;
    width: 300px;
    padding-bottom: 4px;
}

#infocontent1 {
	font-weight: 700;
}

#infocontent {
    display: inline-block;
    float: right;
    width: 240px;
    color: green;
 
}
</style>
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	
    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>마이페이지</h1>
    </div>

    <section style="width: 1400px; height: 700px; margin: auto;">
		<div class="container" id="icon" style="width: 900px; margin: auto;">
			<div id="infoContainer">
				<span>
				안녕하세요! <%= memberInfo.getId() %> 님<br>
				WithTrip 을 이용해 주셔서 감사합니다!
				</span><br>
                <div id="info">
                	<div id="infoH">회원정보</div><br>
                	<span id="infocontent1">아이디</span><span id="infocontent"><%=memberInfo.getId() %></span><br>
					<span id="infocontent1">이름</span><span id="infocontent"><%=memberInfo.getName() %></span><br>
					<span id="infocontent1">나이</span><span id="infocontent"><%=memberInfo.getAge() %></span><br>
					<span id="infocontent1">성별</span><span id="infocontent"><%=memberInfo.getGender() %></span><br>
					<span id="infocontent1">이메일</span><span id="infocontent"><%=memberInfo.getEmail() %></span><br>
					<span id="infocontent1">폰번호</span><span id="infocontent"><%=memberInfo.getPhone() %></span><br>
					<span id="infocontent1">가입날짜</span><span id="infocontent"><%=memberInfo.getDate() %></span><br>
					<span id="infocontent1">포인트</span><span id="infocontent"><%=memberInfo.getPoint() %></span><br>
					<span id="infocontent1">선택타입</span><span id="infocontent"><%=memberInfo.getType() %></span><br>
                </div>
            </div>
		</div>
    </section>


    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
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

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>

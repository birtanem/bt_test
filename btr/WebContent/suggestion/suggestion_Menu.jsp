<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | About us</title>

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
#label1 {
	width: 126px;
}
#label2 {
	width: 126px; 
	margin-left: 250px;
}

#label3 {
	width: 126px; 
	margin-left: 250px;
}
</style>
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	
    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>고객센터</h1>
    </div>

    <section style="width: 1400px; height: 531px; margin: auto;">
		<div id="icon" style="width: 900px; margin: auto;">
	
				<label id="label1">
					<a href="Suggestion_WriteForm.su">
						<span>
							<img alt="a" src="${pageContext.request.contextPath}/images/suggestion/a.png" 
										 onmouseover="this.src='${pageContext.request.contextPath}/images/suggestion/a1.png'" 
										 onmouseout="this.src='${pageContext.request.contextPath}/images/suggestion/a.png'" 
										 style="">
						</span>
							<h3 style="text-align: center; font-size: 22px; font-weight: bold;">건의하기</h3>
					</a>	
				</label>
				<label id="label2">
					<a href="Suggestion_List.su">
						<span>
							<img alt="b" src="${pageContext.request.contextPath}/images/suggestion/b.png" 
										 onmouseover="this.src='${pageContext.request.contextPath}/images/suggestion/b1.png'" 
										 onmouseout="this.src='${pageContext.request.contextPath}/images/suggestion/b.png'" 
										 style="display: block;">
						</span>
							<h3 style="text-align: center; font-size: 22px; font-weight: bold;">내 건의사항</h3>
					</a>	
				</label>
				<label id="label3">
					<a href="Suggestion_Info.su" style="display: block;"> 
						<span>
							<img alt="c" src="${pageContext.request.contextPath}/images/suggestion/c.png" 
										 onmouseover="this.src='${pageContext.request.contextPath}/images/suggestion/c1.png'" 
										 onmouseout="this.src='${pageContext.request.contextPath}/images/suggestion/c.png'" 
										 >
							<h3 style="text-align: center; font-size: 20px; font-weight: bold;">About US</h3>
						</span>
					</a>	
				</label>
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

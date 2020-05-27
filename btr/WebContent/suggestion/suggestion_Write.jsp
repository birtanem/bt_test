<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String id = (String)session.getAttribute("id");
// String id = "admin";
// String email = "lkj0511kr@naver.com";       //테스트용 임시 !!!!!!!수정필요

String id = null;
String email = null;
if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
	email = (String)request.getAttribute("email");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
function checkValue(){
	var form = document.contentinfo;
	
	if(!form.subject.value){
		alert("제목을 입력하세요.");
		return false;
	}
	
	if(!form.content.value){
		alert("내용을 입력하세요.");
		return false;
	}
}
</script>

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

</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	
    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Contact</h1>
    </div>


    <section id="partner">
        <div class="container">
            <div class="center fadeInDown">
            
				<h3 style="text-align: center;"><건의사항></h3>
					<article style="width: 610px; position: relative; float: right; margin-right: 255px;">
						<form action="Suggestion_WritePro.su" method="post" name="contentinfo" style="margin-top:20px;" onsubmit="return checkValue()">
							<input type="hidden" value="<%= id%>" name="id">
							<input type="hidden" value="<%= email%>" name="email">
							<table border="1" style="width: 610px; position: relative;">
<%-- 								<tr><td>아이디</td><td><input type="text" name="id" value="<%=id%>" readonly></td> --%>
<%-- 								<td>이메일</td><td><input type="text" name="email" value="<%=email%>" readonly></td></tr> --%>
								<tr><td>아이디</td><td><%=id%></td>
								<td>이메일</td><td><%=email%></td></tr>
								<tr><td>제목</td><td colspan="3"><input type="text" name="subject" id="subject" style="width: 540px; margin: 1px;"></td></tr>
								<tr><td colspan="4" style="text-align: center;">건의 내용</td></tr>
								<tr><td colspan="4" style="height: 300px"><textarea name="content" id="content" rows="10" cols="20" style="margin: 5px; width: 575px; height: 270px;"></textarea></td></tr>
							</table>
							<div style="width: 600px; margin: 0px; margin-top: 5px;">
								<input type="button" value="내 건의사항" style="float: left; background-color: gray; color: white;" onclick="location.href='Suggestion_List.su'">
								<input type="reset" value="취소" style="float: right; background-color: gray; color: white;">
								<input type="submit" value="건의하기" style="float: right; margin-right: 5px; background-color: gray; color: white;">
							</div>
						</form>
					</article>

            </div>
        </div>
        <!--/.container-->
    </section>
    
    <!--/#partner-->
    
    
<!--     <section id="partner"> -->
<!--         <div class="container"> -->
<!--             <div class="center fadeInDown"> -->
<!--                 <h2>Our Partners</h2> -->
<!--                 <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p> -->
<!--             </div> -->

<!--             <div class="partners"> -->
<!--                 <ul> -->
<!--                     <li> -->
<!--                         <a href="#"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="images/partners/brand-1.png"></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="images/partners/brand-2.png"></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="images/partners/brand-3.png"></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" src="images/partners/brand-4.png"></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#"><img class="img-responsive fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="images/partners/brand-5.png"></a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
<!--         /.container -->
<!--     </section> -->
<!--     /#partner -->

    <section id="bottom">
        <div class="container fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-2">
                    <a href="#" class="footer-logo">
                        <img src="images/logo-black.png" alt="logo">
                    </a>
                </div>
                <div class="col-md-10">
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


            </div>
        </div>
    </section>
    <!--/#bottom-->

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

<%@page import="suggestion.vo.SuggestionBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SuggestionBean article = (SuggestionBean)request.getAttribute("article");
int su_num  = Integer.parseInt(request.getParameter("su_num"));
String id = (String)request.getAttribute("id");
%>
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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	<!--/header-->


    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>내 건의사항</h1>
    </div>


    <section id="partner">
        <div class="container">
            <div class="center fadeInDown">
            <%
            if(article.getCheck().equals("답변완료")){
            	%>
            	            <article style="position: relative; float: right; margin-right: 255px; margin-right: 110px;">
								<table border="1" bordercolor="black"
								style="position: relative; 
									   float: right; 
									   margin-left: 10px; 
									   width: 255px; 
									   mix-blend-mode: difference;
									   font-size: medium;
									   color: black;
									   font-family: fantasy;
									   background-color: darkgrey;
									   border: double;">
									<tr><td colspan="2">관리자 답변</td></tr>
									<tr><td>작성날짜</td><td><%=article.getDate_r()%></td></tr>
									<tr><td colspan="2" style="height: 300px; background-color: azure;"><%=article.getContent_r()%></td></tr>
								</table>
								<table border="1" style="width: 610px; position: relative;">
									<tr>
									<td style="width: 80px;">작성 아이디</td>
									<td style="width: 140px;"><%=article.getId()%></td>
									<td style="width: 90px;">답변 받을 이메일</td>
									<td><%=article.getEmail()%></td>
									</tr>
									<tr>
										<td style="width: 40px;">제목</td>
										<td colspan="2" style="width: 540px; margin: 1px;"><%=article.getSubject() %></td>
										<%
										if(article.getCheck().equals("답변완료")){
											%>
											<td style="color: blue; width: 60px; font-weight: bold; text-shadow: 0.5px 0.5px 0px white;"><%=article.getCheck()%></td>
											<%
										} else {
											%>
											<td style="color: red; width: 60px; font-weight: bold;"><%=article.getCheck()%></td>
											<%
										}
										%>
									</tr>
									<tr><td colspan="4" style="text-align: center;">건의 내용</td></tr>
									<tr><td colspan="4" style="margin: 5px; width: 575px; height: 300px;"><%=article.getContent()%></td></tr>
								</table>
            	<%
            } else {
            	%>
            			<article style="width: 610px; position: relative; float: right; margin-right: 255px;">
							<table border="1" style="width: 610px; position: relative;">
								<tr>
								<td style="width: 80px;">작성 아이디</td>
								<td style="width: 140px;"><%=article.getId()%></td>
								<td style="width: 90px;">답변 받을 이메일</td>
								<td><%=article.getEmail()%></td>
								</tr>
								<tr>
								<td style="width: 40px;">제목</td>
								<td colspan="2" style="width: 540px; margin: 1px;"><%=article.getSubject() %></td>
								<%
								if(article.getCheck().equals("답변완료")){
									%>
									<td style="color: blue; width: 60px; font-weight: bold; text-shadow: 0.5px 0.5px 0px white;"><%=article.getCheck()%></td>
									<%
								} else {
									%>
									<td style="color: red; width: 60px; font-weight: bold;"><%=article.getCheck()%></td>
									<%
								}
								%>
								</tr>
								<tr><td colspan="4" style="text-align: center;">건의 내용</td></tr>
								<tr><td colspan="4" style="margin: 5px; width: 575px; height: 300px;"><%=article.getContent()%></td></tr>
							</table>
            	<%
            }
            %>
          					    <div style="width: 610px; margin: 0px; margin-top: 5px;">
								<input type="button" value="목록" style="float: left; background-color: gray; color: white;" onclick="location.href='Suggestion_List.su'">
								<input type="button" value="건의하러가기" style="float: right; background-color: gray; color: white;" onclick="location.href='Suggestion_WriteForm.su'">
							</div>
					</article>
            </div>
        </div>
        <!--/.container-->
    </section>

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

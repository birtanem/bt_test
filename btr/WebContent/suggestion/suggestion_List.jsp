<%@page import="java.util.ArrayList"%>
<%@page import="suggestion.vo.SuggestionBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String id = (String)session.getAttribute("id");
ArrayList<SuggestionBean> articleList=(ArrayList<SuggestionBean>)request.getAttribute("articleList");
%>
<!DOCTYPE html>
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
            
				<h3 style="text-align: center;"><건의사항></h3>
					<div style="color: gray; text-align: right; font-size: 8px; width: 885px;">※ 답변 내용은 이메일을 통해 확인해주세요.</div>
					<article style="width: 610px; position: relative; float: right; margin-right: 255px;">
							<table border="1" style="width: 610px; position: relative;">
								<tr><th style="width: 300px;">제목</th><th style="width: 180px;">작성일</th><th style="width: 150px;">답변여부</th></tr>
								<%
								for(int i=0;i<articleList.size();i++){
								%>
								<tr>
								<td>
								<a href="Suggestion_Detail.su?su_num=<%=articleList.get(i).getNum()%>">
								<%=articleList.get(i).getSubject() %>
								</a>
								</td>
								<td><%=articleList.get(i).getDate() %></td>
								<%
								if(articleList.get(i).getCheck().equals("답변완료")){
									%>
									<td id="td1" style="color: blue; font-weight: bold; text-shadow: 0.5px 0.5px 0px white;"><%=articleList.get(i).getCheck() %></td>
									<%
									
								} else {
									%>
									<td id="td1" style="color: red; font-weight: bold; "><%=articleList.get(i).getCheck() %></td>
									<%
								}
								%>

								</tr>
								<%
								}
								%>
							</table>
							<div style="width: 600px; margin: 0px; margin-top: 5px;">
								<input type="button" value="건의하러가기" style="float: right; background-color: gray; color: white;" onclick="location.href='Suggestion_WriteForm.su'">
							</div>
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

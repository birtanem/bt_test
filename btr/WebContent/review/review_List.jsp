
<%@page import="review.vo.ReviewPageInfo"%>
<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ArrayList<ReviewBean> article = (ArrayList<ReviewBean>)request.getAttribute("articleList");
ReviewPageInfo pageInfo = (ReviewPageInfo)request.getAttribute("pageinfo");

int listCount = pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();

%>
    
<!DOCTYPE html>
<html>
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
    <link href="css/review.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
    
	    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="top-number">
                            <p><i class="fa fa-phone-square"></i> +0123 456 70 90</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="services.html">Services</a></li>
                        <li><a href="Review_List.re">Review</a></li>
                        <li><a href="productList.bo">Portfolio</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="blog-item.html">Blog Single</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="404.html">404</a></li>
                            </ul>
                        </li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="event.ev">Contact</a></li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->

    </header>

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Review</h1>
    </div>
    
    <section id="blog">

        <div class="blog container">
            <div class="row">
                <div class="col-md-8">

                	<table>
					<%
					
					for(int i = 0; i < article.size();i++){ %>

							<ul style="width: 100%; height: 150px;" onclick="location.href='Review_Content.re?&num=<%=article.get(i).getR_num()%>&page=<%=nowPage%>'">
								<li style="list-style: none;">
									<div style="float: left;">
										<img src="review/emg1.jpg" width="150px" height="120px"><!-- css파일에서 라운드 처리  border-radius -->
									</div>
									<div style=" float:left; padding-left: 15px; width: 560px; height: 120px; background-color: gray;">
										<div style="width: 100%; height: 35px; font-size: 20px;padding-top: 8px;">
											[카테고리]&nbsp;<%= article.get(i).getR_subject() %>(댓글)
										</div>
										<div style="width: 100%; height: 25px; font-size: 12px">
											작성자&nbsp;<%= article.get(i).getR_date() %>&nbsp;&nbsp;조회수&nbsp;<%= article.get(i).getR_readcount() %>
										</div>
										<p style="font-size: 20px;">
										<%= article.get(i).getR_content() %>
										</p>
									</div>
								</li>
							</ul>

					<%}
					
				%>
				</table>
                    
                </div>
                <!--/.col-md-8-->

                <aside class="col-md-4">
                    <div class="widget search">
                        <form role="form">
                            <input type="text" class="form-control search_box" autocomplete="off" placeholder="Search Here">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <!--/.search-->
 
                    <!--글 쓰기-->
                    <div>
                    
                    <input type="button" value="리뷰 글 쓰기" onclick="location.href='Review_WriteForm.re'">
                    
                    </div>
                    <!--글 쓰기-->
                    
					<!--카테고리-->
                    <div class="widget archieve">
                        <h3>Kategories</h3>
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="blog_archieve">
                                    <li><a href="#">December 2013 <span class="pull-right">(97)</span></a></li>
                                    <li><a href="#">November 2013 <span class="pull-right">(32)</span></a></li>
                                    <li><a href="#">October 2013 <span class="pull-right">(19)</span></a></li>
                                    <li><a href="#">September 2013 <span class="pull-right">(08)</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
					<!--카테고리-->

                    
                </aside>
            </div>
            
            <!--/.row   페이징 처리-->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination pagination-lg">
                    <% if(nowPage <= 1){%>
                    	<li><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                    <%}else {%>
                        <li><a href="Review_List.re?page=<%=nowPage-1%>"><i class="fa fa-long-arrow-left"></i></a></li>
                    
                    <%}
                    %>
						 <% for(int a = startPage; a <= endPage; a++){
						 	if(a == nowPage){%>
						 		<li class="active"><a href="Review_List.re?page=<%= a %>"><%= a %></a></li>
						 	<%}else {%>
						 		<li><a href="Review_List.re?page=<%=a%>"><%= a %></a></li><%
						 	}
						 }
							 %>                      
                        <% if(nowPage >= maxPage){%>
                        	<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                        <%}else{%>
                        <li><a href="Review_List.re?page=<%=nowPage+1%>"><i class="fa fa-long-arrow-right"></i></a></li>
                        <%}
                        	%>
                    
                    </ul>
                    <!--/.pagination-->
                </div>
            </div>
            <!--/.row   페이징 처리-->
            
        </div>
    </section>
    <!--/#blog-->

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

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.isotope.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>
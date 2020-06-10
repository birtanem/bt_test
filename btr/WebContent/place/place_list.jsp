<%@page import="place.vo.PlacePageInfo"%>
<%@page import="place.vo.PlaceBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageInfo" value="${pageInfo }"  /> 
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
    
<jsp:include page="/inc/top.jsp" />

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Place(부산 명소 소개)</h1>
    </div>
    
    <section id="blog">

        <div class="blog container">
            <div class="row">
                <div class="col-md-8">

                	<table>
                		<c:forEach var="article" items="${articleList }" >
                			
							<ul style="width: 100%; height: 150px; " onclick="location.href='PlaceDetail.pl?pl_num=${article.pl_num }&page=${pageInfo.page }'">
								<li style="list-style: none;">
									<div style="float: left;">
										<img src="placeUpload/${article.pl_image }" width="150px" height="120px"><!-- css파일에서 라운드 처리  border-radius -->
									</div>
									<div style=" float:left; padding-left: 15px; width: 560px; height: 120px;">
										<div style="width: 100%; height: 35px; font-size: 20px;padding-top: 8px;">
											${article.pl_theme}&nbsp;${article.pl_name}
										</div>
										<div style="width: 100%; height: 25px; font-size: 14px">
											&nbsp;&nbsp;${article.pl_date }&nbsp;&nbsp;조회수&nbsp;${article.pl_readcount }
										</div>
										<p style="font-size: 20px;">
											
										</p>
									</div>
								</li>
							</ul>

                		</c:forEach>
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
 
                                        
					
                    
                </aside>
            </div>
            
            <!--/.row   페이징 처리-->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination pagination-lg">
                    
                    	<c:choose>
                    	
                    		<c:when test="${pageInfo.page <= 1 }">
                    			<li><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="PlaceList.pl?page=${pageInfo.page - 1 }"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:otherwise>
                    	</c:choose>
                    
                    	<c:forEach var="a" begin="${pageInfo.page }" end="${pageInfo.endPage }" step="1">
                    		
                    		<c:choose>
                    		
                    			<c:when test="${pageInfo.page <= 1 }">
                    				<li class="active"><a href="PlaceList.pl?page=${a }">${a }</a></li>
                    			</c:when>
                    			<c:otherwise>
									<li><a href="PlaceList.pl?page=${a }">${a }</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    	
                    	</c:forEach>
                    		
                    		<c:choose>
                    		
                    			<c:when test="${pageInfo.page >= pageInfo.maxPage }">
                    				<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li><a href="PlaceList.pl?page=${pageInfo.page + 1 }"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:otherwise>
                    		</c:choose>
                    </ul>
                    <!--/.pagination-->
                </div>
            </div>
            <!--/.row   페이징 처리-->
            
        </div>
    </section>
    <!--/#blog-->

    <!--/#bottom-->
<jsp:include page="/inc/bottom.jsp"/>
    <!--/#footer-->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.isotope.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>
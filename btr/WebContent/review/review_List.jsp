
<%@page import="review.vo.ReviewPageInfo"%>
<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageInfo" value="${pageinfo }"  /> 
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
        <h1>Review</h1>
    </div>
    
    <section id="blog">

        <div class="blog container">
            <div class="row">
                <div class="col-md-8">
                	<table>
                		<c:forEach var="article" items="${articleList }" >
                			
							<ul style="width: 100%; height: 150px; " onclick="location.href='Review_Content.re?&r_num=${article.r_num }&page=${pageInfo.page }'">
								<li style="list-style: none;">
									<div style="float: left;">
										<img src="reviewUpload/${article.r_image }" width="150px" height="120px"><!-- css파일에서 라운드 처리  border-radius -->
									</div>
									<div style=" float:left; padding-left: 15px; width: 560px; height: 120px;">
										<div style="width: 100%; height: 35px; font-size: 20px;padding-top: 8px;">
											[${article.r_name }]&nbsp;${article.r_subject }&nbsp;<img src="review/love.png" width="25px" height="25px">&nbsp;${article.r_likecount } (${article.r_cnt })
										</div>
										<div style="min-width: 200px; height: 25px; font-size: 14px">
											${article.r_id }&nbsp;&nbsp;${article.r_date }&nbsp;&nbsp;조회수&nbsp;${article.r_readcount }
										</div>
										<p style="font-size: 20px;">
											${article.r_content }
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
                        <form action="Review_List.re" role="form">
                            <input type="text" name="r_search" class="form-control search_box" autocomplete="off" placeholder="Search Here">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <!--/.search-->
 
                    <!--글 쓰기-->
                    <div>
                    <c:if test="${sessionScope.id != null}">
                    	<input type="button" value="리뷰 글 쓰기" onclick="location.href='Review_WriteForm.re'">
                    </c:if>
                    </div>
                    <!--글 쓰기-->
                    
					<!--카테고리-->
                    <div class="widget archieve">
                        <h3>Categories</h3>
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="blog_archieve">
                                	<li><a href="Review_List.re">전체 글</a></li>
                                    <li><a href="Review_List.re?r_code=1">강서구</a> <span><a href="Review_List.re?r_code=9">사상구</a></span></li>
                                    <li><a href="Review_List.re?r_code=2">금정구</a> <span><a href="Review_List.re?r_code=10">사하구</a></span></li>
                                    <li><a href="Review_List.re?r_code=3">기장군</a> <span><a href="Review_List.re?r_code=11">서구</a></span></li>
                                    <li><a href="Review_List.re?r_code=4">남구</a> <span><a href="Review_List.re?r_code=12">수영구</a></span></li>
                                    <li><a href="Review_List.re?r_code=5">동구</a> <span><a href="Review_List.re?r_code=13">연제구</a></span></li>
                                    <li><a href="Review_List.re?r_code=6">동래구</a> <span><a href="Review_List.re?r_code=14">영도구</a></span></li>
                                    <li><a href="Review_List.re?r_code=7">부산진구</a> <span><a href="Review_List.re?r_code=15">중구</a></span></li>
                                    <li><a href="Review_List.re?r_code=8">북구</a> <span><a href="Review_List.re?r_code=16">해운대구</a></span></li>
                                    <li><a href="Review_List.re?r_code=17">기타지역(부산외)</a></li>
                                    
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
                    
                    	<c:choose>
                    	
                    		<c:when test="${pageInfo.page <= 1 }">
                    			<li><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="Review_List.re?page=${pageInfo.page - 1 }"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:otherwise>
                    	</c:choose>
                    
                    	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
                    		
                    		<c:choose>
                    		
                    			<c:when test="${a == pageInfo.page }">
                    				<li class="active"><a>${a }</a></li>
                    			</c:when>
                    			<c:otherwise>
									<li><a href="Review_List.re?page=${a }">${a }</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    	
                    	</c:forEach>
                    		
                    		<c:choose>
                    		
                    			<c:when test="${pageInfo.page >= pageInfo.maxPage }">
                    				<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li><a href="Review_List.re?page=${pageInfo.page + 1 }"><i class="fa fa-long-arrow-right"></i></a></li>
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
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
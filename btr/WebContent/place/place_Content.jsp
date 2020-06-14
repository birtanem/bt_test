<%@page import="place.vo.PlaceBean"%>
<%@page import="place.vo.PlaceCommentBean"%>
<%@page import="place.vo.PCpageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="commentList" value="${commentList }" />
    <c:set var="pageInfo" value="${cpageInfo }"  /> 
<%
ArrayList<PlaceCommentBean> articleList = (ArrayList<PlaceCommentBean>)request.getAttribute("commentList");
PCpageInfo pageInfo = (PCpageInfo)request.getAttribute("cpageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
String plPage = request.getParameter("page");
%>
   
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>WithTrip | Place | Place_Content</title>

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

<script src="js/product_modal.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
	
<script src="js/summernote-ko-KR.js"></script>	
<!-- 썸머노트 필수 스크립트 링크 코드 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">    
    
</head>
<body>
    
<jsp:include page="/inc/top.jsp" />

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Place</h1>
    </div>
    
            <section id="blog">
        
                <div class="blog container">
            <div class="row">
                <div class="col-md-8">

                    <div class="blog-item">
                        <a href="#"><img class="img-responsive img-blog" src="placeUpload/${article.pl_image }" width="100%" alt="" /></a>
                        <div class="blog-content">
                            <a href="#" class="blog_cat">테 마(주제) : ${article.pl_theme} / 주 소 : ${article.pl_address }</a>
                            <h2>장소 명 : ${article.pl_name }</h2>
                            <div class="post-meta">
                                <p>주 소 : ${article.pl_address }</p>
                                <p><i class="fa fa-clock-o"></i> ${article.pl_date }</p>
                                <p><i class="fa fa-comment"></i> ${article.pl_readcount }</p>
                                <p>
                                    share:
                                    <a href="#" class="fa fa-facebook"></a>
                                    <a href="#" class="fa fa-twitter"></a>
                                    <a href="#" class="fa fa-linkedin"></a>
                                    <a href="#" class="fa fa-pinterest"></a>
                                </p>
                            </div>
                            ${article.pl_content }
                            
                            <div class="inner-meta">
                            <c:if test="${sessionScope.id == 'admin'}" >
                                <ul class="tags">
                                    <li><a href="PlaceUpdateForm.pl?pl_num=${article.pl_num }&page=<%=plPage%>">수정</a></li>
                                    <li><a href="PlaceDeletePro.pl?pl_num=${article.pl_num }&page=<%=plPage%>">삭제</a></li>
                                </ul>
                            </c:if>

                                <div class="social-btns">
                                    <a href="#"> <i class="fa fa-heart"></i> Like</a>
                                    <a href="#" class="tweet-bg"> <i class="fa fa-twitter"></i> tweet</a>
                                    <a href="#" class="facebook-bg"> <i class="fa fa-facebook"></i> facebook</a>
                                </div>
                            </div>
                            
                            <div class="comments">
                                <h2>Comments</h2>
                                <c:if test="${id != null}" >
                                <div class="single-comment">
                                    <div class="comment-img">
                                        <img src="images/octocat.png" alt="author">
                                    </div>
                                    <div class="comment-content comment-form">
                                        <form action="PC_WritePro.pl?pl_num=${article.pl_num }" method="post">
                                            <input type="hidden" name="id" value="${id }">
                    						<input type="hidden" name="page" value="<%=plPage%>">
                                            <textarea name="pc_content"></textarea>
                                            <input type="submit" value="Comment">
                                        </form>
                                    </div>
                                </div>
                                </c:if>
                                      
                  
                                      
                                <c:forEach var="commentList" items="${commentList }">                                 
                                <div class="single-comment">
                                    <div class="comment-img">
                                        <img src="images/ananimous.png" alt="author">
                                    </div>
                                    <div class="comment-content">
                                        <h5>${commentList.member_id }</h5>
                                        <p>${commentList.pc_content }</p>
                                    </div>
                                    <div class="comment-count">
                                        <a href="#"><i class="fa fa-reply"></i> ${commentList.pc_date }</a>
                                        <a href="#"><i class="fa fa-heart"></i> ${commentList.pc_rank }</a>
                                    </div>
                                </div>
                               
                               
                               </c:forEach>
                                                     
						<!--/.row   페이징 처리-->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination pagination-lg">
                    
                    	<c:choose>
                    	
                    		<c:when test="${pageInfo.page <= 1 }">
                    			<li><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="PlaceDetail.pl?pl_num=${article.pl_num }&page=<%=plPage%>&cpage=${pageInfo.page - 1 }"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:otherwise>
                    	</c:choose>
                    
                    	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
                    	<c:choose>
                   			<c:when test="${a == pageInfo.page }">
                    				<li class="active"><a>${a }</a></li>
                    			</c:when>
                    			<c:otherwise>
									<li><a href="PlaceDetail.pl?pl_num=${article.pl_num }&page=<%=plPage%>&cpage=${a }">${a }</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    	
                    	</c:forEach>
                    		
                    		<c:choose>
                    		
                    			<c:when test="${pageInfo.page >= pageInfo.maxPage }">
                    				<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li><a href="PlaceDetail.pl?pl_num=${article.pl_num }&page=<%=plPage%>&cpage=${pageInfo.page + 1 }"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:otherwise>
                    		</c:choose>
                    </ul>
                    <!--/.pagination-->
                </div>
            </div>
            <!--/.row   페이징 처리-->
    
                                
                            </div>
                        </div>
                    </div>
                    <!--/.blog-item-->


                </div>
                <!--/.col-md-8-->
       <aside class="col-md-4">
                     <jsp:include page="/inc/includePlace.jsp" />   

                </aside>
            </div>
            <!--/.row-->
        </div>
    </section>
    <!--/#blog-->
    
    <!--/#bottom-->
<jsp:include page="/inc/bottom.jsp" />
    
    <!--/#footer-->

  
</body>
</html>
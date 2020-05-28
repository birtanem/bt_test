<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="nowPage" value="${page }" />
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
    
    <script src="../js/jquery-3.5.0.js"></script>
	<script type="text/javascript">
    
		$(document).ready(function(){
			
			$('#btn').click(function(){
				
				
				
			});
			
		});
	
    </script>
</head>
<body>
    
<jsp:include page="/inc/top.jsp" />

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Review</h1>
    </div>
    
            <section id="blog">
        
                <div class="blog container">
                    <div class="row" style="padding-left: 100px; padding-right: 100px;">
                                <section id="writeForm">
                    <table>
                        <tr>
                            <td>제 목</td>
                            <td style="width: 90%;">${article.r_subject }</td>
                            <td><a href="Review_ContentLike.re?r_num=${article.r_num }">like</a><a>${pageInfo.commentCount }</a> </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td style="width: 90%; height: 400px;">${article.r_content }</td>
                        </tr>
                    </table>
                    <input type="button" value="댓글" onclick="location.href='Comment_WriteForm.re?r_num=${article.r_num }&page=${nowPage }'">
                    <input type="button" value="수정" onclick="location.href='Review_UpdateForm.re?r_num=${article.r_num }'">
                    <input type="button" value="삭제" onclick="location.href='Review_DeleteForm.re?r_num=${article.r_num }'">
                    <input type="button" value="목록" onclick="location.href='Review_List.re?page=${nowPage }'">
                    <table>

                    <c:forEach var="articleList" items="${articleList }">
                    	<tr onclick="location.href='Comment_ReplyForm.re?&r_num=${article.r_num }&rc_num=${articleList.rc_num}&rc_ref=${articleList.rc_ref }&rc_lev=${articleList.rc_lev }&rc_seq=${articleList.rc_seq }&page=${nowPage }'">
	                    	<td>${articleList.rc_num }</td>
	                    	<td>${articleList.rc_id }</td>
	                    	<td>${articleList.rc_content }</td>
	                    	<td>${articleList.rc_date }</td>
	                    </tr>
                    </c:forEach>
                    </table>
             </section>
                    
          </div>      
                <!--/.col-md-8-->
        </div>
    </section>
    <!--/#blog-->

    <!--/#bottom-->
<jsp:include page="/inc/bottom.jsp" />
    
    <!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
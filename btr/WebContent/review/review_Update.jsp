
<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "article" value="${article }" />
    <c:set var = "nowPage" value="${page }" />
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
                    <div class="row" style="padding-left: 100px; padding-right: 100px;">
                                <section id="writeForm">

			        <form action="Review_UpdatePro.re" method="post">
		            <table>
		                <tr>
		                    <td>제 목</td>
		                    <td><input type="text" value="${article.r_subject }" name="r_subject" style="width: 100%;" /></td>
		                </tr>
		                <tr>
		                    <td>내용</td>
		                    <td><input type="text" value="${article.r_content }" name="r_content" style="width:100%;height:400px;"/></td>
		                	<td><input type="hidden" name="r_image" value="${article.r_image }"></td>
		                	<td><input type="hidden" name="r_id" value="${article.r_id }"></td>
		                	<td><input type="hidden" name="r_code" value="${article.r_code }"></td>
		                	<td><input type="hidden" name="r_num" value="${article.r_num }"></td>
                            
		                </tr>
		            </table>
		                <input type="submit" value="등록">
		                <input type="reset" value="다시쓰기" />
		        </form>

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
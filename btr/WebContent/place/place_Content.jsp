<%@page import="place.vo.PlaceBean"%>
<%@page import="place.vo.PlacePageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="nowPage" value="${page }" />
    <%String id = (String)session.getAttribute("id");
      String nowPage = request.getParameter("page");
      String adminid = "admin";%>
    

    
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
                    <div class="row" style="padding-left: 100px; padding-right: 100px;">
                                <section id="writeForm">
                    <table>
                        <tr>
                            <td>제 목</td>
                            <td style="width: 90%;">${article.pl_name }</td>
                            <td> 주소 </td><td>${article.pl_address }</td>
                        </tr>
                        <tr>
                            <td>사진</td>
                                                     
                            <td colspan='3' style="width: 90%; height: 400px;"><img src="placeUpload/${article.pl_image }" width="400px"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td colspan='3' style="width: 90%; height: 400px;">${article.pl_content }</td>
                        </tr>
                    </table>
                    
                    <form action="PC_WritePro.pl?r_num=${article.pl_num }" method="post">
                    	<input type="hidden" name="id" value="test">
                    	<textarea rows="5" cols="100" name="pc_content"></textarea>
                    <input type="submit" value="댓글">
                    </form>
                    
                   
					<c:if test="${id != adminid}" >
                    <input type="button" value="수정" onclick="location.href='PlaceUpdateForm.pl?pl_num=${article.pl_num }&page=<%=nowPage%>'">
                    <input type="button" value="삭제" onclick="location.href='PlaceDeletePro.pl?pl_num=${article.pl_num }&page=<%=nowPage%>'">
					</c:if>
                    				<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                  	
                    
                    
                    <input type="button" value="목록" onclick="location.href='PlaceList.pl?page=<%=nowPage%>'">
                    
                    <%-- <table>  //  댓글부분 추후 수정 요망

                    <c:forEach var="articleList" items="${articleList }">
                    	<tr>
	                    	<td>${articleList.rc_id }</td>
	                    	<td>${articleList.rc_date }</td>
	                    	<td>${articleList.rc_content }</td>
	                    </tr>
                    </c:forEach>
                    </table> --%>
             
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
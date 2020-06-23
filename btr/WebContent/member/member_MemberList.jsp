<%@page import="place.vo.PlacePageInfo"%>
<%@page import="place.vo.PlaceBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageInfo" value="${pageinfo }"  /> 
<%
out.println(request.getParameter("type"));

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>회원 목록</title>

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

    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
<style type="text/css">


#table1 {
	color: black;
}

#spanCount1{
	font-size: 23px;
}

#spanCount2{
	font-size: 23px;
    font-weight: bold;
    color: black;
}

#btnBack{
	float: right;
    margin-right: 5px;
    margin-top: 40px;
    margin-bottom: 10px;
}

#btnBack1{
    margin-right: 5px;
    margin-top: 10px;
}

#span1{
	display: inline-block;
    width: 100px;
}

#btndiv1 {
    margin-top: 10px;
	    
}

#btndiv2 {
    margin-top: 10px;
    
	
}
</style>
<script type="text/javascript">

function ageA() {
	var type = "age ASC";
	location.href = "./MemberList.me?type="+type;
}

function ageD() {
	var type = "age DESC";
	location.href = "./MemberList.me?type="+type;
}

function idA() {
	var type = "id ASC";
	location.href = "./MemberList.me?type="+type;
}

function idD() {
	var type = "id DESC";
	location.href = "./MemberList.me?type="+type;
}

function pointA() {
	var type = "point ASC";
	location.href = "./MemberList.me?type="+type;
}

function pointD() {
	var type = "point DESC";
	location.href = "./MemberList.me?type="+type;
}

</script>
</head>
<body>    
<jsp:include page="/inc/top.jsp" />

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>회원 목록(수정중임)</h1>
        
    </div>
    
    <section id="blog">

        <div class="blog container">
            <div class="row">
                <div class="col-md-8">
                                
                	<div class="blog-item">
                        <div class="blog-content">
	                    	<div>
	                    		<span id="spanCount1">총 회원 수 </span>
	                    		<span id="spanCount2"> ${pageInfo.listCount }</span>
	                    		<div id="btndiv1">
<!-- 	                    		수정중################################################################### -->
	                    			<form action=""> 
										<input type="text" name="searchId" id="searchId" placeholder="회원검색">
										<input type="submit" id="btnBack1" value="검색" onclick="#">
	                    			</form>
<!-- 	                    		수정중################################################################### -->
	                    		</div>
	                    		<div id="btndiv2">
		                    		<input type="button" id="btnBack1" value="아이디 정렬" onclick="idA()">
		                    		<input type="button" id="btnBack1" value="아이디 역정렬" onclick="idD()">
		                    		<input type="button" id="btnBack1" value="나이 정렬" onclick="ageA()">
		                    		<input type="button" id="btnBack1" value="나이 역정렬" onclick="ageD()">
		                    		<input type="button" id="btnBack1" value="포인트 정렬" onclick="pointA()">
		                    		<input type="button" id="btnBack1" value="포인트 역정렬" onclick="pointD()">
	                    		</div>
	                    		<input type="button" id="btnBack" value="돌아가기" onclick="location.href='./adminPage.ad'">
	                    	</div>        		   
                        </div>
                    </div>
                    
                <c:forEach var="article" items="${articleList }" >
					<div class="blog-item">
                        <div class="blog-content">
                        		<span id="span1">아이디  </span><span>${article.id }</span><br>
                        		<span id="span1">이름  </span><span>${article.name }</span><br>
                        		<span id="span1">나이  </span><span>${article.age }</span><br>
                        		<span id="span1">성별  </span><span>${article.gender }</span><br>
                        		<span id="span1">이메일  </span><span>${article.email }</span><br>
                        		<span id="span1">휴대폰  </span><span>${article.phone }</span><br>
                        		<span id="span1">가입날짜  </span><span>${article.date }</span><br>
                        		<span id="span1">포인트  </span><span>${article.point }</span><br>
                        		<span id="span1">타입  </span><span>${article.type }</span><br>
                        </div>
                    </div>
                		</c:forEach>
				
                    
                </div>
                <!--/.col-md-8-->


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
                    			<li><a href="MemberList.me?page=${pageInfo.page - 1 }"><i class="fa fa-long-arrow-left"></i></a></li>
                    		</c:otherwise>
                    	</c:choose>
                    
                    	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
                    		
                    		<c:choose>
                    		
                    			<c:when test="${a == pageInfo.page }">
                    				<li class="active"><a>${a }</a></li>
                    			</c:when>
                    			<c:otherwise>
									<li><a href="MemberList.me?page=${a }">${a }</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    	
                    	</c:forEach>
                    		
                    		<c:choose>
                    		
                    			<c:when test="${pageInfo.page >= pageInfo.maxPage }">
                    				<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li><a href="MemberList.me?page=${pageInfo.page + 1 }"><i class="fa fa-long-arrow-right"></i></a></li>
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
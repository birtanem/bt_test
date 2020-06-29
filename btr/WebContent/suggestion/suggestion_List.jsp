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
<style type="text/css">
#table1 {
	color: black;
}

/* 테이블 td조정 */
#td0 {
	width: 45px;
}

#td_title {
	color: blue;
}

#td1 {
	width: 50px;
}

#td2 {
	width: 110px;
	color: red;
}

#td3 {
	width: 64px;
}

#td4 {
	width: 52px;
	color: red;
}

#spanCount1{
	font-size: 23px;
}

#spanCount2{
	font-size: 23px;
    font-weight: bold;
    color: black;
}

#btn1 {
 float: left;
 background-color: gray; 
 color: white;
}

#span1 {
	color: gray;
    text-align: right;
    font-size: 8px;
    margin-left: 367px;
}
</style>
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	<!--/header-->
	
    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>내 건의사항</h1>
    </div>


    <section id="partner">
	    <div class="center fadeInDown">		
		    <div class="blog container">
			    <div class="col-md-8">
					<div class="blog-item">
					    <div class="blog-content">
								<table border="1" id="table1">
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
							<span id="span1">※ 답변 내용은 이메일을 통해 확인해주세요.</span>
							<input type="button" value="건의하러가기" id="btn1" onclick="location.href='Suggestion_WriteForm.su'">
					    </div>
				    </div>
			    </div>
			</div>
	    </div>
    </section>
    
    <!--/#partner-->

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

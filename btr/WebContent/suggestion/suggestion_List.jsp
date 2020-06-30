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
<script type="text/javascript">

// $(document).ready(function(){
// 	$('.memInfo').html("");
// });

</script>
<style type="text/css">
#table1 {
	color: black;
	border-style: solid;
}

/* 테이블 td조정 */
#td0 {
	width: 56px;
}

#td_title {
	color: blue;
	width: 440px;
}

#td1 {
	width: 50px;
}

#td2 {
	width: 85px;
	color: red;
	text-align: end;
}

#td3 {
	width: 128px;
}

#td4 {
	width: 88px;
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
 float: right;
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
    <section id="blog">
        <div class="blog container">
            <div class="row">
                <div class="col-md-8">
                
                     <div class="blog-item">
                        <div class="blog-content">
	                    	<div>
	                    		<span id="spanCount1">나의 건의사항 </span>
	                    		<input type="button" value="건의하러가기" id="btn1" onclick="location.href='Suggestion_WriteForm.su'">
	                    	</div>        		   
                        </div>
                    </div>
    				<%
					for(int i=0;i<articleList.size();i++){
					%>
					<div class="blog-item">
                        <div class="blog-content">
                            <a href="Suggestion_Detail.su?su_num=<%=articleList.get(i).getNum()%>">
                            	<table id="table1">
	                            	<tr>
	                            		<td id="td0">제목 : </td>
	                            		<td id="td_title"><%=articleList.get(i).getSubject() %></td>
	                            		<td id="td2">작성일 </td>
	                            		<td id="td3"> <%=articleList.get(i).getDate() %></td>
	                            		<td id="td4"><%=articleList.get(i).getCheck() %></td>
	                            	</tr>
                            	</table>
                            </a>
                        </div>
                    </div>
	         		<%
					}
					%>
                </div>
                <!--/.col-md-8-->

            </div>  
        </div>
    </section>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

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

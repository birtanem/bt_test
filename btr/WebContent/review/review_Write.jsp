<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                
			        <form action="Review_WritePro.re" method="post" enctype="multipart/form-data">
		               <div style="width: 400px; height: 450px; float: left;">
		               
		               	<img src="" width="400px" height="450px">
		               
		               <input type="file" name="r_image">
		               
		               </div>	   
						
			
						<table style="width: 500px; float: right; ">
					          <tr><td>작성자</td><td colspan="2"><input type="text" name="r_id" value="admin"></td></tr>
					          <tr><td style="float: left;">지역선택 </td><td>
		            		<select name="r_code">
		            			<option value="0">지역 선택하세요</option>
		            			<option value="1">강서구</option>
		            			<option value="2">금정구</option>
		            			<option value="3">기장군</option>
		            			<option value="4">남구</option>
		            			<option value="5">동구</option>
		            			<option value="6">동래구</option>
		            			<option value="7">부산진구</option>
		            			<option value="8">북구</option>
		            			<option value="9">사상구</option>
		            			<option value="10">사하구</option>
		            			<option value="11">서구</option>
		            			<option value="12">수영구</option>
		            			<option value="13">연제구</option>
		            			<option value="14">영도구</option>
		            			<option value="15">중구</option>
		            			<option value="16">해운대구</option>
		            			<option value="17">기타지역(부산외)</option>
		                 	</select> 
				        		 </td></tr>
					          <tr><td>제목 </td><td colspan="2"><input type="text" name="r_subject" style="width: 100%;"/></td></tr>
					          <tr><td>내용 </td><td colspan="2"><textarea name="r_contnet" style="width: 100%; height: 300px; resize: none;"></textarea></td></tr>
		          		</table>
		               
						<div style="float: right;">
		                <input type="submit" value="등록">
		                <input type="reset" value="다시쓰기" />
		            </div>   
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
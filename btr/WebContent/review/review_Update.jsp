
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
    <script type="text/javascript">
    
    function readURL(input) {
		
    	if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e){
				$('#reader').attr('src',e.target.result);
			}
			  reader.readAsDataURL(input.files[0]);
		}
    	
	}
    
    </script>
</head>
<body>
    
 <jsp:include page="/inc/top.jsp" />

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>Review</h1>
    </div>
        <c:if test="${sessionScope.id == null}">
    		<c:redirect url="MemberLoginForm.me" />
    	</c:if>
            <section id="blog">
        
                <div class="blog container">
                    <div class="row" style="padding-left: 100px; padding-right: 100px;">
                                <section id="writeForm">

			        <form action="Review_UpdatePro.re" method="post">
			        
			        <div style="width: 400px; height: 450px; float: left;">
		               
		               	<img id="reader" src="reviewUpload/${article.r_image }" width="400px" height="450px">
		               
		               <input type="file" name="r_image" src="" onchange="readURL(this);">
		               
		               </div>	   
						
			
						<table style="width: 500px; float: right; ">
					          <tr><td>작성자</td><td colspan="2"><input type="text" name="r_id" value="${article.r_id }" readonly></td></tr>
					          <tr><td style="float: left;">지역선택 </td><td>
		            		<select name="r_code">
		            			<option value="0">지역 선택하세요</option>
		            			<option value="1" <c:if test="${article.r_code ==1 }">selected</c:if>>강서구</option>
		            			<option value="2" <c:if test="${article.r_code ==2 }">selected</c:if>>금정구</option>
		            			<option value="3" <c:if test="${article.r_code ==3 }">selected</c:if>>기장군</option>
		            			<option value="4" <c:if test="${article.r_code ==4 }">selected</c:if>>남구</option>
		            			<option value="5" <c:if test="${article.r_code ==5 }">selected</c:if>>동구</option>
		            			<option value="6" <c:if test="${article.r_code ==6 }">selected</c:if>>동래구</option>
		            			<option value="7" <c:if test="${article.r_code ==7 }">selected</c:if>>부산진구</option>
		            			<option value="8" <c:if test="${article.r_code ==8 }">selected</c:if>>북구</option>
		            			<option value="9" <c:if test="${article.r_code ==9 }">selected</c:if>>사상구</option>
		            			<option value="10" <c:if test="${article.r_code ==10 }">selected</c:if>>사하구</option>
		            			<option value="11" <c:if test="${article.r_code ==11 }">selected</c:if>>서구</option>
		            			<option value="12" <c:if test="${article.r_code ==12 }">selected</c:if>>수영구</option>
		            			<option value="13" <c:if test="${article.r_code ==13 }">selected</c:if>>연제구</option>
		            			<option value="14" <c:if test="${article.r_code ==14 }">selected</c:if>>영도구</option>
		            			<option value="15" <c:if test="${article.r_code ==15 }">selected</c:if>>중구</option>
		            			<option value="16" <c:if test="${article.r_code ==16 }">selected</c:if>>해운대구</option>
		            			<option value="17" <c:if test="${article.r_code ==17 }">selected</c:if>>기타지역(부산외)</option>
		                 	</select> 
				        		 </td></tr>
					          <tr><td>제목 </td><td colspan="2"><input type="text" value="${article.r_subject }" name="r_subject" style="width: 100%;"/></td></tr>
					          <tr><td>내용 </td><td colspan="2"><textarea name="r_content" style="width: 100%; height: 300px; resize: none;">${article.r_content }</textarea></td></tr>
		          		</table>
		                	<input type="hidden" name="r_num" value="${article.r_num }">
		               		<input type="hidden" name="page" value="${param.page }">
						<div style="float: right;">
		                <input type="submit" value="등록">
		                <input type="reset" value="다시쓰기" />
		            </div> 
			        
		        </form>

             </section>
                    
          </div>      
        </div>
    </section>

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
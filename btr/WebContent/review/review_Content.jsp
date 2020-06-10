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
    
    <script src="js/jquery-3.5.0.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		
		$('#btn1').click(function(){
			
			var div = $('#hid').css("display");
			
			if (div == "none") {
				$('#hid').css("display","inline");
			}else {
				$('#hid').css("display","none");
			}
			
		});
		
		$('#comment').click(function(){
			
				var formData = $("form[name=commentForm]").serialize();
				
			$.ajax({
					
				type : 'post',
				url : 'Comment_WritePro.re',
				data : formData,
				success : function(rdata){
					alert("글 등록 성공");
				}
			});
		});
			
// 		$('#btn2').click(function(){
			
			
			
// 		});
			
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
                    
                    <div style="width: 400px; height: 450px; float: left;">
		               	<img src="reviewUpload/${article.r_image }" width="400px" height="450px">
		            </div>	
                    
                    <table style="width: 500px; float: right; ">
                    <tr><td>작성자</td><td colspan="2"><input type="text" value="${article.r_id }" readonly></td></tr>
					<tr><td style="float: left;">해당 지역</td><td><input type="text" value="${article.r_name }" readonly></td></tr>      
                    <tr><td>제목 </td><td colspan="2"><input type="text" value="${article.r_subject }" readonly style="width: 100%;"/></td></tr>
                    <tr><td>내용 </td><td colspan="2"><input type="text" value="${article.r_content }" readonly style="width: 100%; height: 300px;"></td></tr>
                    </table>
                    
                    
                    
			<!--   수정, 삭제 구문      -->
                    <c:if test="${sessionScope.id != null }">
                    	<div style="float: right;">
	                    <input type="button" value="댓글" id="btn1">
	                    <input type="button" value="댓글 보기(아직)" id="btn2">
		                    <c:if test="${sessionScope.id == article.r_id }">
			                    <input type="button" value="수정" onclick="location.href='Review_UpdateForm.re?r_num=${article.r_num }&page=${nowPage }'">
			                    <input type="button" value="삭제" onclick="location.href='Review_DeleteForm.re?r_num=${article.r_num }&page=${nowPage }'">
		                    </c:if>
	                    <input type="button" value="목록" onclick="location.href='Review_List.re?page=${nowPage }'">
	                    <img src="review/love.png" width="30px" height="30px" onclick="location.href='Review_ContentLike.re?r_num=${article.r_num }&page=${nowPage }'">
                    	</div>

                    </c:if>
              <!--   수정, 삭제 구문      -->      
                    	
             </section>
          </div>      
        </div>
    </section>
    <section id="blog">
    <div class="blog container">
    <div class="row" style="padding-left: 100px; padding-right: 100px;">
                    	<div id="hid" style="display: none; margin-top: 20px;">
                    		<form action="Comment_WritePro.re" name="commentForm" method="post">
	                    		<textarea rows="5" cols="100" id="rc_content" name="rc_content"></textarea>
	                    		<input type="hidden"name="id" id="id" value="${sessionScope.id }">
	                    		<input type="hidden"name="r_num" id="r_num" value="${article.r_num }">
	                    		<input type="hidden"name="page" id="page" value="${nowPage }">
	                    		<input type="button" id="comment" value="글 쓰기">
                    		</form>
                    	</div>
	                    <table id="commentTable">
	                    <c:forEach var="articleList" items="${articleList }">
	                    	<tr>
		                    	<td>${articleList.rc_num }</td>
		                    	<td>${articleList.rc_id }</td>
		                    	<td>${articleList.rc_content }
		                    		<input type="button" value="답글" onclick="location.href='Comment_ReplyForm.re?rc_num=${articleList.rc_num }&r_num${article.r_num }&page=${nowPage }'">
		                    		<input type="button" value="수정" onclick="location.href='Comment_UpdateForm.re?rc_num=${articleList.rc_num }&r_num=${article.r_num }&page=${nowPage }'">
		                    		<input type="button" value="삭제" onclick="location.href='Comment_Delete.re?rc_num=${articleList.rc_num }&r_num=${article.r_num }&page=${nowPage }'">
			                    	
		                    	</td>
		                    	<td>${articleList.rc_date }</td>
		                    </tr>
	                    </c:forEach>
                   	 	</table>
           </div>
       </div>
    </section>
                   	 	
	<jsp:include page="/inc/bottom.jsp" />

    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.prettyPhoto.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.isotope.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>
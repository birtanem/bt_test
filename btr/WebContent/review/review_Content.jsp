<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="nowPage" value="${page }" />
    <c:set var="pageinfo" value="${pageinfo }" />
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
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    <script src="js/jquery-3.5.0.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		
	      $('#comment').click(function(){
	    	  
	    	 	var id = "${sessionScope.id}";
	            var div = $('#comments').css("display");
	            
	            if (div == "none") {
	                $('#comments').css("display","inline");
	            }else {
	                $('#comments').css("display","none");
	            }
	            
	            $.ajax({
	            	
	            	type : 'post',
	            	dataType : 'json',
	            	url : 'GetCommentList.re?r_num=${article.r_num }',
	            	success : function(rdata){
	            	$('.comments').html("");
	            		$.each(rdata, function(index,item){
	            			
							if (id != null && id != item.rc_id) {
								$('.comments').append(
									
									'<div class="single-comment" >'
			                          +'<div class="comment-content" style="margin-left: 10px;">'
			                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
			                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
			                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
					                  +'<div class="comment-count">'
					                  +'<a id ="reply" href="javascript:;">답글</a>'
			                          +'</div>'
			                          +'</div>'
	                       	);
							}
							else if (id != null && id == item.rc_id) {
								$('.comments').append(							
									
			                          '<div class="single-comment" >'
			                          +'<div class="comment-content" style="margin-left: 10px;">'
			                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
			                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
			                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
					                  +'<div class="comment-count">'
					                  +'<a id ="reply" href="javascript:;">답글</a>'
					                  +'<a id ="update" href="javascript:;"> 수정 </a>'
			                          +'<a id ="delete" href="Comment_Delete.re?r_num=${article.r_num}&page=${nowPage }&rc_num='+item.rc_num+'"> 삭제 </a>'
			                          +'</div>'
			                          +'</div>'
								);
								}	
							else if(id == null){
									$('.comments').append(
											
									'<div class="single-comment" >'
			                          +'<div class="comment-content" style="margin-left: 10px;">'
			                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
			                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
			                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
					                  +'<div class="comment-count">'
			                          +'</div>'
			                          +'</div>'
			                          
								);
								}
	            			
	            		});
	            		
	            	}
	            	
	            });
	            
	        });
		
		$('#commentWrite').click(function(){
			
			var formData = $("form[name=commentForm]").serialize();
			var id = "${sessionScope.id}";
			
			$.ajax({
					
				type : 'post',
				dataType : "json",
				url : 'Comment_WritePro.re',
				data : formData,
				success : function(rdata){
					
				$('.comments').html("");
		        alert("글등록 되었습니다.");
		        $('#rc_content').val("");
		        
					$.each(rdata,function(index,item){
						$('#commentCount').html(item.commentCount);
						
						if (id != null && id != item.rc_id) {
							$('.comments').append(
								
								'<div class="single-comment" >'
		                          +'<div class="comment-content" style="margin-left: 10px;">'
		                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
		                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
		                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
				                  +'<div class="comment-count">'
				                  +'<a id ="reply" href="javascript:;">답글</a>'
		                          +'</div>'
		                          +'</div>'
                       	);
						}
						else if (id != null && id == item.rc_id) {
							$('.comments').append(							
								
		                          '<div class="single-comment" >'
		                          +'<div class="comment-content" style="margin-left: 10px;">'
		                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
		                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
		                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
				                  +'<div class="comment-count">'
				                  +'<a id ="reply" href="javascript:;">답글</a>'
				                  +'<a id ="update" href="javascript:;"> 수정 </a>'
		                          +'<a id ="delete" href="Comment_Delete.re?r_num=${article.r_num}&page=${nowPage }&rc_num='+item.rc_num+'"> 삭제 </a>'
		                          +'</div>'
		                          +'</div>'
							);
							}	
						else if(id == null){
								$('.comments').append(
										
								'<div class="single-comment" >'
		                          +'<div class="comment-content" style="margin-left: 10px;">'
		                          +'<h5 style="float: right;">'+item.rc_date+'</h5>'
		                          +'<h5>작성자&nbsp; : &nbsp;'+item.rc_id+'</h5>'
		                          +'<p>글 내용 &nbsp; : &nbsp;'+item.rc_content+'</p> </div>'
				                  +'<div class="comment-count">'
		                          +'</div>'
		                          +'</div>'
		                          
							);
							}
					});
				}
			});
		});
		
// 		$('#update').click(function(){
// 			alert('123');
// 			$('updateLoad').load("/review/commentUpdateForm.jsp");
			
// 		});
		
		$('#like').click(function(){

			$.ajax({
				
				url : "Review_ContentLike.re?r_num=${article.r_num }&page=${nowPage }",
				dataType : "json",
				success : function(rdata){
					$('#likeCount').html(rdata.likecount);
					
				}
				
			});
			
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
            <div class="row">
                <div class="col-md-8">

                    <div class="blog-item">
                        <a><img class="img-responsive img-blog" src="reviewUpload/${article.r_image }" width="100%"></a>
                        <div class="blog-content">
                            <a class="blog_cat">[${article.r_name }]</a>
                            <h2><a href="blog-item.html">${article.r_subject }</a></h2>
                            <div class="post-meta">
                                <p><a href="#">${article.r_id }</a></p>
                                <p><i class="fa fa-clock-o"></i><a>${article.r_date }</a></p>
                                <p><i class="fa fa-comment"></i>(<a id="likeCount">&nbsp;${article.r_likecount }</a>)</p>
                                <p><a> 조회수&nbsp; : &nbsp;(${article.r_readcount })</a></p>
                            </div>
                            <h3>${article.r_content }</h3>
                            
                            <div class="inner-meta">
                                <div class="social-btns">
                                    <a id="like"  href="javascript:;"> <i class="fa fa-heart"></i> Like</a>
                                    <a id="comment" href="javascript:;" class="tweet-bg">댓글 보기</a>
                                </div>
                            </div>
                            <br>
                          <h2>Comments&nbsp; (<a id="commentCount">${pageinfo.commentCount }</a>)</h2>
                  <!--        댓글 쓰기                    -->
                             <div id="comments" style="display: none;">
                                <div class="single-comment">
                                    <div class="comment-content comment-form">
                                        <form action="Comment_WritePro.re" name="commentForm" method="post">
                                            <textarea rows="5" cols="100" id="rc_content" name="rc_content"></textarea>
                                            <input type="hidden"name="id" id="id" value="${sessionScope.id }">
                                            <input type="hidden"name="r_num" id="r_num" value="${article.r_num }">
                                            <input type="hidden"name="page" id="page" value="${nowPage }">
                                            <input type="button" class="btn btn-primary btn-lg" id="commentWrite" value="Comment" >
                                        </form>
                                    </div>
                                </div>
                    
                            <div class="comments">
                     <!--          댓글 영역                   -->
                            </div>
                        </div>
                    </div>
                </div>
              </div>
              </div>
              </div>
      </section>    
        
	<jsp:include page="/inc/bottom.jsp" />

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
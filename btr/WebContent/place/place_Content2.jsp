<%@page import="place.vo.PlaceBean"%>
<%@page import="place.vo.PlaceCommentBean"%>
<%@page import="place.vo.PCpageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="article" value="${article }" />
    <c:set var="commentList" value="${commentList }" />
<%
ArrayList<PlaceCommentBean> articleList = (ArrayList<PlaceCommentBean>)request.getAttribute("commentList");
PCpageInfo pageInfo = (PCpageInfo)request.getAttribute("cpageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();
String plPage = request.getParameter("page");
%>
   
    

    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Corlate</title>

    <!-- core CSS -->
<link href="css/product_modal.css" rel="stylesheet">

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">


<script src="js/product_modal.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
	
	
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">    
    
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
                        </tr>
                        <tr>
                            <td> 주 소 </td><td>${article.pl_address }</td>
                        </tr>
                        <tr>
                            <td>사${pl_num }진</td>
                                                     
                            <td colspan='3' style="width: 90%; height: 400px;"><img src="placeUpload/${article.pl_image }" width="400px"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td colspan='3' style="width: 90%; height: 400px;">${article.pl_content }</td>
                        </tr>
                    </table>
                    <c:if test="${id != null}" >
                    <form action="PC_WritePro.pl?pl_num=${article.pl_num }" method="post">
                    	<input type="hidden" name="id" value="${id }">
                    	<input type="hidden" name="page" value="<%=plPage%>">
                    	<textarea rows="5" cols="100" name="pc_content"></textarea>
                    <input type="submit" value="댓글">
                    </form>
                    </c:if>
                    
                   
					<c:if test="${sessionScope.id == 'admin'}" >
                    <input type="button" value="수정" onclick="location.href='PlaceUpdateForm.pl?pl_num=${article.pl_num }&page=<%=plPage%>'">
                    <input type="button" value="삭제" onclick="location.href='PlaceDeletePro.pl?pl_num=${article.pl_num }&page=<%=plPage%>'">
					</c:if>
                    				
                  	
                    
                    
                    <input type="button" value="목록" onclick="location.href='PlaceList.pl?page=<%=plPage%>'">
                    
                    <%
			if(articleList != null && listCount > 0) {
			%>
                    
                    <table> 

                    <c:forEach var="commentList" items="${commentList }">
                    	<tr>
	                    	<td>${commentList.pc_content }</td>
	                    	<td>${commentList.member_id }</td>
	                    	<td>${commentList.pc_date }</td>
	                    	<td>${commentList.pc_rank }</td>
	                    	
	                    	
	                    </tr>
                    </c:forEach>
                    </table>
                    <c:forEach var="commentList" items="${commentList }">
                             <div class="single-comment">
             <div class="comment-img">
                 <img src="x.PNG" alt="author">
             </div>
             <div class="comment-content">
                 <h5>${commentList.member_id }</h5>
                 <p>${commentList.pc_content }</p>
             </div>
             <div class="comment-count">
                 <a href="#"><i class="fa fa-reply"></i> ${commentList.pc_date }</a>
                 <a href="#"><i class="fa fa-heart"></i> ${commentList.pc_rank }</a>
             </div>
         </div></c:forEach>
                    
             <section id="pageList">
	<%if(nowPage <= 1) {%>
			<input type="button" value="이전">&nbsp;
	<%} else {%>
			<input type="button" value="이전" onclick="location.href='PlaceDetail.pl?cpage=<%=nowPage - 1 %>&pl_num=${article.pl_num }&page=<%=plPage%>'">&nbsp;
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) { 
			if(i == nowPage) { %>
				[<%=i %>]&nbsp;
			<%} else { %>
					<a href="PlaceDetail.pl?pl_num=${article.pl_num }&page=<%=plPage%>&cpage=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) { %>
			<input type="button" value="다음">
	<%} else { %>
			<input type="button" value="다음" onclick="location.href='BoardList.bo?cpage=<%=nowPage + 1 %>&pl_num=${article.pl_num }&page=<%=plPage%>'">
	<%} %>
	</section>
	<%
	} else {
	%>
	<section id="emptyArea">등록된 댓글이 없습니다</section>
	<%
	}
	%>
             
             
             </section>
                    
          </div>      
                <!--/.col-md-8-->
        </div>
    </section>
    <!--/#blog-->

    <!--/#bottom-->
<jsp:include page="/inc/bottom.jsp" />
    
    <!--/#footer-->

  
</body>
</html>
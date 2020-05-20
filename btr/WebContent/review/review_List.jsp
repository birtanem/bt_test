<%@page import="vo.ReviewPageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%

ArrayList<ReviewBean> article = (ArrayList<ReviewBean>)request.getAttribute("articleList");
ReviewPageInfo pageInfo = (ReviewPageInfo)request.getAttribute("pageinfo");

int listCount = pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>글 목록</h1>
<input type="button" value="글쓰기" onclick="location.href='Review_WriteForm.re'">
<table>
<%

if(article != null && listCount >0){
	%>
	        <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>날짜</td>
                <td>조회수</td>
            </tr>
	
	<%
	
	for(int i = 0; i < article.size();i++){ %>
	<tr>
        <td><%= article.get(i).getNum() %></td>
        <td><%= article.get(i).getId() %></td>
        <td><%= article.get(i).getSubject() %></td>
        <td><%= article.get(i).getReadcount() %></td>
        <td><%= article.get(i).getDate() %></td>
    </tr>
	<%}
	
}

%>
</table>
</body>
</html>
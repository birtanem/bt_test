<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="article" value="${article }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Comment_UpdatePro.re" method="post">
	<input type="hidden" name="r_num" value="${param.r_num }">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="rc_num" value="${param.rc_num }">
    <input type="hidden" name="rc_id" value="${article.rc_id }">
    <input type="text" name="rc_content" value="${article.rc_content }">
    <input type="hidden" name="rc_ref" value="${article.rc_ref }">
    <input type="hidden" name="rc_lev" value="${article.rc_lev }">
    <input type="hidden" name="rc_seq" value="${article.rc_seq }">
    <input type="submit" value="댓글">
</form>
</body>
</html>
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
<form action="Comment_ReplyPro.re" method="post">

	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="r_num" value="${article.r_num }">
	<input type="hidden" name="rc_num" value="${param.rc_num }">
	<input type="hidden" name="rc_ref" value="${article.rc_ref }">
	<input type="hidden" name="rc_seq" value="${article.rc_seq }">
	<input type="hidden" name="rc_lev" value="${article.rc_lev }">
    <input type="hidden" name="id" value="admin">
    <textarea rows="5" cols="100" name="rc_content"></textarea>
    <input type="submit" value="댓글">
</form>
</body>
</html>
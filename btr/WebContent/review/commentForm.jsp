<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Comment_WritePro.re" method="post">
	<input type="hidden" name="r_num" value="${param.r_num }">
    <input type="hidden" name="id" value="test">
    <textarea rows="5" cols="100" name="rc_content"></textarea>
    <input type="submit" value="댓글">
</form>
</body>
</html>
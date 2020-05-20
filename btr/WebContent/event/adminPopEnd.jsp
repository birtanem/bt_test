<%@page import="dao.EventDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

SimpleDateFormat sdf = new SimpleDateFormat();

Date d = new Date();

String date = sdf.format(d);

EventDAO edao = EventDAO.getInstance();

edao.setDate(date, 1);

%>
</body>
</html>
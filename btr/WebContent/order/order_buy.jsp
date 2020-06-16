<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" class="w3-table-all w3-card-4 center font" style="width: 1000px; text-align: center; border: 3px solid pink;">
	<tr>
		<td>상품명</td>
		<td>상품 이미지</td>
		<td>가격</td>
		<td>수량</td>
		<td>합계</td>
	</tr>
	
	<c:forEach var="p" items="${sessionScope.arrayList }" varStatus="status">
		<tr>
			<td>${p.p_name }</td>
			<td><img src="product/productUpload/${p.p_image }" width="200" height="100"></td>
			<td><fmt:formatNumber value="${p.p_price/p.p_amount }" pattern="0"/></td>
			<td>${p.p_amount }</td>
			<td>${p.p_price}</td>
		</tr>
	</c:forEach>
</table>
주문정보<br>
아이디: ${sessionScope.info.id}<br>
이메일: ${sessionScope.info.email}<br>
폰번: ${sessionScope.info.phone}
</body>
</html>
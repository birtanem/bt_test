<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장바구니 목록
<form method="post">
<table border="1">
	<tr>
		<td><input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)"/></td>
		<td>장바구니 번호</td>
		<td>카테고리</td>
		<td>상품 이미지</td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
	</tr>
	
	<c:forEach var = "c" items ="${cartList} " varStatus="status"></c:forEach>
	<c:forEach var = "p" items ="${productList} " varStatus="status"></c:forEach>
	
	<tr>
		<td>
			<input type="checkbox" id="remove" name="remove" value=${c.c_num }>
		</td>
		<td>
			${status.index+1 }<!-- 번호 값 계산 -->
		</td>
		<td>
			${p.p_category}
		</td>
		<td>
			<img src="images/${p.p_image}" id ="cartImage"> 
		</td>
		<td>
		 	${p.p_name }
		</td>
		<td>
			${p.p_price }
		</td>
		<td>
			${p.p_amount }
		</td>
		
		
		
		
	</tr>
</table>
</form>
</body>
</html>
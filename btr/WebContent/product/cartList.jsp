<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function checkAll(fr) {
	if(fr.remove.length == undefined) {
		fr.remove.checked = fr.allCheck.checked;
	} else {
		for(var i=0; i<fr.remove.length;i++) {
			fr.remove[i].checked = fr.allCheck.checked;
		}
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장바구니 목록

<form method="post" name="fr">
<table border="1">
	<tr>
		<td><input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)"/></td>
		<td>번호</td>
		<td>카테고리</td>
		<td>상품 이미지</td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
	</tr>

<c:forEach var="p" items="${productList }" varStatus="status">
	<tr>
		<td>
			<input type="checkbox" id="remove" name="remove" value="${p.p_name}"/>
		</td>
		<td>
			${status.index+1 }
		</td>
		<td>
			${p.p_category }
		</td>
		<td>
			${p.p_image }
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
</c:forEach>	
</table>
</form>
</body>
</html>
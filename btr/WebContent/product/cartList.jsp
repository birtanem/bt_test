<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">

 function checkAll(obj) {
	 
	 var chkObj = document.getElementsByName("rowCheck");
	 var rowCnt = chkObj.length - 1;
	 var check = obj.checked;
	 
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true;
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false;
	           }
	      }
	  }
} 
 function deleteCart() {

		var message = "";
		var messageChk = document.getElementsByName("rowCheck");
		var check = false;
		var indexMessage = false;
		
		for(i=0;i<messageChk.length;i++) {
			if(messageChk[i].checked) {
				if(indexMessage) {
					message = message + "-";
				}
				message = message + messageChk[i].value;
				indexMessage = true;
			}
		}	
		if(!indexMessage) {
			alert("삭제할 상품을 선택하세요.");
			return
		}
		
	$.ajax("ProductCartRemove.ca", {
		type:"POST",
		data: {"message": message},
		success: function() {
		}
	});
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
		<td><input type="checkbox" id="allCheck" onclick="checkAll(this)"/></td>
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
			<input type="checkbox" name="rowCheck" value="${cartList[status.index].c_num }"/>
		</td>
		
		<td>
			${cartList[status.index].c_num }
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
			${cartList[status.index].c_p_amount }
		</td>
	</tr>
</c:forEach>	
</table>
	<input type="button" value="취소" onclick="return deleteCart()">
</form>
<c:if test="${productList == null }">
	<section>
	장바구니에 추가된 상품이 없습니다.
	</section>
</c:if>
<nav>
	<a href="productList.pr">쇼핑 계속하기</a>
</nav>
</body>
</html>
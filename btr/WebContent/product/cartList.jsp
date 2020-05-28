<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

$(document).ready(function(){
	$('#deleteButton').click(function(){ // 취소 버튼 눌렀을때
		if($("input:checkbox[id='rowCheck']").is(":checked")==true){ // 체크박스가 체크되어있으면
			alert("선택한 상품이 삭제되었습니다");	
			location.reload(); // 새로고침
		}
	});
});

/* function minuscount(num){

	var count = Number(document.getElementById("product_count").value) + num;
	
	if(count<1){
		count=1;
		alert("최소 1개이상 구매할 수 있는 상품입니다.");
	}
	document.getElementById("product_count").value = count;

}

function pluscount(num){

	var count = Number(document.getElementById("product_count").value) + num;
	
	document.getElementById("product_count").value = count;

} */

/* $(document).ready(function(){
	   $('#minus').click(function(){
	      var count=Number(document.getElementById("amount"+${status.index }).value)-1;
	      var meg="주문가능한 최소 수량은 1 입니다."
	      if(count<1){
	         count=1;
	         $(".detailCheck").html(meg);
	         return false;
	      }
	      document.getElementById("amount"+${status.index }).value=count;
	   });
	   $('#plus').click(function(){
	      var count=Number(document.getElementById("amount"+${status.index }).value)+1;
	      var max=${productDetail.p_amount};
	      var meg="주문수량이 상품 수량보다 많습니다.";
	      if(count>max){
	         $(".detailCheck").html(meg);
	         return false;
	      }
	      document.getElementById("amount"+${status.index }).value=count;
	   });
	});
 */
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장바구니 목록

<form method="post" name="fr" id="fr">
<table border="1">
	<tr>
		<td><input type="checkbox" id="allCheck" onclick="checkAll(this)"/></td>
		<td>번호</td>
		<td>카테고리</td>
		<td>상품명</td>
		<td>상품 이미지</td>
		<td>가격</td>
		<td>수량</td>
		<td>합계</td>
	</tr>

<c:forEach var="p" items="${productList }" varStatus="status">
	<tr>
		<td>
			<input type="checkbox" name="rowCheck" id="rowCheck" value="${cartList[status.index].c_num }"/>
		</td>
		<td>
			${cartList[status.index].c_num }
		</td>
		<td>
			${p.p_category }
		</td>
		<td>
			${p.p_name }
		</td>
		<td>
			<img src="product/productUpload/${p.p_image }" width="200" height = "100">
		</td>
		<td>
			${p.p_price }
		</td>
	 	<td>
			<a href="CartAmountUp.ca?p_name=${p.p_name }">
			<img src="images/up.png" id ="upImage" width="25" height="25" border=0/>
			</a><br>
			${cartList[status.index].c_p_amount }<br>
			<a href="#">
			<img src="images/down.png" id ="downImage" width="25" height="25" border=0/>
			</a>
		</td> 
<%-- 		<td>
		<button class="btnCalc minus" id="plus">-</button>
		<input type="text" id="amount${status.index }" name="amount" value="1" class="tx_num" title="구매수량">
		<button class="btnCalc plus" id="minus">+</button>
		<p class="detailCheck"></p>
		</td> --%>
		<td>
			${cartList[status.index].c_p_amount * p.p_price}
		</td>
	</tr>
</c:forEach>
</table>
	
			총 금액 :
			<c:set var="totalmoney" value="0" />
			<c:forEach var="p" items="${productList }" varStatus="status">
			<c:set var="money" value="${cartList[status.index].c_p_amount * p.p_price}" />
				<c:set var="totalmoney" value="${totalmoney + money }"/>
			</c:forEach>
			<c:out value="${totalmoney }"/> 원
	<input type="button" value="취소" id="deleteButton" onclick="return deleteCart()">
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
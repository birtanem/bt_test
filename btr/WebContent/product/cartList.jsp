<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">

function addAmount(num, idx){
	var amount=document.getElementById("amount"+idx).value();
	var count=Number(document.getElementById("amount"+idx).value())+num;
	if(count<1){
		count=1;
		alert("최소수량1개입니다");
		return false
	}
	amount=count;
	location.href="ProductCartAdd.ca?p_num="+${cartList[status.index].c_num }+"&p_amount="+amount;
}




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

$('.fun-btn').on('click', function(event) {
	  $(this).toggleClass('start-fun');
	  var $page = $('.page');
	  $page.toggleClass('color-bg-start')
	    .toggleClass('bg-animate-color');

	  $(this).hasClass('start-fun') ?
	    $(this).text('stop the fun') :
	    $(this).text('start the fun');

	});
	

 function minuscount(num, a) {

		var amount = document.getElementById("amount"+num).value
		var price = document.getElementById("price"+num).value
		var count = Number(amount) + a;
		var total = 0;
		
		document.getElementById("amount"+num).value = count
		
		document.getElementById("td"+num).innerText = count * price

		total = Number(document.getElementById("span").innerText) + a*price	
		document.getElementById("span").innerText = total
		
		}
	

</script>

<style type="text/css">

.center {

    margin: auto;

    width: 50%;

    padding: 10px;

}

.page {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
}


/* add default color for animation start  */


/* toggle this class */

.color-bg-start {
  background-color: salmon;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  background-color: salmon;
  color: white;
  padding: 2em 3em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: salmon !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}

table.type10 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 150px;
    padding: 10px;
}
table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type10 .even {
    background: #fdf3f5;
}

.font {
	font-family: 'Noto Serif KR', serif;
}

</style>

<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>


	<div class="center font">    
<h2 class="font" style="text-align: center; color: #f7238a;" >장바구니 목록</h2>

<form method="post" name="fr" id="fr" style="text-align: center">
<table border="1" class="w3-table-all w3-card-4 center font" style="width:1000px; 
text-align: center; border: 3px solid pink;" > 
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
			
				<input type="button" value="-" onclick="minuscount(${status.count },-1)">
				<input type="text" id="amount${status.count }" name="amount" value="${cartList[status.index].c_p_amount }" class="tx_num" title="구매수량">
				<input type="button" value="+" onclick="minuscount(${status.count },1)">
				<input type="hidden" id="price${status.count }" value="${p.p_price}">
		</td> 

		<td id="td${status.count }">
			${cartList[status.index].c_p_amount * p.p_price}
		</td>
	</tr>
</c:forEach>
</table>
		<br>
		총 금액 :
		<div style="color:#f42735;">
			<c:set var="totalmoney" value="0" />
			<c:forEach var="p" items="${productList }" varStatus="status">
			<c:set var="money" value="${cartList[status.index].c_p_amount * p.p_price}" />
				<c:set var="totalmoney" value="${totalmoney + money }"/>
			</c:forEach>
			<h3 class="h3"><span id="span"><c:out value="${totalmoney }"/></span>원</h3>
		</div>
</form>
<c:if test="${productList == null }">
	<section style="font-family: 'Gamja Flower', cursive;">
	장바구니에 추가된 상품이 없습니다.
	</section>
</c:if>
<div class="center">
	<nav style="text-align: center">
		<input type="button" class="fun-btn" style="text-align: center" value="취소" id="deleteButton" onclick="return deleteCart()">
		<input type="button" class="fun-btn" style="text-align: center" value="쇼핑 계속하기" onclick="location.href='productList.pr'">
	</nav>
</div>
	</div>

</body>
</html>
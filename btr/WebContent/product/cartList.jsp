<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/product_modal.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">

<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">

// function addAmount(num, idx){
// 	var amount=document.getElementById("amount"+idx).value();
// 	var count=Number(document.getElementById("amount"+idx).value())+num;
// 	if(count<1){
// 		count=1;
// 		alert("최소 수량 1개입니다");
// 		return false;
// 	}
// 	amount=count;
// 	location.href="ProductCartAdd.ca?p_num="+${cartList[status.index].c_num }+"&p_amount="+amount;
// }


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
	
	 $("#orderBtn").click(function() {
		 
		 	var messageChk = document.getElementsByName("rowCheck");
		 	var amountChk = document.getElementsByName("amount");
		 	var indexMessage = false;
		    var testList = new Array() ;
	  		     	
		    for(var i=0; i<messageChk.length; i++){
		         
		        // 객체 생성
		        var data = new Object() ;
		         
		     // 리스트에 생성된 객체 삽입
		        if(messageChk[i].checked) {
		        	  data.num =  messageChk[i].value;
				      data.amount = amountChk[i].value;
				      data.price = document.getElementById("td"+(i+1)).innerText;
				      testList.push(data) ;
				      indexMessage = true;
		        }
		   	    	        
				if(!indexMessage) {
					alert("주문할 상품을 선택하세요.");
					return
				}
		        
		        
		    }


//		     // String 형태로 변환
		    var jsonData = JSON.stringify(testList) ;
			var total = document.getElementById("span").innerText;
		     
			$.ajax("orderFront.or", {
				type:"POST",
				data: {"jsonData": jsonData,
					   "total": total},
				success: function() {
					location.href="orderForm.or"
				}
			});
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

		var amount = document.getElementById("amount"+num).value;
		var price = document.getElementById("price"+num).value;
		var count = Number(amount) + a;
		var total = 0;
		
		document.getElementById("amount"+num).value = count;
		
		document.getElementById("td"+num).innerText = count * price;


		total = Number(document.getElementById("span").innerText) + a*price	;
		document.getElementById("span").innerText = total;

		
		}
	
//  function goOrder(){
// 		var id='admin'; 
// 		var amount=Number(document.getElementById("amount").value);
// 		if(id==null || id=="null"){
// 			alert("로그인 후 이용해주세요");
// 			location.href="MemberLoginForm.me";
// 			return false;
// 		}
// 		location.href="orderAdd.or?o_p_num="+c_num+"&o_p_amount="+amount;
// 	}

</script>

<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/inc/top.jsp" />
	<section class="portfolio">
		<div class="container">
			<div class="center font">
				<h2 class="font" style="text-align: center; color: #f7238a;">장바구니
					목록</h2>
				<form method="post" name="fr" id="fr" style="text-align: center">
					<table border="1" class="w3-table-all w3-card-4 center font"
						style="width: 1000px; text-align: center; border: 3px solid pink;">
						<tr>
							<td><input type="checkbox" id="allCheck"
								onclick="checkAll(this)" /></td>

							<td>카테고리</td>
							<td>상품명</td>
							<td>상품 이미지</td>
							<td>가격11</td>
							<td>수량</td>
							<td>합계</td>
						</tr>

						<c:forEach var="p" items="${productList }" varStatus="status">
							<tr>
								<td><input type="checkbox" name="rowCheck" id="rowCheck"
									value="${cartList[status.index].c_p_num }" /></td>							
								<td>${p.p_category }</td>
								<td>${p.p_name }</td>
								<td><img src="product/productUpload/${p.p_image }"
									width="200" height="100"></td>
								<td>${p.p_price }</td>
								<td><input type="button" value="-"
									onclick="minuscount(${status.count },-1)"> <input
									type="text" id="amount${status.count }" name="amount"
									value="${cartList[status.index].c_p_amount }" class="tx_num"
									title="구매수량"> <input type="button" value="+"
									onclick="minuscount(${status.count },1)"> <input
									type="hidden" id="price${status.count }" value="${p.p_price}">
								</td>
								<td id="td${status.count }">
									${cartList[status.index].c_p_amount * p.p_price}</td>
							</tr>
						</c:forEach>
					</table>
					<br> 총 금액 :
					<div style="color: #f42735;">
						<c:set var="totalmoney" value="0" />
						<c:forEach var="p" items="${productList }" varStatus="status">
							<c:set var="money"
								value="${cartList[status.index].c_p_amount * p.p_price}" />
							<c:set var="totalmoney" value="${totalmoney + money }" />
						</c:forEach>
						<h3 class="h3">
							<span id="span"><c:out value="${totalmoney }" /></span>원
						</h3>
					</div>
				</form>
				<c:if test="${productList == null }">
					<section style="font-family: 'Gamja Flower', cursive;">
						장바구니에 추가된 상품이 없습니다.</section>
				</c:if>
				<div class="center">
					<nav style="text-align: center">
						<input type="button" class="fun-btn" style="text-align: center"
							value="쇼핑 계속하기" onclick="location.href='productList.pr'">
						<input type="button"  id="orderBtn"  class="fun-btn" style="text-align: center"
							value="주문하기" onclick="goOrder()"><br> <br> 
							<input type="button" class="fun-btn"style="text-align: center"
							value="취소" id="deleteButton" onclick="return deleteCart()">
					</nav>
				</div>
			</div>
		</div>
	</section>



</body>
</html>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%ArrayList<ProductBean> productList = (ArrayList<ProductBean>)request.getAttribute("productList"); 
int ListCount=(int)request.getAttribute("ListCount"); 
%>


<!DOCTYPE html>
<html>
<head>
<link href="css/product_modal.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="productListForm">
<h2>상품리스트</h2>
<ul class="produclList">
<%if (productList !=null && ListCount>0){
	for(int i=0; i<productList.size();i++){ %>		
<li><img src="product/productUpload/아쿠아리움 커플.png" alt="ticket">
<h5 class="product-title"><%=productList.get(i).getP_name() %></h5>
<p><%=productList.get(i).getP_content() %></p>
<p><strong><%=productList.get(i).getP_price()%></strong></p>
<a href="product_buying.bo">구매하기</a>
</li>
<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Modal Header</h2>
    </div>
    <div class="modal-body">
      <p>Some text in the Modal Body</p>
      <p>Some other text...</p>
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>

</div>



<%
	}

}	else{%>
	 <section id="emptyArea">등록된 글이 없습니다.</section>	
<%}%>

</ul>

</section>

</body>
</html>
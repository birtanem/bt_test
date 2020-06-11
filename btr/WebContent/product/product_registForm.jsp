<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: auto;
}
</style>
</head>
<body>

<h2 style="text-align: center;">상품 등록</h2> 

<form action="productRegistPro.pr" method="post" name="fr"
enctype="multipart/form-data">

<table border="1">
	<tr>
	 	<td>상품명</td>
	 	<td><input type="text" name="p_name" id="p_name"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td><select name="p_category">
		<option value="아쿠아리움">아쿠아리움</option>
		<option value="전시">전시</option>
		<option value="요트">요트</option>
		<option value="체험">체험</option>
		</select></td>
	</tr>
	
	<tr>
		<td>지역코드</td>
		<td><select name="region_region_code">
		<option value="1">강서구</option>
		<option value="2">금정구</option>
		<option value="3">기장군</option>
		<option value="4">남구</option>
		<option value="5">동구</option>
		<option value="6">동래구</option>
		<option value="7">부산진구</option>
		<option value="8">북구</option>
		<option value="9">사상구</option>
		<option value="10">사하구</option>
		<option value="11">서구</option>
		<option value="12">수영구</option>
		<option value="13">연제구</option>
		<option value="14">영도구</option>
		<option value="15">중구</option>
		<option value="16">해운대구</option>
		<option value="17">기타지역(부산 외)</option>
		</select></td>
	</tr>
	
	
	<tr>
		<td>가격</td>
		<td><input type="text" name="p_price" id="p_price"></td>
	</tr>
	<tr>
	<td>상품수량</td>
		<td><input type="text" name="p_amount" id="p_amount"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><textarea rows="5" cols="60" name="p_content" id="p_content"></textarea></td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<td><input type="file" name="p_file" id="p_file"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="상품등록">
			<input type="reset" value="다시작성">
			<input type="button" value="상품목록" onclick="location.href='productList.pr'">
		</td>
	</tr>



</table>
</form>
</body>
</html>
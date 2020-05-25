<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC_Board</title>

</head>
<body>
	<!-- 게시판 등록 -->
	
		<h1>장소소개 글 등록</h1>
		<form action="PlaceWritePro.pl" method="post" enctype="multipart/form-data" name="placeForm">
			<table>
			<tr><td>장소명 :</td><td> <input type="text" name="pl_name" required="required"/></td></tr>
			<tr><td>장소 소개 내용 </td><td><textarea name="pl_content" cols="40" rows="15" required="required" style="resize: none;"></textarea></td></tr>
			<tr><td>주소 : </td><td><input type="text" name="pl_address" required="required"/></td></tr>
			<tr><td>사진파일 : </td><td><input type="file" name="pl_image" required="required"/></td></tr>
			<tr><td>주제 : </td><td><input type="text" name="pl_theme" required="required"/></td></tr>
			<tr><td>지역 : </td><td><input type="text" name="region_code" required="required"/></td></tr>
				<tr><td colspan=2><input type="submit" value="등록">
								<input type="reset" value="다시쓰기"></td></tr>
			</table>
		</form>
		
</body>
</html>
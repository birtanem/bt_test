<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정 - 이미지넣기</title>
<style type="text/css">
div{
text-align: center;
}
</style>
<script src="js/jquery-3.5.0.js"></script>
<script type="text/javascript">

function imgcheck(){
	if(document.imgfr.p_file.value=="" || document.getElementById("p_file").value==null){
		document.fgColor="red";
		document.getElementById("imgcheck").innerText = "이미지를 첨부해주세요";		
		return false;
	}
// 	var formData=new FormData($('#imgfr'));
// 	$.ajax({
// 		type:'post',
// 		url:'/productImgUpdatePro.pr',
// 		data:formData,
// 		contentType: false,
// 		processData: false,
// 		success:function(response){
// 			window.close();
// 		},
// 		error:function(error){
// 			alert("실ㅍ");}
// 		});
		
		
	document.imgfr.action="productImgUpdatePro.pr";
	document.imgfr.submit();
	
// 	window.open("about:blank","_self").close();
	}

function wClose(){
	window.close();
}
</script>
</head>
<body>
<div>
<form enctype="multipart/form-data" method="post" id="imgfr"name="imgfr" onsubmit="return imgcheck()">
<input type="hidden" value="${param.p_num }" name="p_num">
<input type="file" name="p_file" id="p_file">
<input type="submit" class="btn" value="수정">
<input type="button" class="btn" value="취소" onclick="wClose()"><br>
<div id="imgcheck"></div>
</form>
</div>
</body>
</html>
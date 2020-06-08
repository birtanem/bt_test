<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Corlate</title>

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/icomoon.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">


    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    <script src="js/jquery-3.5.0.js"></script>


<style type="text/css">
#loginWrap {
	min-height: 100%;
	position: relative;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
.joinContainer input, .joinContainer select {
  width: 100%;
  padding: 15px;
  margin: 5px 0 3px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.joinContainer input:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: black;
  color: white;
  padding: 14px 20px;
  margin: 50px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: gray;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}
/* Add padding to container elements */
.joinContainer {

  	position: absolute;
	top: 50%;
	left: 50%;
  padding: 16px;
  width: 450px;
  height: 1200px;
  margin: -500px 0 0 -225px;
  text-align: center;

}
.joinContainer label {
	text-align: left;
	width: 100%;
	margin-top: 20px;
	
}
.joinContainer span {
	display: block;
	text-align: left;
	color: red;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
<script type="text/javascript">

function idCheck() {

	if(joinForm.id.value=="") {
		$("#idChk").html("필수 입력");
		return false;
	}else {
		return true;
	}	
}
function passCheck() {
	if(joinForm.pass.value=="") {
		$("#passChk").html("필수 입력");
		return false;
	}else{
		
		return true;
	}	
}
function repassCheck() {
	if(joinForm.repass.value != joinForm.pass.value) {
		$("#repassChk").html("비밀번호 불일치");
		return false;
	}else{
		
		return true;
	}	
}
function nameCheck() {
	if(joinForm.name.value=="") {
		$("#nameChk").html("필수 입력");
		return false;
	}else{
		
		return true;
	}	
}
function genderCheck() {
	if($("#gender option:selected").val() == "성별") {
		$("#genderChk").html("필수 선택");
		return false;
	}else{
		
		return true;
	}	
}

function ageCheck() {
	if(joinForm.age.value=="") {
		$("#ageChk").html("필수 입력");
		return false;
	}else{
		
		return true;
	}	
}
function emailCheck() {
	if(joinForm.email.value=="") {
		$("#emailChk").html("필수 입력");
		return false;
	}else{
		
		return true;
	}	
}
function phoneCheck() {
	if(joinForm.phone.value=="") {
		$("#phoneChk").html("필수 입력");
		return false;
	}else{
		
		return true;
	}
}
function typeCheck() {
	if($("#type option:selected").val() == "관심사") {
		$("#typeChk").html("필수 선택");
		return false;
	}else{
		
		return true;
	}
}

function joinCheck() {

	if(idCheck() && 
	   passCheck() &&
	   repassCheck() &&
	   nameCheck() &&
	   genderCheck() &&
	   ageCheck() &&
	   emailCheck() &&
	   phoneCheck() &&
	   typeCheck()) {
		
		var formData = $("form[name=joinForm]").serialize() ;

		$.ajax({
            type : 'post',
            url : 'MemberJoinPro.me',
            data : formData,
            success : function(re){
        		
        		var rdata = re.trim();
        		
        		$(".joinContainer span").html("");
        		
            	if(rdata == "id") {
            		
            		$("#idChk").html("아이디 중복");     		
            	}else if(rdata == "email") {
            		$("#emailChk").html("이메일 중복");
            	}else if(rdata == "phone") {
            		$("#phoneChk").html("휴대전화 중복");
            	}else if(rdata == "1"){
            		location.href= "./"
            	}else {
            		alert("회원가입 실패")
            	}
            },
            error: function(xhr, status, error){
                alert(error);
            }
        });
		
	}else{
	
		return false;
	}
}
</script>
</head>
<body>
<div id="loginWrap">
<jsp:include page="../inc/top.jsp"></jsp:include>

    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>회원가입</h1>
    </div>

    <section id="contact-page" style="height: 1500px;">

<form action="MemberJoinPro.me" method="POST" name="joinForm">
  <div class="joinContainer">

    <label for="id"><b>아이디</b></label>
    <input type="text" placeholder="아이디를 입력하세요" name="id">
    <span id="idChk"></span>
    
    <label for="pass"><b>비밀번호</b></label>
    <input type="password" placeholder="비밀번호를 입력하세요" name="pass">
    <span id="passChk"></span>
    
    <label for="repass"><b>비밀번호 재확인</b></label>
    <input type="password" placeholder="비밀번호를 입력하세요" name="repass">
    <span id="repassChk"></span>
    
    <label for="name"><b>이름</b></label>
    <input type="text" placeholder="이름를 입력하세요" name="name">
    <span id="nameChk"></span>
    
    <label for="gender"><b>성별</b></label>
    <select name="gender" id="gender">
       <option value="성별">성별</option>
   	   <option value="남">남자</option>
	   <option value="여">여자</option>
    </select>
    <span id="genderChk"></span>
    
    <label for="age"><b>나이</b></label>
    <input type="text" placeholder="나이를 입력하세요" name="age">
    <span id="ageChk"></span>
    
    <label for="email"><b>이메일</b></label>
    <input type="text" placeholder="이메일을 입력하세요" name="email" >
    <span id="emailChk"></span>
    
    <label for="phone"><b>휴대전화</b></label>
    <input type="text" placeholder="휴대전화를 입력하세요" name="phone">
    <span id="phoneChk"></span>
    
    <label for="type"><b>관심사</b></label>
    <select name="type" id="type">
   	   <option value="관심사">관심사</option>
	   <option value="여행">여행</option>
	   <option value="맛집">맛집</option>
    </select>
	<span id="typeChk"></span>


    <div class="clearfix">
      <button type="button" class="signupbtn" onclick="return joinCheck()">회원가입</button>
      <button type="button" class="cancelbtn">취소</button> 
    </div>
  </div>
</form>

</section>
    <!--/#bottom-->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!--/#footer-->
</div>

    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link href="css/order.css" rel="stylesheet">

<script src="js/jquery-3.5.0.js"></script>

<style type="text/css">
.o_info {background: #f4f4f4; height: 130px;}
.loginInput {
  
  
  padding: -5px 10px;
  border: 1px solid #ccc;
  margin-bottom: 5px;
 
}
form {float: left;}
</style>
<script type="text/javascript">

	
	function listSearch(num) {
		
		var betweenDay = num; 
		var nowDay2 = new Date(); 		
		var btTime = 0;
		var selectedDay = 0;

		if(betweenDay == 0) {			
			// 선택 년, 월, 일
			selectedDay = new Date($("#selYear1 option:selected").val(), $("#selMonth1 option:selected").val()-1, $("#selDay1 option:selected").val());
			// 밀리초
			btTime = nowDay2.getTime() - selectedDay.getTime();
		}else if(betweenDay == 1) {		
			selectedDay = new Date(nowDay2.getFullYear(), nowDay2.getMonth()-1, nowDay2.getDate());
			btTime = nowDay2.getTime() - selectedDay.getTime();
		}else if(betweenDay == 3) {		
			selectedDay = new Date(nowDay2.getFullYear(), nowDay2.getMonth()-3, nowDay2.getDate());
			btTime = nowDay2.getTime() - selectedDay.getTime();		
		}else if(betweenDay == 6) {		
			selectedDay = new Date(nowDay2.getFullYear(), nowDay2.getMonth()-6, nowDay2.getDate());
			btTime = nowDay2.getTime() - selectedDay.getTime();				
		}
	
		betweenDay = Math.floor(btTime/(1000*60*60*24));
	
		$.ajax({
			url: "orderListSearch.or",
			data: {"betweenDay" : betweenDay},
			dataType: "json",
			success: function(rdata) {
				$("table tr:not(:first)").empty();
				
				$.each(rdata, function(index, item) {
										
					$("table").append("<tr><td><a href='orderListDetail.or'>"+item.orderNum+"<br>상세보기</a></td><td>이미지</td><td>"+item.name+"</td><td>"+item.amount+"</td><td>"+item.price+"</td></tr>");

				});
			}
		});
	}

</script>
<script type="text/javascript">

    window.onload = function() {

        /********************************************
        select1
        ********************************************/
        
        var frm = document.getElementById('mainForm');
        
        var nowDate = new Date();
        var nowYear = nowDate.getFullYear();
        var nowMonth = eval(nowDate.getMonth()) +1;
        var nowDay = eval(nowDate.getDate());
        
        /***************
         * 년 세팅
         ***************/
        var startYear    = nowYear - 10;
        for( var i=0; i<20; i++ ) {
            frm['dateYear'].options[i] = new Option(startYear+i, startYear+i);
        }
    
        /***************
         * 월 세팅
         **************/
        for (var i=0; i<12; i++) {
            frm['dateMonth'].options[i] = new Option(i+1, i+1);
        }
        
        
        /***************************************
         * 먼저 현재 년과 월을 셋팅
         * 윤년계산과 월의 마지막 일자를 구하기 위해
         ***************************************/
        frm['dateYear'].value        = nowYear;
        frm['dateMonth'].value    = nowMonth;
        
        setDay();
        /********************************************
         * 일(day)의 select를 생성하고 현재 일자로 초기화
         ********************************************/
        frm['dateDay'].value        = nowDay;
        
        
        
        /********************************************
        select2
        ********************************************/
        
        var frm2 = document.getElementById('mainForm2');
        
        var nowDate2 = new Date();
        var nowYear2 = nowDate2.getFullYear();
        var nowMonth2 = eval(nowDate2.getMonth()) +1;
        var nowDay2 = eval(nowDate2.getDate());
        
        /***************
         * 년 세팅
         ***************/
        var startYear2    = nowYear2 - 10;
        for( var i=0; i<20; i++ ) {
            frm2['dateYear2'].options[i] = new Option(startYear2+i, startYear2+i);
        }
    
        /***************
         * 월 세팅
         **************/
        for (var i=0; i<12; i++) {
            frm2['dateMonth2'].options[i] = new Option(i+1, i+1);
        }
        
        
        /***************************************
         * 먼저 현재 년과 월을 셋팅
         * 윤년계산과 월의 마지막 일자를 구하기 위해
         ***************************************/
        frm2['dateYear2'].value        = nowYear2;
        frm2['dateMonth2'].value    = nowMonth2;
        
        setDay2();
        /********************************************
         * 일(day)의 select를 생성하고 현재 일자로 초기화
         ********************************************/
        frm2['dateDay2'].value        = nowDay2;
    }

    /******************
     * selsect1 일(day) 셋팅
     ******************/
    function setDay() {
    
        var frm = document.getElementById("mainForm");
        
        var year = frm['dateYear'].value;
        var month = frm['dateMonth'].value;
        var day = frm['dateDay'].value;    
        var dateDay = frm['dateDay'];
        
        var arrayMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

        /*******************************************
         * 윤달 체크 부분
         * 윤달이면 2월 마지막 일자를 29일로 변경
         *******************************************/
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            arrayMonth[1] = 29;
        }

        /**************************************
         * 기존 일(day) select를 모두 삭제한다.
         **************************************/
        for( var i=dateDay.length; i>0; i--) {
            dateDay.remove(dateDay.selectedIndex);
        }
            
        /*********************************
         * 일(day) select 옵션 생성
         *********************************/
        for (var i=1; i<=arrayMonth[month-1]; i++) {
            dateDay.options[i-1] = new Option(i, i);
        }

        /*********************************************
         * 기존에 선택된 일값 유지
         * 기존 일값보다 현재 최대일값이 작을 경우
         * 현재 선택 최대일값으로 세팅
         ********************************************/
        if( day != null || day != "" ) {
            if( day > arrayMonth[month-1] ) {
                dateDay.options.selectedIndex = arrayMonth[month-1]-1;
            } else {
                dateDay.options.selectedIndex = day-1;
            }
        }
    }
    
    /******************
     * select2 일(day) 셋팅
     ******************/
    function setDay2() {
    	
        var frm2 = document.getElementById("mainForm2");
        
        var year2 = frm2['dateYear2'].value;
        var month2 = frm2['dateMonth2'].value;
        var day2 = frm2['dateDay2'].value;    
        var dateDay2 = frm2['dateDay2'];
        
        var arrayMonth2 = [31,28,31,30,31,30,31,31,30,31,30,31];

        /*******************************************
         * 윤달 체크 부분
         * 윤달이면 2월 마지막 일자를 29일로 변경
         *******************************************/
        if ((year2 % 4 == 0 && year2 % 100 != 0) || year2 % 400 == 0) {
            arrayMonth2[1] = 29;
        }

        /**************************************
         * 기존 일(day) select를 모두 삭제한다.
         **************************************/
        for( var i=dateDay2.length; i>0; i--) {
            dateDay2.remove(dateDay2.selectedIndex);
        }
            
        /*********************************
         * 일(day) select 옵션 생성
         *********************************/
        for (var i=1; i<=arrayMonth2[month2-1]; i++) {
            dateDay2.options[i-1] = new Option(i, i);
        }

        /*********************************************
         * 기존에 선택된 일값 유지
         * 기존 일값보다 현재 최대일값이 작을 경우
         * 현재 선택 최대일값으로 세팅
         ********************************************/
        if( day2 != null || day2 != "" ) {
            if( day2 > arrayMonth2[month2-1] ) {
                dateDay2.options.selectedIndex = arrayMonth2[month2-1]-1;
            } else {
                dateDay2.options.selectedIndex = day2-1;
            }
        }
    }
</script>

<script type="text/javascript">



</script>
</head>
<body>
	<jsp:include page="/inc/top.jsp" />
	<div class="page-title"
		style="background-image: url(images/page-title.png);">
		<h1>Order</h1>
	</div>
	<section id="portfolio">
		<div class="center" style="padding: 0; margin: 0;">
			<h2>주문내역</h2>
		</div>
		<div class="container" style="margin-top: -50px;">
			<div class="o_info o_input" style="font-size: 12pt;">
				<h2>구매기간 <input type="button" value="1개월" onclick="listSearch(1)"><input type="button" value="3개월" onclick="listSearch(3)"><input type="button" value="6개월" onclick="listSearch(6)"></h2><br>

				<form name="mainForm" id="mainForm" method="post">
				    <select name="dateYear" id="selYear1" class="loginInput" onChange="setDay()"></select>년&nbsp;
				    <select name="dateMonth" id="selMonth1" class="loginInput" onChange="setDay()"></select>월&nbsp;
				    <select name="dateDay" id="selDay1" class="loginInput"></select>일&nbsp;&nbsp;~&nbsp;&nbsp;

				</form>
	
				<form name="mainForm2" id="mainForm2" method="post">
				    <select name="dateYear2" id="selYear2" class="loginInput" onChange="setDay2()"></select>년&nbsp;
				    <select name="dateMonth2" id="selMonth2" class="loginInput" onChange="setDay2()"></select>월&nbsp;
				    <select name="dateDay2" id="selDay2"class="loginInput"></select>일&nbsp;

				</form>
				<input type="button" value="조회" onclick="listSearch(0)">
			</div>
			
			<div class="o_list" style="clear: both;">
				<h2>주문내역</h2>
				<table class="ot_list">
					<tr>
						<th>주문번호</th>
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>합계</th>
					</tr>				
					<c:forEach var="list" items="${list }">
						<tr>
							<td><a href="orderListDetail.or">${list.o_status }<br>상세보기</a></td>
							<td>이미지</td>
							<td>${list.o_p_name }</td>
							<td>${list.o_p_amount }</td>
							<td>${list.o_sum_money }</td>
						</tr>				
					</c:forEach>
				</table>
			</div>
	</div>
	

	</section>



	<jsp:include page="/inc/bottom.jsp" />
	<!--/#footer-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
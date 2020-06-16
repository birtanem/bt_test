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
<link href="css/product_modal.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/icomoon.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link href="css/order.css" rel="stylesheet">

<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="/inc/top.jsp" />


	<div class="page-title"
		style="background-image: url(images/page-title.png)">
		<h1>Product</h1>
	</div>

	<section id="portfolio">
		<div class="center">
			<h2>주문/결제</h2>
			<p class="lead">주문목록~</p>
		</div>
		<div class="container">
			<div class="o_info">
				<h2>주문자정보</h2>
				<table class="ot_info">
					<tr>
						<th>주문자명</th>
						<td><input type="text" name="o_name" value="${param.name }"
							class="input"></td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td><input type="text" name="o_phone" value="${param.phone }"
							class="input"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="o_name" value="${param.email }"
							class="input"></td>
					</tr>
				</table>
			</div>
			<div class="o_list">
				<h2>배송상품</h2>
				<table class="ot_list">
					<tr>
						<th>상품정보</th>
						<th>가격</th>
						<th>수량</th>
						<th>구매가</th>
					</tr>
					<tr>
						<td>
							<div>
								<img src="" alt="">
							</div>
							<div>
								<span>상품명</span> <span>상품카테고리</span> <span>지역</span>
							</div>
						</td>
						<td><span><span>10</span>원</span></td>
						<td>1</td>
						<td>1000</td>
					</tr>
				</table>
			</div>
			<div class="o_pay">
				<table>
					<tr>
						<td><input type="radio" name="payMethod" value="1">신용카드</td>
						<td><input type="radio" name="payMethod" value="2">계좌이체</td>
						<td><input type="radio" name="payMethod" value="3">무통장입금</td>
						<td><input type="radio" name="payMethod" value="4">휴대폰결제</td>
					</tr>
					<tr>
						<td><input type="radio" name="payMethod" value="5">문화상품권</td>
						<td><input type="radio" name="payMethod" value="6">도서상품권</td>
						<td><input type="radio" name="payMethod" value="7">PAYCO</td>
						<td><input type="radio" name="payMethod" value="8">카카오페이</td>
					</tr>
				</table>
				<div>
					<!-- 신용카드 선택시 -->
					<table class="pm_t_card">
						<tr>
							<th>카드종류</th>
							<td><select id="pm_card" name="pm_card">
									<option value="">카드를 선택해주세요.</option>
									<option value="BCC">BC카드</option>
									<option value="HNB">하나비자</option>
									<option value="PHB">우리카드</option>
									<option value="SYH">신협카드</option>
									<option value="NFF">수협카드</option>
									<option value="CBB">전북카드</option>
									<option value="CIT">씨티카드</option>
									<option value="WIN">삼성카드</option>
									<option value="LGC">신한카드</option>
									<option value="KJB">광주비자</option>
									<option value="CJB">제주카드</option>
									<option value="DIN">현대카드</option>
									<option value="AMX">롯데카드</option>
									<option value="CNB">KB카드</option>
									<option value="NLC">NH카드</option>
									<option value="KEB">외환카드</option>
							</select></td>
						</tr>
						<tr>
							<th>할부종류</th>
							<td><select id="pm_card_mt" name="pm_card">
									<option value="00">일시불</option>
									<option value="01">3개월</option>
									<option value="02">6개월</option>
									<option value="03">12개월</option>
							</select></td>
						</tr>
					</table>

					<!-- 계좌이체 선택시 -->
					<table class="pm_t_at">
						<tr>
							<th>결제안내</th>
							<td><ul>
									<li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
									<li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
								</ul></td>
					</table>

					<!-- 무통장입금 선택시 -->
					<%
						Calendar cal = Calendar.getInstance();
						cal.add(Calendar.DATE, +7);
						Date calDate = cal.getTime();
					%>
					<c:set var="addDate">
						<fmt:formatDate value="<%=calDate%>" pattern="yyyy.MM.dd" />
					</c:set>
					<table class="pm_t_dps">
						<tr>
							<th>은행명</th>
							<td><select id="pm_depositBank" name="pm_depositBank">
									<option value="003">기업</option>
									<option value="004">국민</option>
									<option value="007">수협</option>
									<option value="011">농협</option>
									<option value="020">우리</option>
									<option value="031">대구</option>
									<option value="032">부산</option>
									<option value="039">경남</option>
									<option value="081">하나</option>
									<option value="088">신한</option>
							</select></td>
						</tr>
						<tr>
							<th>입금기한</th>
							<td>${addDate}</td>
						</tr>
						<tr>
							<th>입금자명</th>
							<td><input type="text" value="${param.name }" class="input"></td>
						<tr>
							<td><ul>
									<li>은행별로 입금가능 시간이 다를 수 있습니다.</li>
									<li>주문일 기준 다음날(24시간 이내)까지 입금이 되지 않으면 주문취소 처리 됩니다.</li>
								</ul></td>
						</tr>
					</table>
					<!-- 					휴대폰 결제 선택 -->
					<table class="pm_t_ph">
						<tr>
							<th>결제안내</th>
							<td><ul>
									<li>휴대폰 결제는 50만원까지 결제가 가능합니다.</li>
									<li>한도문의는 모빌리언스(1600-0523), 다날(1566-3355)로 문의주시기 바랍니다.</li>
								</ul></td>
						</tr>
					</table>
					<!-- 					문화상품권 선택시  -->
					<table class="pm_t_cul">
						<tr>
							<td><span><h3>보유하신 컬쳐캐쉬(문화상품권) 내역 조회 후 사용이
										가능합니다.</h3></span> <input type="button" value="조회" class="btn"></td>
						</tr>
						<tr>
							<td>
								<ul>
									<li>문화상품권을 컬쳐캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>컬쳐캐쉬 충전 및 사용내역, 현금영수증은 컬쳐랜드 홈페이지에서 확인하실 수 있습니다.</li>
									<li>컬쳐캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</td>
						</tr>
					</table>
					<!-- 					도서상품권 선택시  -->
					<table class="pm_t_book">
						<tr>
							<td><span><h3>보유하신 북앤라이프 캐쉬(도서상품권) 내역 조회 후 사용이
										가능합니다.</h3></span> <input type="button" value="조회" class="btn"></td>
						</tr>
						<tr>
							<td>
								<ul>
									<li>도서상품권을 북앤라이프 캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬 충전 및 사용내역은 북앤라이프 홈페이지에서 확인하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</td>
						</tr>
					</table>
					<!-- 					PAYCO 선택시 -->
					<table class="pm_t_payco">
						<tr>
							<td><ul>
									<li>PAYCO는 NHN엔터테인먼트에서 제공하는 안전한 간편결제 서비스로 withTrip에서는 신용카드 결제가 가능합니다.</li>
									<li>신용카드 등록 시 휴대폰과 카드명의자가 동일해야합니다. (모든 신용/체크카드 가능)</li>
									<li>무이자할부는 PAYCO 결제창에서 확인하실 수 있습니다.</li>
								</ul></td>
						</tr>
					</table>
					<!-- 					카카오페이 선택시 -->
					<table class="pm_t_kakao">
						<tr>
							<td><ul>
									<li>카카오페이는 주식회사 카카오페이에서 제공하는 안전한 간편결제 서비스로 withTrip에서는 신용카드 결제가 가능합니다.</li>
									<li>무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다.</li>
									<li>휴대폰과 카드명의자가 동일해야 결제 가능합니다.</li>
									<li>결제 증빙내역은 카카오페이 홈페이지에서 확인 가능합니다.(카카오페이 홈 > 설정 > 결제내역)</li>
									<li>카카오페이 고객센터 : 1644-7405</li>
								</ul></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="right">
			<h2>최종 결제정보</h2>
			<ul class="total_pmBox">
			<li><span class="total_t">총 상품금액</span>
			<span class="total_tn">6000원</span></li>
			<li><span class="total_t">할인금액</span>
			<span class="total_tn">5000원</span></li>
			<li class="total"><span class="total_t">최종 결제금액</span>
			<span class="total_tn">10000원</span></li>
			<li><input type="button" class="btn" value="결제하기"></li>
			</ul>
			</div>


		</div>
	</section>




	<!--/#footer-->
	<script src="js/product_modal.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
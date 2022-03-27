<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<%@ include file="../layout/head_tags.jsp"%>



<title>오늘의 짐</title>

<!-- ajax -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<!-- axios -->
<!-- <script src="./node_modules/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
<!-- 다음 주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<style>
.checkout-form .checkout-title {
	font-weight: 400;
	margin-bottom: 50px;
}

.checkout-form input[type=text], .checkout-form input[type=email],
	.checkout-form input[type=password], .checkout-form select {
	width: 100%;
	border: none;
	background: #ebebeb;
	font-size: 14px;
	height: 52px;
	margin-bottom: 25px;
	color: #414141;
	padding: 5px 20px;
}

.order-card {
	margin-top: 30px;
	background: #ebebeb;
	padding: 34px 40px;
	border: 2px solid #f4f2f8;
}

.order-card .btn-full {
	width: 100%;
	font-size: 16px;
	background: #b09d81;
	padding: 20px 30px;
	margin-top: 32px;
}

.order-details {
	padding: 38px 19px 24px;
	background: #fff;
}

.od-warp {
	padding: 0 26px;
}

.order-table {
	width: 100%;
}

.order-table th {
	font-size: 14px;
	font-weight: 400;
	color: #414141;
}

.order-table td {
	font-size: 14px;
	color: #7e7e7e;
}

.order-table thead th {
	padding-bottom: 40px;
}

.order-table tbody td {
	padding-bottom: 40px;
}

.site-btn {
	display: inline-block;
	text-align: center;
	font-size: 14px;
	color: #fff;
	padding: 12px 30px;
	min-width: 138px;
	font-weight: 500;
	border: none;
	background: #414141;
	cursor: pointer;
	line-height: normal;
	-webkit-transition: all 0.3s ease 0s;
	-o-transition: all 0.3s ease 0s;
	transition: all 0.3s ease 0s;
}

.checkout-form {
	margin-top: 100px;
	background-color: grey;
	padding: 50px;
}
</style>
</head>


<body>
	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="fa fa-close"></i>
		</div>

		<nav class="canvas-menu mobile-menu">
			<!-- 메뉴 바  -->
			<%@ include file="../layout/menu_bar.jsp"%>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<c:choose>
				<c:when test="${empty principal}">
									<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
									</span>
									<span class="signUp" style="color: white; margin-right:20px"> 
										<a href="${pageContext.request.contextPath}/common/signup"> 
											<i class="fa fa-user-plus">Sign Up</i>
										</a>
									</span>
				</c:when>
				<c:otherwise>
									<span class="userinfo" style="color:white">
											<a href="${pageContext.request.contextPath}/user/memberInfo">
												<i class="fa fa-user-secret">UserInfo</i>
											</a>
									</span>
									<span class="logout" style="color:white; margin-right:20px">
											<a href="/logout">
												<i class="fa fa-sign-out">Log Out</i>
											</a>
									</span>																			
										<a class="nav-link">${principal.user.memail}</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo"  style="margin-top:-60px">
						<a href="${pageContext.request.contextPath}/today">  <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<!-- 메뉴 바  -->
						<%@ include file="../layout/menu_bar.jsp"%>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">

						<div class="to-social">
							<c:choose>
								<c:when test="${empty principal}">
									<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
									</span>
									<span class="signUp" style="color: white; margin-right:20px"> 
										<a href="${pageContext.request.contextPath}/common/signup"> 
											<i class="fa fa-user-plus">Sign Up</i>
										</a>
									</span>
								</c:when>
								<c:otherwise>
									<span class="userinfo" style="color:white">
											<a href="${pageContext.request.contextPath}/user/memberInfo">
												<i class="fa fa-user-secret">UserInfo</i>
											</a>
									</span>
									<span class="logout" style="color:white; margin-right:20px">
											<a href="/logout">
												<i class="fa fa-sign-out">Log Out</i>
											</a>
									</span>																			
										<a class="nav-link">${principal.user.memail}</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="canvas-open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Classes Section Begin -->
	<section class="classes-section spad">
		<!-- 결제페이지 시작 -->
		<div class="page-area checkout-page spad">
			<div class="container">
				<form class="checkout-form">
					<div class="row">
						<div class="col-lg-6">
							<h4 class="checkout-title">주문정보입력</h4>
							<div class="row">
								<div class="col-md-8 mb-2">

								
									<input type="text" placeholder="이름을 입력해주세요" id="buyer_name">
									 <input	type="text" placeholder="핸드폰번호" id="buyer_tel"> 
									 <input type="email"  placeholder="이메일주소" id="buyer_email">
									 <input type="date" id="startDate" >
								</div>
								<div class="col-md-8">
									<div class="form-group">
										<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
										<button type="button" class="btn btn-default" onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" />
									</div>
								



								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="order-card">
								<div class="order-details">
									<div class="od-warp">
										<h4 class="checkout-title">구매할 이용권</h4>
										<table class="order-table">
											<thead>
												<tr>
													<th>이용권</th>
													<th>수량(개월)</th>
													<th>가격</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${checklist}" var="check">
													<tr>
														<td>${check.tname}</td>
														<td class="wdate">${check.wdate}</td>
														<td class="price">${check.tcost}</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr class="order-total">
													<th colspan="2">Total</th>
													<th class="totalprice"></th>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<button id="payment_mudule" class="site-btn btn-full" type="button">결제하기</button>
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 결제페이지끝 -->
	</section>
	<!-- ChoseUs Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->
	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>


	<script>
		$(document).ready(
				function() {
					let arr = $(".price").length;

					console.log(arr);

					let arr2 = new Array(arr);

					let sum = 0;

					for (let i = 0; i < arr; i++) {
						arr2[i] = Number($(".price").eq(i).text());
						console.log(i + "번째 텍스트" + arr2[i]);
						sum += arr2[i] * Number($(".wdate").eq(i).text());
						$(".price").eq(i).text(
								arr2[i] * Number($(".wdate").eq(i).text()));
					}
					console.log(sum);

					$(".totalprice").text(sum);

				});//ready끝

		$('#startDate').change(function() {
			var date = $('#startDate').val();
			console.log(date);
		});

		//출처: https:
		//minaminaworld.tistory.com/13 [미나미 블로그]

		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=addr1]").val(data.zonecode);
					$("[name=addr2]").val(fullRoadAddr);

					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
					document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
		}
	</script>
	
	<script>
	
	
            $("#payment_mudule").click(function () {
                
            	var bName = $('#buyer_name').val();
            	var bTel = $('#buyer_tel').val();
            	var bEmail =$('#buyer_email').val(); 
            	var adr = $('#addr2').val()+$('#addr3').val();
            	var post = $('#addr1').val(); 
            	var mnum = ${principal.user.mnum};
            	var totalamount =100;/*  parseInt($(".totalprice").text(), 10); */
            	var startDate = $("#startDate").val();
            	
            	console.log("시작 날짜..."+startDate);
            	
            	var IMP = window.IMP; // 생략가능
            	IMP.init('imp01979841');// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용 i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
            	
                IMP.request_pay({
                    //pg: 'inicis', // version 1.1.0부터 지원.                 
				    pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '오늘의짐 이용권',
				    amount :  totalamount,
				    buyer_email : bEmail,//'test@test',
				    buyer_name : bName,//'송인규',
				    buyer_tel : bTel,//'010-1234-3124',
				    buyer_addr : adr,
				    buyer_postcode : post
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        console.log(msg);
				        alert(rsp.paid_amount + "원 결제 완료");
				     
				        
			        	$.ajax({
				        	url:"/completePay",
				        	type:'POST',
				        	/* ContentType:"application/json; charset=utf-8", */
				        	dataType: 'json',
				        	data:{
				        		merchantid: rsp.merchant_uid,
	                            impid : rsp.imp_uid,
	                            mnum: mnum,
	                         	paidamount : rsp.paid_amount,
	                         	startDate : startDate
				        	} /* JSON.stringify(data) */
				        	
				        }).done(function(result){
				        	console.log("페이지이동함?-1")
				        			        	
				        	if(result.successPayment){
				        		console.log("페이지이동함?-2")
				        		location.href = "/user/complete"
				        	}else{
				        		 var msg = '결제에 실패하였습니다.';
							        msg += '에러내용 : ' + rsp.error_msg;
							        alert(msg);
				        	}
				        })
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        alert(msg);
				    }})
				});
        </script>
	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->
	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>
</body>

</html>
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
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
				<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
				<sec:authorize access="hasRole('USER')">
					<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
					<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
				</sec:authorize>
				<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
				<sec:authorize access="hasRole('ADMIN')">
				</sec:authorize>
			</ul>
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
					<div class="logo">
						<a href="${pageContext.request.contextPath}/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="500">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
							<li><a href="${pageContext.request.contextPath}/common/gymlist">시설찾기</a></li>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
							<sec:authorize access="hasRole('ADMIN')">
							</sec:authorize>
						</ul>
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
									<input type="text" placeholder="이름을 입력해주세요"> <input type="text" placeholder="핸드폰번호"> <input type="email" placeholder="이메일주소"> <input type="date" id="startDate">
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
								<button class="site-btn btn-full">결제하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 결제페이지끝 -->
	</section>
	<!-- ChoseUs Section End -->

	<!-- Get In Touch Section Begin -->
	<div class="gettouch-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="gt-text">
						<i class="fa fa-map-marker"></i>
						<p>
							333 Middle Winchendon Rd, Rindge,<br /> NH 03461
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="gt-text">
						<i class="fa fa-mobile"></i>
						<ul>
							<li>125-711-811</li>
							<li>125-668-886</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="gt-text email">
						<i class="fa fa-envelope"></i>
						<p>Support.gymcenter@gmail.com</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Get In Touch Section End -->

	<!-- Footer Section Begin -->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="fs-about">
						<div class="fa-logo">
							<a href="${pageContext.request.contextPath}/today"><img src="img/logo.png" alt=""></a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua endisse ultrices gravida lorem.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a
								href="#"><i class="fa  fa-envelope-o"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>Useful links</h4>
						<ul>
							<li><a href="#">About</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Classes</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>Support</h4>
						<ul>
							<li><a href="#">Login</a></li>
							<li><a href="#">My account</a></li>
							<li><a href="#">Subscribe</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="fs-widget">
						<h4>Tips & Guides</h4>
						<div class="fw-recent">
							<h6>
								<a href="#">Physical fitness may help prevent depression, anxiety</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">Fitness: The best exercise to lose belly fat and tone up...</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="copyright-text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

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

		출처: https:
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

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>
</body>

</html>
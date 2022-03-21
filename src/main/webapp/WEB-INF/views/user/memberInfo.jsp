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



<title>마이페이지</title>

<<<<<<< HEAD
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
>>>>>>> 44c3f050df83ab8f9b078ff5e96e8d90ea7b9370
=======

>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#updateMemberinfo")
								.submit(
										function(event) {

											event.preventDefault();

											var mid = $("#mid").val();
											var mnickname = $("#mnickname")
													.val();
											var mphone = $("#mphone").val();

											console.log($(this).attr("action"));

											var form = {
												mid : mid,
												mnickname : mnickname,
												mphone : mphone
											};

											console.log(JSON.stringify(form));

											$
													.ajax({
														type : "PUT",
														url : $(this).attr(
																"action"),
														cache : false,
														contentType : 'application/json; charset=utf-8',
														data : JSON
																.stringify(form),
														success : function(
																result) {
															if (result == "SUCCESS") {
																alert("회원 정보를 수정했습니다!")
																$(location)
																		.attr(
																				'href',
																				'${pageContext.request.contextPath}/user/memberInfo');
															}
														},
														error : function(e) {
															console.log(e);
														}
													})

										}); // end submit()

					}); // end ready()
</script>
</head>

<body>
	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="fa fa-close"></i>
		</div>

		<nav class="canvas-menu mobile-menu">
<<<<<<< HEAD
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
=======
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
							<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
							<li><a href="${pageContext.request.contextPath}/common/faqBoard">FAQ</a></li>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
							</sec:authorize>
						</ul>
<<<<<<< HEAD
>>>>>>> dev_okh_jsp
=======

>>>>>>> refs/remotes/origin/dev_okh_jsp
>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<c:choose>
				<c:when test="${empty principal}">
					<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
					</span>
					<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
					</a>
					</span>
				</c:when>
				<c:otherwise>
					<span class="userinfo" style="color: white"> <a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
					</a>
					</span>
					<span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
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
<<<<<<< HEAD

<<<<<<< HEAD

=======
=======
r
>>>>>>> refs/remotes/origin/dev_okh_jsp
>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
							<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
							<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
							<li><a href="${pageContext.request.contextPath}/common/faqBoard">FAQ</a></li>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
							</sec:authorize>
<<<<<<< HEAD
=======

>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
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
									<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
									</a>
									</span>

								</c:when>
								<c:otherwise>
									<span class="userinfo" style="color: white"> 
									<a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
									</a>
									</span>
									<span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
									</a>
									</span>
<<<<<<< HEAD
									<a class="nav-link" style="color:white">${principal.user.memail}</a>
=======
									<a class="nav-link">${principal.user.memail}</a>

>>>>>>> refs/remotes/origin/dev_okh_jsp
								</c:otherwise>
							</c:choose>
						</div>
<<<<<<< HEAD
=======

>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579
					</div>
				</div>
			</div>
			<div class="canvas-open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header End -->



	<!-- ChoseUs Section End -->

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-4">
					<ul>
						<li><a href="${pageContext.request.contextPath}/user/memberInfo">내 정보</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myTicket">내 이용권</a></li>
						<li><a href="${pageContext.request.contextPath}/user/note">쪽지</a></li>
						<li><a href="${pageContext.request.contextPath}/common/faqBoard">FAQ</a></li>
						<li><a href="${pageContext.request.contextPath}/user/helpBoard">1:1문의</a></li>
						<li><a href="${pageContext.request.contextPath}/user/noticeBoard">공지/이벤트</a></li>
						<li><a href="${pageContext.request.contextPath}/user/registerGym">시설 등록 신청</a></li>
						<sec:authorize access="hasRole('USER')">
							<li><a href="${pageContext.request.contextPath}/owner/manageGym">시설 등록 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/owner/manageTrainer">트레이너 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/owner/gymMemberList">회원 목록 보기</a></li>
							<li><a href="${pageContext.request.contextPath}/owner/totalSales_gym">매출 관리</a></li>
						</sec:authorize>
					</ul>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-8">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div>
						<h2 style="color: white;">회원 정보</h2>
						<form class="text-white" id="updateMemberinfo" action="${pageContext.request.contextPath}/user/memberInfo">
							<input type="hidden" id="mid" name="mid" value="${memberInfoList.mid}">
							<p>
								<label for="memail">Emial:</label> <input type="text" value="${memberInfoList.memail}" disabled />
							</p>

							<p>
								닉네임 <input type="text" id="mnickname" name="mnickname" value="${memberInfoList.mnickname}" />
							</p>

							<p>
								연락처 <input type="text" id="mphone" name="mphone" value="${memberInfoList.mphone}" />
							</p>
							<div class="form-group">
								<label for="mbirth">생년월일:</label> <input type="text" value="${principal.user.mbirth}" class="form-control" placeholder="Enter birthday" id="mbirth">
							</div>
							<input class="btn btn-primary m-2" type="submit" value="수정하기"> <a class="btn btn-primary " href="/user/memberLeave">회원 탈퇴하기</a>
							<c:choose>
								<c:when test="${principal.user.social==0}">
									<a href="/user/updatePassword" class="btn btn-primary">비밀번호 변경</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>

<<<<<<< HEAD
=======

						</form>
>>>>>>> refs/remotes/origin/dev_okh_jsp

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 마이페이지 내용물 끝 -->





	<!-- Get In Touch Section Begin -->
	<div>
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
								<a href="#"><img src="/img/logo.png" alt=""></a>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua endisse ultrices gravida lorem.</p>
							<div class="fa-social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
								<a href="#"><i class="fa  fa-envelope-o"></i></a>
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
	</div>


	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>


</body>

</html>

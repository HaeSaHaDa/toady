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


<title>헬스장 목록</title>
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
					<div class="logo">
						<a href="${pageContext.request.contextPath}/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="500">
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
	<!-- ChoseUs Section End -->
<!--마이페이지 내용물 시작-->
<section class="classes-section spad">
	<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 -->
			<div class="col-4">
			<!-- 메뉴 바  -->
			<%@ include file="../layout/adminmenu.jsp"%>
			</div>
			<!-- 사이드바 끝 -->
			<!-- 내용물 -->
			<div class="col-8">
				<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
				<div>
					<!-- 시설목록-->
					<section class="classes-section spad">
						<div class="container text-center" style="margin-top: 100px; margin-bottom: 80px;">
							<h1 style="color: white;">관리자가 보는 헬스장 리스트</h1>
						</div>
						<div class="container">
							<div class="row"></div>
						</div>
					</section>
					<!-- 시설목록끝 -->


					<div class="container-wrapper">
						<div class="container">
							<h2>
								<a href="<c:url value="/admin/gymListInventory"/>">헬스장 리스트</a>
							</h2>
							<p>헬스장을 추가하거나 관리해보세요.</p>
						</div>

						<div class="container">
							<h2>
								<a href="<c:url value="/admin/memberList"/>">회원 리스트</a>
							</h2>
							<p>회원의 정보를 수정하거나 관리해보세요.</p>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- 마이페이지 내용물 끝 -->














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
							<a href="#"><img src="img/logo.png" alt=""></a>
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

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>




</body>

</html>

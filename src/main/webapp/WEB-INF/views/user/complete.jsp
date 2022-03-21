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

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="<c:url value ="css/main.css"/>" type="text/css">

<!--Script ajax,icon -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/3f2fcd4ff5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<title>마이페이지</title>

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
				<sec:authorize access="hasRole('USER')">
					<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
				</sec:authorize>
			</ul>
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
						<li><a href="${pageContext.request.contextPath}/user/faqBoard">FAQ</a></li>
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
				
				<h1 style="color:white ">결제 완료</h1>
				<button><a href="/today">홈으로</button>
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
	   <!-- Login model Begin -->
   <div class="search-model">
      <div class="h-100 d-flex align-items-center justify-content-center">
         <div class="search-close-switch">+</div>
         <div class="container" style="width: 50%">
            <form action="/common/loginProc" method="post">
               <div class="form-group">
                  <label for="mid" style="color: white">Username:</label> <input type="text" name="mid" class="form-control" placeholder="Enter Username" id="mid">
               </div>
               <div class="form-group">
                  <label for="mpassword" style="color: white">Password:</label> <input type="password" name="mpassword" class="form-control" placeholder="Enter password" id="mpassword">
               </div>

               <button id="btn-login" class="btn btn-dark" style="color: white">Log-In</button>
               <a href="/oauth2/authorization/kakao"> <img height="38px" src="/img/kakao_login_button3.png" /></a> <a href="/oauth2/authorization/google"><img height="38px"
                  src="/img/google_login_button2.png"></a> <a href="/oauth2/authorization/naver"><img height="38px" src="/img/naver_login_button.png"></a>
            </form>

         </div>
      </div>
   </div>
   <!-- Login model end -->
	<!-- Login model end -->
	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
   <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
   <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/main.js"></script>


</body>

</html>
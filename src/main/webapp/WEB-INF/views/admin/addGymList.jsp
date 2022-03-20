<!-- spring web form 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<style type="text/css">
</style>


<title>Admin-시설추가Page</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/barfiller.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>


<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="fa fa-close"></i>
		</div>
		<div class="canvas-search search-switch">
			<i class="fa fa-search"></i>
		</div>
		<nav class="canvas-menu mobile-menu">
			<ul>

				<li class="active"><a
					href="${pageContext.request.contextPath}/today">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/services.html">mypage</a></li>
				<li><a href="${pageContext.request.contextPath}/team.html">찜</a></li>
				<li><a href="${pageContext.request.contextPath}/findMap">지도</a></li>
				<li><a href="${pageContext.request.contextPath}/gymlist">시설찾기</a></li>


			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-youtube-play"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo">
						<a href="index"> <img
							src="${pageContext.request.contextPath}/img/logo.png" alt=""
							width="500"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li class="active"><a
								href="${pageContext.request.contextPath}/today">Home</a></li>
							<li><a
								href="${pageContext.request.contextPath}/services.html">mypage</a></li>
							<li><a href="${pageContext.request.contextPath}/team.html">찜</a></li>
							<li><a href="${pageContext.request.contextPath}/findMap">지도</a></li>
							<li><a href="${pageContext.request.contextPath}/gymlist">시설찾기</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">
						<div class="to-search search-switch">
							<i class="fa fa-search"></i>
						</div>
						<div class="to-social">
							<a href="#">로그인</a> <a href="#">회원가입</a>

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

	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<p class="lead">시설을 추가해주세요.</p>
				<sf:form
					action="${pageContext.request.contextPath}/admin/gymListInventory/addGymList"
					method="post" modelAttribute="gymListVO" enctype="multipart/form-data">
					<!-- post method 처리하는 것 controller만들어줘야함. -->
					<!-- modelAttribute="gymListVO"의 input path ="여러가지들 이름 맞춰줘야함" -->
					<div class="form group">
						<label for="mnum">회원 번호 </label>
						<sf:input path="mnum" id="mnum" class="form-control" />
						<sf:errors path="mnum" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gname">이름</label>
						<sf:input path="gname" id="gname" class="form-control" />
						<sf:errors path="gname" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gcategory">분류:</label><br />
						<sf:radiobutton path="gcategory" id="gcategory" value="헬스장" />
						헬스장 <br />
						<sf:radiobutton path="gcategory" id="gcategory" value="요가" />
						요가 <br />
						<sf:radiobutton path="gcategory" id="gcategory" value="필라테스" />
						필라테스 <br />
					</div>

					<div class="form group">
						<label for="gadress">주소</label>
						<sf:input path="gadress" id="gadress" class="form-control" />
						<sf:errors path="gadress" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gphone">전화번호</label>
						<sf:input path="gphone" id="gphone" class="form-control" />
						<sf:errors path="gphone" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="ginform">정보</label>
						<sf:input path="ginform" id="ginform" class="form-control" />
						<sf:errors path="ginform" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gtime">운영시간</label>
						<sf:input path="gtime" id="gtime" class="form-control" />
						<sf:errors path="gtime" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gfacility">편의시설</label>
						<sf:input path="gfacility" id="gfacility" class="form-control" />
						<sf:errors path="gfacility" cssStyle="color:#ff0000" />
					</div>



					<div class="form group">
						<label for="gsns">SNS</label>
						<sf:input path="gsns" id="gsns" class="form-control" />
						<sf:errors path="gsns" cssStyle="color:#ff0000" />
					</div>

					<div class="form group">
						<label for="gymimage">Upload Picture</label>
						<sf:input path="gymimage" id="gymimage" name="gymimage"
							type="file" class="form-control" />
					</div>

					<br />
					<button type="submit" class="btn btn-primary">submit</button>
					<a href="<c:url value="/admin/gymListInventory"/> "
						class="btn btn-dark">Cancle</a>
				</sf:form>
				<br />
			</div>
		</div>
		<br />
	</section>

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
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua
							endisse ultrices gravida lorem.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa  fa-envelope-o"></i></a>
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
								<a href="#">Physical fitness may help prevent depression,
									anxiety</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">Fitness: The best exercise to lose belly fat and
									tone up...</a>
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
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
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

	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>




</body>

</html>
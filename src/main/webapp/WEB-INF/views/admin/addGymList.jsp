<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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

<title>Admin-시설추가Page</title>

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
					<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
					</a>
					</span>


				</c:when>
				<c:otherwise>
					<form:form action="${pageContext.request.contextPath}/user/memberInf">
						<button style="background-color: transparent; border: 0; outline: 0">
							<i class="fa fa-user-secret">UserInfo</i>
						</button>
					</form:form>
					<form:form action="/logout">
						<button style="background-color: transparent; border: 0; outline: 0" url="">
							<i class="fa fa-sign-out">Log Out</i>
						</button>
					</form:form>

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
					<div class="logo" style="margin-top: -60px">
						<a href="${pageContext.request.contextPath}/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
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

						<div class="to-social" style="margin-left: -20px">
							<c:choose>
								<c:when test="${empty principal}">
									<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
									</span>
									<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
									</a>
									</span>

								</c:when>
								<c:otherwise>
									<table>
										<tr>
											<td>
											<form:form action="${pageContext.request.contextPath}/user/memberInf">
											<span class="userinfo" style="color: white; margin-right: 20px"> 
														<button style="background-color: transparent; border: 0; outline: 0;">
															<i class="fa fa-user-secret">UserInfo</i>
														</button>
													</span>
													</form:form>
											</td>

											<td><span class="logout" style="color: white; "> <form:form action="/logout">
														<button style="background-color: transparent; border: 0; outline: 0" url="">
															<i class="fa fa-sign-out">Log Out</i>
														</button>
													</form:form>
											</span></td>
										</tr>
									</table>
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

	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row-vh d-flex flex-row justify-content-center"><h1 style="color:white">시설을 추가해주세요.</h1></div>
			<div class="row-vh d-flex flex-row justify-content-center" style="margin-top: 50px; ">
				<br />
				<sf:form action="${pageContext.request.contextPath}/admin/gymListInventory/addGymList" method="post" modelAttribute="gymListVO" enctype="multipart/form-data" style="width:80%; color:white">
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
						<label for="gaddress">주소</label>
						<sf:input path="gaddress" id="gaddress" class="form-control" />
						<sf:errors path="gaddress" cssStyle="color:#ff0000" />
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
						<label for="gcategory">광고:</label><br />
						<sf:radiobutton path="ad" id="ad" value="0" />
						광고 없음
						<sf:radiobutton path="ad" id="ad" value="1" />
						광고 있음
						<sf:radiobutton path="ad" id="ad" value="2" />
						파워 광고
					</div>

					<div class="form group">
						<label for="gymimage">Upload Picture</label>
						<sf:input path="gymimage" id="gymimage" name="gymimage" type="file" class="form-control" />
					</div>

					<br />
					<button type="submit" class="btn btn-primary">submit</button>
					<a href="<c:url value="/admin/gymListInventory"/> " class="btn btn-dark">Cancle</a>
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
							<a href="#"><img src="/img/logo.png" alt=""></a>
						</div>
						<p>오늘의 짐은 운동을 원하는 고객을 Gym 운영자와 연결해 주는 서비스를 제공합니다.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a
								href="#"><i class="fa  fa-envelope-o"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>오늘의</h4>
						<ul>
							<li><a href="#">오금환</a></li>
							<li><a href="#">김보람</a></li>
							<li><a href="#">마성주</a></li>

						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>GYM</h4>
						<ul>
							<li><a href="#">문지윤</a></li>
							<li><a href="#">송인규</a></li>
							<li><a href="#">윤정아</a></li>			
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="fs-widget">
						<h4>Tips & Guides</h4>
						<div class="fw-recent">
							<h6>
								<a href="#">운동을 위해 시간을 내지 않는다면 병때문에 시간을 내게될지 모른다.</a>
							</h6>
							<ul>
								<li>로빈 샤머</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">우리가 늙어서 운동을 그만 두는 거싱 아니라, 우리가 운동을 그만두기 때문에 늙는 것이다. </a>
							</h6>
							<ul>
								<li>케너스 쿠퍼</li>
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
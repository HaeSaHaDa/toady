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
<style type="text/css">

.forSearch {
	height: 40px;
	width: 500px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin: 0 auto;
}

.searchInput {
	font-size: 16px;
	width: 352px;
	padding: 10px;
	border: 0px;
	float: left;
	height: 35px;
}

.searchButton {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}
</style>

<title>헬스장 목록</title>

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
											<td><form:form action="${pageContext.request.contextPath}/user/memberInf">
													<span class="userinfo" style="color: white; margin-right: 20px">
														<button style="background-color: transparent; border: 0; outline: 0;">
															<i class="fa fa-user-secret">UserInfo</i>
														</button>
													</span>
												</form:form></td>

											<td><span class="logout" style="color: white;"> <form:form action="/logout">
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
	<!-- ChoseUs Section End -->
	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-3">
					<%@ include file="../layout/adminmenu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-9">
					<h2 class="title" style="color: white">헬스장 관리 페이지입니다.</h2>
					<hr/>
					<!-- 검색바 -->
					<div class="forSearch">
						<form:form action="/admin/search" method="POST">
							<input class="searchInput" type="text" name="keyword" placeholder="검색어 입력">
							<button class="searchButton">검색</button>
						</form:form>
					</div>
					<hr/>
					<table class="table" style="width: 1000px; table-layout: fixed;" border="1" cellpadding="1" cellspacing="10" border="1">
						<thead>
							<tr class="thead-light">
								<th>gym Photo</th>
								<th>mnum</th>
								<th>gname</th>
								<th>gcategory</th>
								<th>gaddress</th>
								<th>gphone</th>

								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="gymList" items="${gymLists}">
								<tr style="width: 80%; color: white; font-weight: 700;">
									<td><img src="<c:url value="/img/${gymList.imagename}"/>" alt="image" /></td>
									<td>${gymList.mnum}</td>
									<td>${gymList.gname}</td>
									<td>${gymList.gcategory}</td>
									<td>${gymList.gaddress}</td>
									<td>${gymList.gphone}</td>

									<td><a href="<c:url value ="/admin/gymListInventory/deleteGymList/${gymList.gnum}"/>"> <i class="fa-solid fa-trash"></i></a> <a
										href="<c:url value ="/admin/gymListInventory/updateGymList/${gymList.gnum}"/>"> <i class="fas fa-edit"></i>
									</a> <a href="<c:url value="/admin/ticketList/${gymList.gnum}"/>"><i class="fa-solid fa-ticket"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="<c:url value ="/admin/gymListInventory/addGymList"/>" class="btn btn-dark"> Add Gym</a>
				</div>
			</div>
			<!-- 내용물 끝 -->
	</section>
	<!-- 마이페이지 내용물 끝 -->

	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>
</body>

</html>

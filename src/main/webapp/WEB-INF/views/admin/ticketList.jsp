<!-- spring web form 사용 -->
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
<!-- Google Font -->
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
					<h2 class="title" style="color: white">헬스장 쿠폰 리스트 입니다.</h2>
					<table class="table table-hover" style="width: 100%;">
						<thead>
							<tr class="bg-warning">
								<th>gym-num</th>
								<th>ticket - num</th>
								<th>ticket - cost</th>
								<th>ticket - name</th>

								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ticket" items="${ticketVO}">
								<tr style="width: 80%; color: white; font-weight: 700;">
									<td>${ticket.gnum}</td>
									<td>${ticket.tknum}</td>
									<td>${ticket.tcost}</td>
									<td>${ticket.tname}</td>
									<td><a href="<c:url value ="/admin/ticketList/deleteTicket/${ticket.tknum}"/>"> <i class="fa-solid fa-trash"></i></a> <a
										href="<c:url value ="/admin/ticketList/updateTicket/${ticket.gnum}"/>"> <i class="fas fa-edit"></i></a>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<a href="<c:url value ="/admin/ticketList/addTicket/${gnum}"/>"> <i class="fa-solid fa-plus"></i></a>
				</div>
			</div>
			<!-- 내용물 끝 -->
		</div>
	</section>
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
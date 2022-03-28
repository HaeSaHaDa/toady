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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css" type="text/css">

<%@ include file="../layout/head_tags.jsp"%>
<style type="text/css">
.ci-pic img {
	width: 150px;
	height: 200px;
}

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



<title>시설목록</title>

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

	<!-- 시설목록-->
	<section class="classes-section spad">
		<div class="container text-center" style="margin-top: 100px; margin-bottom: 80px;">
			<h1 style="color: white;">헬스장 리스트</h1>
		</div>
		<!-- 검색바 -->
		<div class="forSearch">
			<form:form action="/common/search" method="POST">
				<input class="searchInput" type="text" name="keyword" placeholder="검색어 입력">
				<button class="searchButton">검색</button>
			</form:form>
		</div>

		<br />
		<br />
		<div class="container">

			<div class="row">
				<c:forEach items="${gymList}" var="gym">
					<div class="col-lg-4 col-md-6">
						<div class="class-item">
							<div class="ci-pic">
								<img src="${pageContext.request.contextPath}/img/${gym.imagename}" alt="">
							</div>
							<div class="ci-text">
								<span>${gym.gcategory}</span>
								<h5>${gym.gname}</h5>
								<a href="/common/gymdetail/${gym.gnum}"><i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<nav class="pagination-outer mb-2" aria-label="Page navigation">
				<ul class="pagination justify-content-center text-center">
					<c:if test="${pageMaker.pre}">
						<li class="page-item"><a aria-label="Previous" class="page-link" href="${pageContext.request.contextPath}/common/gymLists/${gym.gnum}${pageMaker.makeQuery(pageMaker.startPage - 1) }"> <span
								aria-hidden="true">«</a></span></li>
					</c:if>

					<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
					<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/common/gymLists/${gym.gnum}${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a aria-label="Next" class="page-link" href="${pageContext.request.contextPath}/common/gymLists/${gym.gnum}${pageMaker.makeQuery(pageMaker.endPage + 1)}"> <span
								aria-hidden="true">»</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>
	<!-- 시설목록끝 -->
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

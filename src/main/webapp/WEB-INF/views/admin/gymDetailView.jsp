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
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<%@ include file="../layout/head_tags.jsp"%>


<title>Insert title here</title>
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
							<li><a href="${pageContext.request.contextPath}/common/gymlist">시설찾기</a></li>
							<li><a href="${pageContext.request.contextPath}/common/faqBoard">FAQ</a></li>
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
							<li><a href="${pageContext.request.contextPath}/common/faqBoard">FAQ</a></li>
							<sec:authorize access="hasAnyRole('USER','BUSINESS','ADMIN')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('USER','BUSINESS','ADMIN')">
								<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
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
	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-4">
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/manageMember">회원 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/ownerList">헬스장 사장님 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/gymListInventory">헬스장 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/registerGym">헬스장 신청서 목록</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/gymOrderList">찜 결제 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/faqpage">FAQ 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/helpList">1:1 답변 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/notePost">공지/이벤트 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/totalSales">매출 관리</a></li>
					</ul>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-8">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div>
					
					
					
					
					
					
					
					
					
					</div>
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
				</div>


			</div>
		</div>
	</section>
	<!-- 마이페이지 내용물 끝 -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->
	<%@ include file="../layout/foot_tags.jsp"%>
	
</body>
</html>
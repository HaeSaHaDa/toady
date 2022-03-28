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
<script>
	$(document).ready(function() {
		$(".deleteRegist").click(function(event){
			
			event.preventDefault();
			console.log("ajax 호출전");
			alert("");
			var trObj = $(this).parent().parent();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				data: "DELETE",
				url : $(this).attr("href"),	
				beforeSend : function(xhr) {
					xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
				},
				success : function(result){
					console.log("ajax 호출-2");
					console.log(result);
					if(result == "SUCCESS"){
						$(trObj).remove();
					}
				},
				error : function(e) {
					console.log(e);
				}
			
		});
	});
	});
	</script>


<title>Insert title here</title>
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

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-3">
					<%@ include file="../layout/adminmenu.jsp"%>

				</div>
				<!-- 사이드바 끝 -->
				<div class="col-9">
					<!-- 내용물 -->

					<table class="table" style="width: 850px; table-layout: fixed;" border="1" cellpadding="1" cellspacing="10" border="1">
						<thead class="thead-light">
							<tr>
								<th width="70">번호</th>
								<th>신청인 번호</th>
								<th>헬스장 이름</th>
								<th>헬스장 주소</th>
								<th>연락처</th>
								<th width="100">신청일</th>
								<th>취소</th>
							</tr>
						</thead>
						<c:forEach items="${registList}" var="regist">
							<tr>
								<td>${regist.mnum}</td>
								<td>${regist.storenum}</td>
								<td>${regist.storename}</td>
								<td>${regist.storeadr}</td>
								<td>${regist.storetel}</td>
								<td>${regist.storedate}</td>
								<td><a class="deleteRegist" href="/admin/deleteRegister/${regist.storenum}">삭제</a></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="7"><a href="/today">홈</a></td>
						</tr>
					</table>

					<!-- 내용물 끝 -->
				</div>
			</div>
		</div>
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
	<!-- 신청 목록 삭제 -->

</body>
</html>
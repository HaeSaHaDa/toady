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

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#updateMemberinfo")
								.submit(
										function(event) {

											event.preventDefault();
											var token = $("meta[name='_csrf']")
													.attr("content");
											var header = $(
													"meta[name='_csrf_header']")
													.attr("content");
											var mid = $("#mid").val();
											var mnickname = $("#mnickname")
													.val();
											var mphone = $("#mphone").val();
											var mbirth = $("#mbirth").val();

											console.log($(this).attr("action"));

											var form = {
												mid : mid,
												mnickname : mnickname,
												mphone : mphone,
												mbirth : mbirth
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
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"X-CSRF-Token",
																			"${_csrf.token}");
														},
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



	<!-- ChoseUs Section End -->

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-3">
					<%@ include file="../layout/user_owner_menu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-9">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div>
						<h2 style="color: white;">회원 정보</h2>
						<br/>
						<form class="text-white" id="updateMemberinfo" action="${pageContext.request.contextPath}/user/memberInfo" >
							<table>
								<input type="hidden" id="mid" name="mid" value="${memberInfoList.mid}">
								<tr>
									<td><label for="memail">Emial:</label></td>
									<td><input type="text" value="${memberInfoList.memail}" disabled /></td>
								</tr>

								<tr>
									<td><label for="nickname">닉네임</label></td>
									<td><input type="text" id="mnickname" name="mnickname" value="${memberInfoList.mnickname}" placeholder="Enter nickname" /></td>
								</tr>

								<tr>
									<td><label for="phone-number">연락처</label></td>
									<td><input type="text" id="mphone" name="mphone" value="${memberInfoList.mphone}" placeholder="Enter phonenumber" /></td>
								</tr>
								<tr>
									<td><label for="birth">생년얼일</label></td>
									<td><input type="text" id="mbirth" name="mbirth" value="${memberInfoList.mbirth}" placeholder="Enter birthday"></td>
								</tr>
							</table>
							<input class="btn btn-primary m-2" type="submit" value="수정하기"> <a class="btn btn-primary " href="/user/memberLeave">회원 탈퇴하기</a>
							<c:choose>
								<c:when test="${principal.user.social==0}">
									<a href="/user/updatePassword" class="btn btn-primary">비밀번호 변경</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>



						</form>
					</div>
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


</body>

</html>

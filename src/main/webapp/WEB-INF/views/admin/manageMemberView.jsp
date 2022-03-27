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


<title>회원 목록 상세보기 페이지</title>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#updateAuth")
								.submit(
										function(event) {

											event.preventDefault();

											var mid = $("#mid").val();
											var auth = $("#auth").val();

											console.log($(this).attr("action"));

											var form = {
												mid : mid,
												auth : auth

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
														success : function(
																result) {
															if (result == "SUCCESS") {
																//list로					
																$(location)
																		.attr(
																				'href',
																				'${pageContext.request.contextPath}/admin/manageMember');
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
					<%@ include file="../layout/adminmenu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-9">
					<!-- 내용물 시작 -->
					<div>
						<table class="table" style="width: 850px; table-layout: fixed;" border="1" cellpadding="1" cellspacing="10" border="1">
							<form id="updateAuth" action="${pageContext.request.contextPath}/admin/manageMember/${memberDetail.mid}">
								<input type="hidden" id="mid" name="mid" value="${memberDetail.mid}">

								<thead class="thead-light">
									<tr>
										<th class="text-dark" width="20%">회원번호
										</td>
										<th class="text-dark" width="20%">${memberDetail.mnum}</th>
										<th class="text-dark" width="20%">아이디</th>
										<th class="text-dark" width="40%">${memberDetail.mid}</th>
									</tr>
								<thead>

									<tr>
										<td>이메일</td>
										<td colspan="3">${memberDetail.memail}</td>
									</tr>

									<tr>
										<td>연락처</td>
										<td colspan="3">${memberDetail.mphone}</td>
									</tr>

									<tr>
										<td>생년월일</td>
										<td colspan="3">${memberDetail.mbirth}</td>
									</tr>

									<tr>
										<td>회원구분</td>
										<td colspan="3"><input type="text" id="auth" name="auth" value="${memberDetail.auth}"></td>
									</tr>



									<tr class="table-light">
										<td colspan="3"><input type="submit" value="수정하기"> &nbsp;&nbsp;
										<td><a href="/admin/notePost/${memberDetail.mnum}">쪽지보내기</a></td>
									</tr>
							</form>
						</table>
						<c:choose>
							<c:when test="${empty myTicket}">

								<h1 class="text-light">구매한 이용권이 없습니다.</h1>

							</c:when>
							<c:otherwise>
								<table class="table table table-bordered" width="600" border="1" cellpadding="0">
									<thead class="thead-light">
										<tr>
											<th>회원번호</th>
											<th>${myTicket.mnum}</th>
											<th>이용권 번호</th>
											<th>${myTicket.tknum}</th>
											<th>구매 번호</th>
											<th>${myTicket.ordernum}</th>
										</tr>
										<tr>
											<th>구매날짜</th>
											<th>${myTicket.orderdate}</th>
											<th>금액</th>
											<th>${myTicket.cost}</th>
											<th>이용기간</th>
											<th>${myTicket.tdate}개월</th>
										</tr>
									<thead>
								</table>
								<c:if test="${pageMaker.pre}">
									<a href="${pageContext.request.contextPath}/user/myTicket${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
								</c:if>

								<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
								<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<a href="${pageContext.request.contextPath}/user/myTicket${pageMaker.makeQuery(idx)}">${idx}</a>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<a href="${pageContext.request.contextPath}/user/myTicket${pageMaker.makeQuery(pageMaker.endPage + 1)}"> » </a>
								</c:if>

							</c:otherwise>
						</c:choose>




					</div>


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



</body>

</html>

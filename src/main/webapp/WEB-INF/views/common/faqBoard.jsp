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

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".view-content")
								.on(
										"click",
										function() {
											console.log("FAQ글보기");
											let bid = $(this).parents("tr")
													.find("input").val();
											console.log("faq글번호" + bid);
											let divcontent = $(this).parents(
													"tr");
											console.log(divcontent + ".....");
											let url = "${pageContext.request.contextPath}/admin/faqpage/"
													+ bid;
											let faqContent = divcontent.next(
													"tr").find("input").val();
											console.log(faqContent);
											if (faqContent == bid) {
												divcontent.next("tr").remove();
											} else {
												$
														.ajax({
															type : 'POST',
															url : url,
															dataType : 'JSON',
															cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐		            
															success : function(
																	result) {
																console
																		.log(result);
																var htmls = "";
																htmls += '<tr>';
																htmls += '<input type="hidden" value='+result.bid+'>';
																htmls += '<td style="word-wrap:break-all; white-space:pre-wrap;" colspan="2">'
																		+ result.bcontent
																		+ '</td>';
																htmls += '</tr>';
																divcontent
																		.after(htmls);
															}
														});
											}
										});
					})
</script>
<title>마이페이지</title>

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
					<!-- 내용물 -->
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div style="margin: 0 auto;">
						<h4 class="text-white">FAQ</h4>
						<table class="table" style="width: 850px; table-layout: fixed;" border="1" cellpadding="1" cellspacing="10" border="1">
							<thead class="thead-light">
								<tr>
									<th style="width: 90%;">제목</th>
									<th>+</th>
								</tr>
								<c:forEach items="${faqList}" var="faq">
									<tr>
										<input type="hidden" value="${faq.bid}">
										<td>${faq.btitle}</td>
										<td class="view-content">+</td>
									</tr>
								</c:forEach>
						</table>


						<nav class="pagination-outer mb-2 mt-2" aria-label="Page navigation">
							<ul class="pagination justify-content-center text-center">
								<c:if test="${pageMaker.pre}">
									<li class="page-item"><a aria-label="Previous" class="page-link" href="${pageContext.request.contextPath}/common/faqboard/${gym.gnum}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
											<span aria-hidden="true">«
									</a></span></li>
								</c:if>

								<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
								<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/common/faqboard/${gym.gnum}${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a aria-label="Next" class="page-link" href="${pageContext.request.contextPath}/common/faqboard/${gym.gnum}${pageMaker.makeQuery(pageMaker.endPage + 1)}"> <span
											aria-hidden="true">»</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
						<br>
					</div>
				</div>
			</div>
	</section>
	<!-- 내용물 끝 -->


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
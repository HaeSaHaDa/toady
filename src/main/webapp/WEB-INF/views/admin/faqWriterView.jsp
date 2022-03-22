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


<title>FAQ관리</title>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#submitfaq")
								.on(
										"click",
										function(e) {
											var token = $("meta[name='_csrf']")
													.attr("content");
											var header = $(
													"meta[name='_csrf_header']")
													.attr("content");

											var btitle = $("#btitle").val();
											var bcontent = $("#bcontent").val();

											console.log(bcontent);

											var form = {
												btitle : btitle,
												bcontent : bcontent
											}

											console.log(JSON.stringify(form));

											$
													.ajax({
														type : "POST",
														url : "/admin/insertfaq",
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"X-CSRF-Token",
																			"${_csrf.token}");
														},
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
																				'${pageContext.request.contextPath}/admin/faqpage');
															}
														},
														error : function(e) {
															console.log(e);
														}
													})
										});

						$(".view-content")
								.on(
										"click",
										function() {
											var token = $("meta[name='_csrf']")
													.attr("content");
											var header = $(
													"meta[name='_csrf_header']")
													.attr("content");

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
															beforeSend : function(
																	xhr) {
																xhr
																		.setRequestHeader(
																				"X-CSRF-Token",
																				"${_csrf.token}");
															},
															cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐		            
															success : function(
																	result) {

																console
																		.log(result);

																var htmls = "";

																htmls += '<tr>';
																htmls += '<input type="hidden" value='+result.bid+'>';
																htmls += '<td colspan="3">'
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
				<sec:authorize access="hasAnyRole('USER','BUSINESS')">
					<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
					<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('USER','BUSINESS')">
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
					<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
					</a>
					</span>
				</c:when>
				<c:otherwise>
					<span class="userinfo" style="color: white"> <a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
					</a>
					</span>
					<span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
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
							<sec:authorize access="hasAnyRole('USER','BUSINESS')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('USER','BUSINESS')">
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
									<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
									</a>
									</span>
								</c:when>
								<c:otherwise>
									<span class="userinfo" style="color: white"> <a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
									</a>
									</span>
									<span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
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



	<!-- ChoseUs Section End -->

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-4">
					<%@ include file="../layout/adminmenu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->

				<div class="col-8">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div>
						<h4 class="text-white">FAQ 관리</h4>
						<table class="text-white" style="text-align: center;" width="600" border="1" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>FAQ번호</td>
								<td>제목</td>
								<td>+</td>
							</tr>
							<c:forEach items="${faqList}" var="faq">
								<tr>
									<input type="hidden" value="${faq.bid}">
									<td>${faq.bid}</td>
									<td>${faq.btitle}</td>
									<td class="view-content">+</td>
								</tr>
							</c:forEach>
						</table>


						<c:if test="${pageMaker.pre}">
							<a href="faqpage${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
						</c:if>

						<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
						<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
							<a href="faqpage${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="faqpage${pageMaker.makeQuery(pageMaker.endPage + 1) }"> » </a>
						</c:if>
						<br>
						<table class="text-white" width="600" border="1" cellpadding="0" cellspacing="0" border="1">
							<form:form id="insertfaq" action="${pageContext.request.contextPath}/insertfaq" method="post">
								<tr>
									<td>제목</td>
									<td><input width="200" type="text" id="btitle" name="btitle"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="10" cols="60" id="bcontent" name="bcontent"></textarea></td>
								</tr>
							</form:form>
						</table>
						<button id="submitfaq" class="btn btn-light">FAQ작성</button>

					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- 마이페이지 내용물 끝 -->

	<!-- Get In Touch Section Begin -->
	<div>
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
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua endisse ultrices gravida lorem.</p>
							<div class="fa-social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
								<a href="#"><i class="fa  fa-envelope-o"></i></a>
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
									<a href="#">Physical fitness may help prevent depression, anxiety</a>
								</h6>
								<ul>
									<li>3 min read</li>
									<li>20 Comment</li>
								</ul>
							</div>
							<div class="fw-recent">
								<h6>
									<a href="#">Fitness: The best exercise to lose belly fat and tone up...</a>
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
								All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer Section End -->
	</div>

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>



</body>



</html>

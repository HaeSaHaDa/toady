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
				<div class="container-wrapper; col-9" style="margin-top: -20px; color: white">
					<div class="container">
						<h2 style="color: white">Update Gym</h2>
						</br>
						<p class="lead">시설정보를 수정합니다.</p>

						<sf:form action="${pageContext.request.contextPath}/admin/gymListInventory/updateGymList" method="post" modelAttribute="gymListVO" enctype="multipart/form-data">
							<!-- post method 처리하는 것 controller만들어줘야함. -->

							<sf:hidden path="gnum" />

							<div class="form group">
								<label for="gname">회원번호</label>
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
								<sf:radiobutton path="pr" id="pr" value="0" />
								광고 없음
								<sf:radiobutton path="pr" id="pr" value="1" />
								광고 있음
								<sf:radiobutton path="pr" id="pr" value="2" />
								파워 광고
							</div>

							<div class="form group">
								<label for="gymimage">Upload Picture</label>
								<sf:input path="gymimage" id="gymimage" name="gymimage" type="file" class="form-control" />
							</div>


							<br />
							<button type="submit" class="btn btn-primary">submit</button>
							<a href="<c:url value="/admin/gymListInventory"/>" class="btn btn-dark">Cancle</a>
						</sf:form>
						<br />
					</div>
				</div>
				<br />
			</div>
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
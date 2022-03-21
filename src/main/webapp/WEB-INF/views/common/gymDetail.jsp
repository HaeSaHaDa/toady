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


<style>
#gympage1 {
	margin-top: 50px;
	border-bottom: 1px solid #cccccc;
	padding-bottom: 50px;
}

.gym-img {
	width: 400px;
	height: 400px;
	border: 1px solid #cccc;
}

#gympage2 {
	margin-top: 50px;
	padding-bottom: 50px;
}

#gympage1 h1 {
	color: white;
}

#gympage1 h2 {
	color: white;
}

#gympage1 h3 {
	color: white;
}

#gympage1 p {
	color: lime;
}

#gympage2 h2 {
	color: white;
}

select {
	width: 400px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	color: white;
}

button {
	width: 400px;
}

option {
	color: black;
}

.nav-tabs {
	border-bottom: 1px solid #dee2e6;
}

.nav-tabs .nav-item {
	margin-bottom: -1px;
}

.nav-tabs .nav-link {
	border: 1px solid transparent;
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
}

.nav-tabs .nav-link:hover, .nav-tabs .nav-link:focus {
	border-color: #e9ecef #e9ecef #dee2e6;
}

.nav-tabs .nav-link.disabled {
	color: #6c757d;
	background-color: transparent;
	border-color: transparent;
}

.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
	color: #495057;
	background-color: #fff;
	border-color: #dee2e6 #dee2e6 #fff;
}

.nav-tabs .dropdown-menu {
	margin-top: -1px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.nav-pills .nav-link {
	border-radius: 0.25rem;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #007bff;
}

.nav-fill .nav-item {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	text-align: center;
}

.nav-justified .nav-item {
	-ms-flex-preferred-size: 0;
	flex-basis: 0;
	-webkit-box-flex: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	text-align: center;
}

.tab-content>.tab-pane {
	display: none;
}

.tab-content>.active {
	display: block;
}

.card-img-top {
	width: 100px;
	height: 250px;
}

.card {
	margin: 10px;
}
</style>
<title>시설상세</title>
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
							<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
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
							<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
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



	<!-- ChoseUs Section End -->


	<section class="classes-section spad">
		<!--시설 상세시작-->
		<div class="container" id="gympage1">
			<div class="row">
				<div class="col-md-5">
					<img class="gym-img" src="${pageContext.request.contextPath}/img/classes/class-3.jpg" alt="" />
				</div>
				<div class="col-md-7">
					<h1>${gym.gname}</h1>
					<br />
					<h2>평점</h2>
					<br />
					<h3>${gym.gadress}</h3>
					<br />
					<h3>${gym.gphone}</h3>
					<br /> <select name="order" id="order">
						<c:forEach items="${ticketList}" var="ticket">
							<option value="${ticket.tknum}">${ticket.tname}</option>
						</c:forEach>
					</select><br> <br />
					<button type="button" id="insertWish" class="btn btn-primary">찜하기</button>
				</div>
			</div>
		</div>
		<div class="container" id="gympage2">
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-md-12 pills">
							<div class="bd-example bd-example-tabs">
								<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

									<li class="nav-item"><a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">헬스장
											소개</a></li>
									<li class="nav-item"><a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">트레이너
											소개</a></li>
									<li class="nav-item"><a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a></li>
								</ul>

								<div class="tab-content" id="pills-tabContent">
									<div class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
										<h2>소개</h2>
										<p>${gym.ginform}</p>
										<h2>편의시설</h2>
										<p>${gym.gfacility}</p>
										<p>${gym.gtime}</p>
										<p>${gym.gsns}</p>
									</div>


									<div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
										<div class="container row">
											<div class="card" style="width: 400px">
												<img class="card-img-top" src="${pageContext.request.contextPath}/img/classes/class-details/trainer-profile.jpg" alt="Card image" style="width: 100%">
												<div class="card-body">
													<h4 class="card-title">Jane Doe</h4>
													<p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>

												</div>
											</div>
											<div class="card" style="width: 400px">
												<img class="card-img-top" src="${pageContext.request.contextPath}/img/classes/class-details/trainer-profile.jpg" alt="Card image" style="width: 100%">
												<div class="card-body">
													<h4 class="card-title">Jane Doe</h4>
													<p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>

												</div>
											</div>

										</div>
									</div>

									<div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
										<div id="reviews" class="review-section">
											<div class="d-flex align-items-center justify-content-between mb-4">
												<h4 class="m-0">37 Reviews</h4>
												<select class="custom-select custom-select-sm border-0 shadow-sm ml-2 select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
													<option data-select2-id="3">Most Relevant</option>
													<option>Most Recent</option>
												</select> <span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="2" style="width: 188px;"> <span class="selection"> <span
														class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-qd66-container"> <span
															class="select2-selection__rendered" id="select2-qd66-container" role="textbox" aria-readonly="true" title="Most Relevant">Most Relevant</span> <span class="select2-selection__arrow"
															role="presentation"><b role="presentation"></b></span>
													</span>
												</span> <span class="dropdown-wrapper" aria-hidden="true"></span>
												</span>
											</div>
											<div class="row">
												<div class="col-md-6">
													<table class="stars-counters">
														<tbody>
															<tr class="">
																<td><span>
																		<button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
																</span></td>
																<td class="progress-bar-container">
																	<div class="fit-progressbar fit-progressbar-bar star-progress-bar">
																		<div class="fit-progressbar-background">
																			<span class="progress-fill" style="width: 97.2973%;"></span>
																		</div>
																	</div>
																</td>
																<td class="star-num">(36)</td>
															</tr>
															<tr class="">
																<td><span>
																		<button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
																</span></td>
																<td class="progress-bar-container">
																	<div class="fit-progressbar fit-progressbar-bar star-progress-bar">
																		<div class="fit-progressbar-background">
																			<span class="progress-fill" style="width: 2.2973%;"></span>
																		</div>
																	</div>
																</td>
																<td class="star-num">(2)</td>
															</tr>
															<tr class="">
																<td><span>
																		<button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
																</span></td>
																<td class="progress-bar-container">
																	<div class="fit-progressbar fit-progressbar-bar star-progress-bar">
																		<div class="fit-progressbar-background">
																			<span class="progress-fill" style="width: 0;"></span>
																		</div>
																	</div>
																</td>
																<td class="star-num">(0)</td>
															</tr>
															<tr class="">
																<td><span>
																		<button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
																</span></td>
																<td class="progress-bar-container">
																	<div class="fit-progressbar fit-progressbar-bar star-progress-bar">
																		<div class="fit-progressbar-background">
																			<span class="progress-fill" style="width: 0;"></span>
																		</div>
																	</div>
																</td>
																<td class="star-num">(0)</td>
															</tr>
															<tr class="">
																<td><span>
																		<button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
																</span></td>
																<td class="progress-bar-container">
																	<div class="fit-progressbar fit-progressbar-bar star-progress-bar">
																		<div class="fit-progressbar-background">
																			<span class="progress-fill" style="width: 0;"></span>
																		</div>
																	</div>
																</td>
																<td class="star-num">(0)</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="col-md-6">
													<div class="ranking">
														<h6 class="text-display-7">Rating Breakdown</h6>
														<ul>
															<li>Seller communication level<span>5<span class="review-star rate-10 show-one"></span></span>
															</li>
															<li>Recommend to a friend<span>5<span class="review-star rate-10 show-one"></span></span>
															</li>
															<li>Service as described<span>4.9<span class="review-star rate-10 show-one"></span></span>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>

										<div class="review-list">
											<ul>
												<li>
													<div class="d-flex">
														<div class="left">
															<span> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="profile-pict-img img-fluid" alt="" />
															</span>
														</div>
														<div class="right">
															<h4>
																Askbootstrap <span class="gig-rating text-body-2"> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                    <path fill="currentColor"
																			d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                </svg> 5.0
																</span>
															</h4>
															<div class="country d-flex align-items-center">
																<span> <img class="country-flag img-fluid" src="https://bootdey.com/img/Content/avatar/avatar6.png" />
																</span>
																<div class="country-name font-accent">India</div>
															</div>
															<div class="review-description">
																<p>The process was smooth, after providing the required info, Pragyesh sent me an outstanding packet of wireframes. Thank you a lot!</p>
															</div>
															<span class="publish py-3 d-inline-block w-100">Published 4 weeks ago</span>
															<div class="helpful-thumbs">
																<div class="helpful-thumb text-body-2">
																	<span class="fit-icon thumbs-icon"> <svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
                                        <path
																				d="M13.5804 7.81165C13.8519 7.45962 14 7 14 6.43858C14 5.40843 13.123 4.45422 12.0114 4.45422H10.0932C10.3316 3.97931 10.6591 3.39024 10.6591 2.54516C10.6591 0.948063 10.022 0 8.39207 0C7.57189 0 7.26753 1.03682 7.11159 1.83827C7.01843 2.31708 6.93041 2.76938 6.65973 3.04005C6.01524 3.68457 5.03125 5.25 4.44013 5.56787C4.38028 5.59308 4.3038 5.61293 4.22051 5.62866C4.06265 5.39995 3.79889 5.25 3.5 5.25H0.875C0.391754 5.25 0 5.64175 0 6.125V13.125C0 13.6082 0.391754 14 0.875 14H3.5C3.98325 14 4.375 13.6082 4.375 13.125V12.886C5.26354 12.886 7.12816 14.0002 9.22728 13.9996C9.37781 13.9997 10.2568 14.0004 10.3487 13.9996C11.9697 14 12.8713 13.0183 12.8188 11.5443C13.2325 11.0596 13.4351 10.3593 13.3172 9.70944C13.6578 9.17552 13.7308 8.42237 13.5804 7.81165ZM0.875 13.125V6.125H3.5V13.125H0.875ZM12.4692 7.5565C12.9062 7.875 12.9062 9.1875 12.3159 9.48875C12.6856 10.1111 12.3529 10.9439 11.9053 11.1839C12.1321 12.6206 11.3869 13.1146 10.3409 13.1246C10.2504 13.1255 9.32247 13.1246 9.22731 13.1246C7.23316 13.1246 5.54296 12.011 4.37503 12.011V6.44287C5.40611 6.44287 6.35212 4.58516 7.27847 3.65879C8.11368 2.82357 7.83527 1.43153 8.3921 0.874727C9.78414 0.874727 9.78414 1.84589 9.78414 2.54518C9.78414 3.69879 8.94893 4.21561 8.94893 5.32924H12.0114C12.6329 5.32924 13.1223 5.88607 13.125 6.44287C13.1277 6.99967 12.9062 7.4375 12.4692 7.5565ZM2.84375 11.8125C2.84375 12.1749 2.54994 12.4688 2.1875 12.4688C1.82506 12.4688 1.53125 12.1749 1.53125 11.8125C1.53125 11.4501 1.82506 11.1562 2.1875 11.1562C2.54994 11.1562 2.84375 11.4501 2.84375 11.8125Z"></path>
                                    </svg>
																	</span> <span class="thumb-title">Helpful</span>
																</div>
																<div class="helpful-thumb text-body-2 ml-3">
																	<span class="fit-icon thumbs-icon"> <svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
                                        <path
																				d="M0.419563 6.18835C0.148122 6.54038 6.11959e-07 7 5.62878e-07 7.56142C2.81294e-05 8.59157 0.876996 9.54578 1.98863 9.54578L3.90679 9.54578C3.66836 10.0207 3.34091 10.6098 3.34091 11.4548C3.34089 13.0519 3.97802 14 5.60793 14C6.42811 14 6.73247 12.9632 6.88841 12.1617C6.98157 11.6829 7.06959 11.2306 7.34027 10.9599C7.98476 10.3154 8.96875 8.75 9.55987 8.43213C9.61972 8.40692 9.6962 8.38707 9.77949 8.37134C9.93735 8.60005 10.2011 8.75 10.5 8.75L13.125 8.75C13.6082 8.75 14 8.35825 14 7.875L14 0.875C14 0.391754 13.6082 -3.42482e-08 13.125 -7.64949e-08L10.5 -3.0598e-07C10.0168 -3.48226e-07 9.625 0.391754 9.625 0.875L9.625 1.11398C8.73647 1.11398 6.87184 -0.000191358 4.77272 0.00038257C4.62219 0.000300541 3.74322 -0.000438633 3.65127 0.000382472C2.03027 -1.04643e-06 1.12867 0.981667 1.18117 2.45566C0.76754 2.94038 0.564868 3.64065 0.682829 4.29056C0.342234 4.82448 0.269227 5.57763 0.419563 6.18835ZM13.125 0.875L13.125 7.875L10.5 7.875L10.5 0.875L13.125 0.875ZM1.53079 6.4435C1.09375 6.125 1.09375 4.8125 1.6841 4.51125C1.31436 3.88891 1.64713 3.05613 2.09467 2.81605C1.86791 1.37941 2.61313 0.885417 3.65906 0.875355C3.74962 0.874535 4.67753 0.875355 4.77269 0.875355C6.76684 0.875355 8.45704 1.98898 9.62497 1.98898L9.62497 7.55713C8.5939 7.55713 7.64788 9.41484 6.72153 10.3412C5.88632 11.1764 6.16473 12.5685 5.6079 13.1253C4.21586 13.1253 4.21586 12.1541 4.21586 11.4548C4.21586 10.3012 5.05107 9.78439 5.05107 8.67076L1.9886 8.67076C1.36708 8.67076 0.877707 8.11393 0.874973 7.55713C0.872266 7.00033 1.09375 6.5625 1.53079 6.4435ZM11.1563 2.1875C11.1563 1.82506 11.4501 1.53125 11.8125 1.53125C12.1749 1.53125 12.4688 1.82506 12.4688 2.1875C12.4688 2.54994 12.1749 2.84375 11.8125 2.84375C11.4501 2.84375 11.1563 2.54994 11.1563 2.1875Z"></path>
                                    </svg>
																	</span> <span class="thumb-title">Not Helpful</span>
																</div>
															</div>
															<div class="response-item mt-4 d-flex">
																<div class="left">
																	<span> <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="profile-pict-img img-fluid" alt="" />
																	</span>
																</div>
																<div class="right">
																	<h4>
																		Gurdeep Osahan <span class="gig-rating text-body-2"> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                            <path fill="currentColor"
																					d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                        </svg> 5.0
																		</span>
																	</h4>
																	<div class="country d-flex align-items-center">
																		<span> <img class="country-flag img-fluid" src="https://bootdey.com/img/Content/avatar/avatar3.png" />
																		</span>
																		<div class="country-name font-accent">India</div>
																	</div>
																	<div class="review-description">
																		<p>The process was smooth, after providing the required info, Pragyesh sent me an outstanding packet of wireframes. Thank you a lot!</p>
																	</div>
																	<span class="publish py-3 d-inline-block w-100">Published 4 weeks ago</span>
																</div>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--시설 상세 끝-->
	</section>







	<!-- Get In Touch Section Begin -->
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
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a
								href="#"><i class="fa  fa-envelope-o"></i></a>
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

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

		<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>
</body>
<script>
	$(document).ready(function() {

		$("#insertWish").on("click", function(e) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			console.log("장바구니 추가 버튼 누르는 중..");

			let login = "${principal.username}";

			if (login == "") {
				if (confirm("로그인이 필요합니다.")) {
					location.href = "/common/login";
				}
			} else {

				let ticketNumber = $("#order option:selected").val();
				console.log(ticketNumber);

				$.ajax({
					url : "/insertWish/" + ticketNumber,
					type : 'POST',
					beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
					},
					cache : false,
					success : function(result) {
						console.log(result);

						if (result == "ok") {
							alert("찜에 담았습니다.");
						}
					},
					error : function(e) {
						console.log(e);
					}

				});

			}

		});

	})
</script>



</html>
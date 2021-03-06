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
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
.tab-content p{
	font-family: 'IM_Hyemin-Bold';
	font-size: 20px;
}
@font-face {
    font-family: 'ONE-Mobile-POP';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.tab-content h2,h3,h4{
	font-family: 'ONE-Mobile-POP';
}
.customoverlay {
position:relative;
bottom:85px;
border-radius:6px;
border: 1px solid #ccc;
border-bottom:2px solid #ddd;
float:left;
}
.customoverlay:nth-of-type(n) {
border:0; 
box-shadow:0px 1px 2px #888;
}
.customoverlay a {
display:block;
text-decoration:none;
color:#000;
text-align:center;
border-radius:6px;
font-size:14px;
font-weight:bold;
overflow:hidden;
background: #d95050;
background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
}
.customoverlay .title {
display:block;
text-align:center;
background:#fff;
margin-right:35px;
padding:10px 15px;
font-size:14px;
font-weight:bold;
}
.customoverlay:after {
content:'';position:absolute;
margin-left:-12px;left:50%;
bottom:-12px;width:22px;
height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
<title>시설상세</title>
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


	<section class="classes-section spad">
		<!--시설 상세시작-->
		<div class="container" id="gympage1" style=" margin-top: 200px;">
			<div class="row">
				<div class="col-md-5">
					<img class="gym-img" src="${pageContext.request.contextPath}/img/${gym.imagename}" alt="" />
				</div>
				<div class="col-md-7" style="line-align: center">
					<h1>${gym.gname}</h1>
					<br /> <br />
					<h3>${gym.gaddress}</h3>
					<br />
					<h3>${gym.gphone}</h3>
					<br /> 
					<select name="order" id="order">
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
									<div style="line-height: 20px; padding: 15px;" class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
										<h2>소개</h2>
										<input type="hidden" class="gaddress" value="${gym.gaddress}">
										<input type="hidden" class="gname" value="${gym.gname}">
										<input type="hidden" class="gnum" value="${gym.gnum}">
										<p>${gym.ginform}</p>
										<h2>편의시설</h2>
										<p>${gym.gfacility}</p>
										<p>${gym.gtime}</p>
										<p>${gym.gsns}</p>
										<h2>시설 위치</h2>
										<div id="map" style="width: 80%; height: 350px;"></div>
			<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe8a7303194945138622f04ab6f2e5b3&libraries=services"></script>
							<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 



// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

let addres = $(".gaddress").val();
let gname = $(".gname").val();
let gnum = $(".gnum").val();
console.log(addres);

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addres, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
    	 console.log("되따!!");
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        console.log(coords+".........")
        // 결과값으로 받은 위치를 마커로 표시합니다
        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var imageSrc = '${pageContext.request.contextPath}/img/마커배경-removebg-preview.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(80, 69), // 마커이미지의 크기입니다
		imageOption = {offset: new kakao.maps.Point(39, 70)};
        
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                                markerPosition =coords; // 마커가 표시될 위치입니다

                            // 마커를 생성합니다
                            var marker = new kakao.maps.Marker({
                              position: coords,
                              image: markerImage // 마커이미지 설정 
                            });

                            // 마커가 지도 위에 표시되도록 설정합니다
                            marker.setMap(map); 
                           
                           // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            var content = '<div class="customoverlay">' +
                                '  <a href="${pageContext.request.contextPath}/common/gymdetail/'+gnum+'">' +
                                '    <span class="title">'+gname+'</span>' +
                                '  </a>' +
                                '</div>';

                            // 커스텀 오버레이가 표시될 위치입니다 
                            var position = coords;  

                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay({
                                map: map,
                                position: coords,
                                content: content,
                                yAnchor: 1 
                            });

        					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       					 	map.setCenter(coords);
    						} 
							});    
					</script>
									</div>


									<div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
										<div class="container row justify-content-center">
											<c:forEach items="${trainer}" var="trainer">
           						 <div class="card mt-3 " style="background-color: black; width: 300px;">
                				<div class="layer"></div>
               						<div class="content">                    
                    			<div class="card-body text-center pb-3 " style="height: 200px;">
                       			 <div class="row justify-content-center">
                            		<div class="col text-center justify-content-center ">
                               	 <p class="bold text-center px-md-3">
                               	  ${trainer.gtcareer}</p>
                            		</div>
                        		</div>
                    			</div>
                   				 <hr class="mt-auto mb-4">
                   				 <div class="card-footer text-center border-0 mt-0 pt-0 mb-3">
                       			 <div class="row text-center name mt-auto ">
                           		 <div class="col">
                               	 <h4 class="mb-0 Elizabeth">${trainer.gtname}</h4> <small class="mt-0 text-white"></small>                             
                           	 </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>

										</div>
									</div>

									<div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
										<div class="d-flex justify-content-center">
											<div class="content text-center">
												<div class="ratings">
													<!-- 평점 나타내는 곳 -->
													<span class="product-rating">${gymstar}</span><span>/5</span>
													<div class="stars">
														<!-- 여기가 평균 별 나타내는 곳 -->
														<c:forEach begin="1" end="${gymstar2}">
															<i class="fa fa-star"></i>
														</c:forEach>
													</div>
													<div class="rating-text">
														<span>${totalReiew} reviews</span>
													</div>
												</div>
											</div>
										</div>
										<div class="review-list ml-3 mr-2 pt-2" style="background-color: #ebebeb">
											<ul>
												<li>
													<div>
														<c:forEach items="${gymReview}" var="review">
															<div class="right ml-3 mt-3 r-content">
																<h4 style="font-size: 30px;">
																	${review.mnickname} 
																	<span class="gig-rating text-body-2"> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                  													<path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>   
                  													</svg>${review.grstar}</span>
																</h4>
																<div class="review-description">
																	<p style="font-size: 25px;">${review.bcontent}</p>
																</div>
																<span class="publish py-3 d-inline-block w-100"><fmt:formatDate value="${review.bdate}" pattern="yyyy/MM/dd" /></span>
																<!-- 좋아요기능은 이곳에.. -->
															</div>
														</c:forEach>
													</div>
												</li>
											</ul>
										</div>

										<nav class="pagination-outer mb-2" aria-label="Page navigation">
											<ul class="pagination justify-content-center text-center">
												<c:if test="${pageMaker.pre}">
													<li class="page-item"><a aria-label="Previous" class="page-link"
														href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(pageMaker.startPage - 1) }"> <span aria-hidden="true">«</a></span></li>
												</c:if>

												<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
												<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:forEach>
												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<li class="page-item"><a aria-label="Next" class="page-link" href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(pageMaker.endPage + 1)}">
															<span aria-hidden="true">»</span>
													</a></li>
												</c:if>
											</ul>
										</nav>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--시설 상세 끝-->
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
<script>
	$(document).ready(function() {

		check();

		$("#insertWish").on("click", function(e) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			console.log("장바구니 추가 버튼 누르는 중..");

			let login = "${principal.username}";

			if (login == "") {
				confirm("로그인이 필요합니다.");
				$(".fa-sign-in").trigger("click"); //로그인 모달창을 띄우게 하기위한 trigger함수사용
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
	function nolist() {

		let htmls = "";

		htmls += '<div class = "text-center pb-5">';
		htmls += '<h3 style="color:black;">아직 작성한 리뷰가 없습니다. 리뷰를 작성해주세요</h3>';
		htmls += '</div>'

		$(".review-list").append(htmls);
		$(".product-rating").text("0");
		$(".rating-text span").text("0 reviews");
	}
	function check() {
		let checkNum = $(".r-content h4").text();

		console.log(checkNum);

		if (checkNum == "") {
			nolist();
		}
	}
</script>



</html>

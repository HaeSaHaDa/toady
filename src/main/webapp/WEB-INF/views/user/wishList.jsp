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


<style>
.shopping-cart {
	padding-top: 80px;
	padding-bottom: 60px;
}

.cart-table {
	margin-bottom: 40px;
}

.cart-table table {
	margin-top: 80px;
	width: 100%;
	min-width: 480px;
	border: 1px solid #ebebeb;
	background-color: #f8f4ec;
}

.cart-table table tr th {
	font-size: 16px;
	color: #252525;
	font-weight: 700;
	border-bottom: 1px solid #ebebeb;
	text-align: center;
	padding: 18px 15px 25px;
	text-transform: uppercase;
}

.cart-table table tr th.p-name {
	text-align: left;
}

.cart-table table tr td {
	text-align: center;
	padding-bottom: 34px;
}

.cart-table table tr td.first-row {
	padding-top: 30px;
}

.cart-table table tr td.cart-pic {
	width: 21%;
}

.cart-table table tr td.cart-title {
	text-align: center;
}

.cart-table table tr td.cart-title h5 {
	color: #252525;
}

.cart-table table tr td.p-price {
	width: 16%;
}

.cart-table table tr td.p-price, .cart-table table tr td.total-price {
	color: #e7ab3c;
	font-size: 16px;
	font-weight: 700;
}

.cart-table table tr td.qua-col {
	width: 16%;
}

.cart-table table tr td.qua-col .quantity {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}

.cart-table table tr td.qua-col .pro-qty {
	width: 123px;
	height: 46px;
	border: 2px solid #ebebeb;
	padding: 0 15px;
	float: left;
}

.cart-table table tr td.qua-col .pro-qty .qtybtn {
	font-size: 24px;
	color: #b2b2b2;
	float: left;
	line-height: 38px;
	cursor: pointer;
	width: 18px;
}

.cart-table table tr td.qua-col .pro-qty .qtybtn.dec {
	font-size: 30px;
}

.cart-table table tr td.qua-col .pro-qty input {
	text-align: center;
	width: 52px;
	font-size: 14px;
	font-weight: 700;
	border: none;
	color: #4c4c4c;
	line-height: 40px;
	float: left;
}

.cart-table table tr td.total-price {
	width: 12%;
}

.cart-buttons {
	margin-bottom: 34px;
}

.cart-buttons .continue-shop .delete-wishall {
	color: #b2b2b2;
	border: 2px solid #ebebeb;
	background: #ffffff;
	margin-right: 8px;
	padding: 12px 20px 12px 20px;
	margin-bottom: 10px;
}

.cart-buttons .up-cart {
	color: #252525;
	background: #f3f3f3;
	border: 2px solid #ebebeb;
	padding: 12px 20px 12px 20px;
}

.proceed-checkout ul {
	border: 2px solid #ebebeb;
	background: #f3f3f3;
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 16px;
	padding-bottom: 20px;
}

.proceed-checkout ul li {
	list-style: none;
	font-size: 16px;
	font-weight: 700;
	color: #252525;
	text-transform: uppercase;
	overflow: hidden;
}

.proceed-checkout ul li.cart-total {
	padding-top: 10px;
}

.proceed-checkout ul li.cart-total span {
	color: #e7ab3c;
}

.proceed-checkout ul li span {
	float: right;
}

.proceed-checkout .proceed-btn {
	font-size: 14px;
	font-weight: 700;
	color: #ffffff;
	background: #252525;
	text-transform: uppercase;
	padding: 15px 25px 14px 25px;
	display: block;
	text-align: center;
}

.cart-img {
	width: 170px;
	height: 170px;
}

.delete-ticket {
	cursor: pointer;
}
</style>
<title>오늘의 짐</title>

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
	<!-- Classes Section Begin -->
	<section class="classes-section spad">
		<!-- 찜시작 -->
		<section class="shopping-cart spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="cart-table">
							<table>
								<thead>
									<tr>
										<th>Image</th>
										<th class="p-name">헬스장</th>
										<th>이용권</th>
										<th>가격</th>
										<th>기간(개월)</th>
										<th>합계</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${wishList}" var="wish">
										<div id="wishtable">
											<tr id="select">
												<input type="hidden" id="wishnum" name="wishnum" value="${wish.wishnum}">
												<td class="cart-pic first-row">
													<!-- 여기는 나중에 이미지이름넣기 --> <img class="cart-img" src="${pageContext.request.contextPath}/img/${wish.imagename}" alt="" />
												</td>
												<td class="cart-title first-row">
													<h5>${wish.gname}</h5>
												</td>
												<td class="cart-title first-row"><h5>${wish.tname}</h5></td>
												<td class="p-price first-row">${wish.tcost}</td>
												<td class="qua-col first-row">
													<div class="quantity">
														<div class="pro-qty">
															<span class="dec qtybtn">-</span> <input type="text" class="wdate" name="wdate" value="${wish.wdate}"> <span class="inc qtybtn">+</span>
														</div>
													</div>
												</td>
												</td>
												<td class="total-price first-row">${wish.tcost}</td>
												<th><span class="delete-ticket">X</span></th>
											</tr>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="cart-buttons">
									<a href="/deletewishall" class="primary-btn .continue-shop">찜 비우기</a> <a href="#" class="primary-btn continue-shop">더 둘러보기</a>
								</div>

							</div>
							<div class="col-lg-4 offset-lg-4">
								<div class="proceed-checkout">
									<ul>
										<li class="cart-total">Total <span>${wishPrice}</span></li>
									</ul>
									<a href="/user/checkoutpage" class="proceed-btn">결제하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Shopping Cart Section End -->
		<!-- 찜끝 -->
	</section>
	<!-- ChoseUs Section End -->
	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>

	<script>
		$(document).ready(function() {
			//<div class="cart-table">	

			check();

			$(".dec").on("click", function(e) {
				var thisRow = $(this).closest('tr');
				console.log(thisRow.find('td:eq(3)').text());

				console.log($(this).parent("div").find("input").val());
				let tdate = $(this).parent("div").find("input").val();
				if (tdate > 1) {
					$(this).parent("div").find("input").val(--tdate);

					let coast = thisRow.find('td:eq(3)').text();
					console.log(Number(tdate) * Number(coast));
					let total = Number(tdate) * Number(coast);
					thisRow.find('td:eq(5)').text(total);

				}

			});
			$(".inc").on("click", function(e) {
				var thisRow = $(this).closest('tr');
				console.log(thisRow.find('td:eq(3)').text());

				console.log($(this).parent("div").find("input").val());
				let tdate = $(this).parent("div").find("input").val();
				$(this).parent("div").find("input").val(++tdate);

				let coast = thisRow.find('td:eq(3)').text();
				console.log(Number(tdate) * Number(coast));
				let total = Number(tdate) * Number(coast);
				thisRow.find('td:eq(5)').text(total);

			});

			$(".qtybtn").on("click", function(e) {
				getTotal();

				var thisRow = $(this).closest('tr');
				//수량 업데이트 중
				//var token = $("meta[name='_csrf']").attr("content");
				//var header = $("meta[name='_csrf_header']").attr("content");

				let wishNum = thisRow.find('[name=wishnum]').val();
				let tval = thisRow.find('[name=wdate]').val();
				console.log(wishNum, tval);

				var form = {
					wishnum : wishNum,
					wdate : tval
				};

				console.log(JSON.stringify(form));

				$.ajax({
					type : "POST",
					url : "/updateWish",

					cache : false,
					contentType : 'application/json; charset=utf-8',
					data : JSON.stringify(form),
					success : function(result) {
						if (result == "SUCCESS") {
							console.log("업데이트 완료");
						}
					},
					error : function(e) {
						console.log(e);
					}
				})

			});
			/*<!-- csrf meta tag -->
			<meta name="_csrf" content="${_csrf.token}"/>
			<meta name="_csrf_header" content="${_csrf.headerName}"/>*/

			$(".delete-ticket").on("click", function() {
				console.log("삭제버튼 누르는 중");
				console.log(this);
				let ticketnumber = $(this).parents("tr").find("input").val();
				console.log(ticketnumber + "찜번호");
				var trname = $(this).parents("div").find("#select");
				console.log(typeof ticketnumber);
				console.log($(this).parents("tr") + "............");
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");

				console.log(token + "," + header);
				let p = $(".cart-total span").text();
				console.log(p);

				$.ajax({
					url : "/deleteWish/" + ticketnumber,
					type : 'DELETE',
					beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
					},
					cache : false,
					success : function(result) {
						console.log(result);

						if (result == "ok") {
							$(trname).remove();
							getTotal();
						}
						check();

					},
					error : function(e) {
						console.log(e);
					}

				});

			});

		});

		function getTotal() {
			console.log("총 가격 넣는중");
			const total = $(".cart-total span").text();

			console.log("총가격은 >>" + total);

			let arr = $(".total-price").length;

			let arr2 = new Array(arr);

			let sum = 0;

			for (let i = 0; i < arr; i++) {
				arr2[i] = Number($(".total-price").eq(i).text());
				console.log(i + "번째 텍스트" + arr2[i]);
				sum += arr2[i];
			}

			console.log(sum);

			$(".cart-total span").text(sum);
		}

		function nolist() {

			let htmls = "";
			htmls += '<tr>';
			htmls += '<td colspan="7"></td>';
			htmls += '</tr>';
			htmls += '<tr>';
			htmls += '<td colspan="7"><h5>찜한 이용권이 없습니다.</h5></td>';
			htmls += '</tr>';
			htmls += '<tr>';
			htmls += '<td colspan="7"></td>';
			htmls += '</tr>';

			$(".cart-table tbody").append(htmls);
		}

		function check() {
			let checkNum = $(".cart-total span").text();

			if (checkNum == 0) {
				nolist();
			}
		}
	</script>


</body>

</html>
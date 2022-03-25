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

<!-- 별점라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>마이페이지</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');
 @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

.ticket {
        width: 400px;
        height: 240px;
        border: 1px solid #cccc;
        border-radius: 30px 30px;
        margin-top: 5px;
        background-color: white;
        margin-left: 100px;
      }
      .first {
        display: flex;
        line-height: 2;
        margin-top: 10px;
        margin-bottom: 10px;
      }
      .first p:first-child {
        margin-right: 100px;
        margin-left: 30px;
      }
      .first p:nth-child(2) {
        margin-right: 20px;
      }
      .second {

        margin-left: 30px;
        line-height: 8px;
      }
      .gogym p{
        color: rgb(39, 129, 107);
        text-decoration: none;
        text-shadow: 0 0 24px;
      }
      .last {
        display: flex;
      }
      @import url(https://fonts.googleapis.com/css?family=BenchNine:700);
	
	.goback{
		background-color: #50586C;
        border: none;
        color: #ffffff;
        cursor: pointer;
        display: inline-block;
        font-family: "BenchNine", Arial, sans-serif;
        font-size: 1em;
        font-size: 10px;
        outline: none;
        padding: 12px 30px 10px;
        position: relative;
        text-transform: uppercase;
        margin-left: 25px;
        margin-bottom: 30px;
	}
		
      .goRivew{
        background-color: #c47135;
        border: none;
        color: #ffffff;
        cursor: pointer;
        display: inline-block;
        font-family: "BenchNine", Arial, sans-serif;
        font-size: 1em;
        font-size: 10px;
        outline: none;
        padding: 12px 30px 10px;
        position: relative;
        text-transform: uppercase;
        margin-left: 50px;
        margin-bottom: 30px;
      }
      .goRivew:before,
      .goRivew:after {
        border-color: transparent;
        -webkit-transition: all 0.25s;
        transition: all 0.25s;
        border-style: solid;
        border-width: 0;
        content: "";
        height: 24px;
        position: absolute;
        width: 24px;
      }
      .goRivew:before {
        border-color: #c47135;
        border-right-width: 2px;
        border-top-width: 2px;
        right: -5px;
        top: -5px;
      }
      .goRivew:after {
        border-bottom-width: 2px;
        border-color: #c47135;
        border-left-width: 2px;
        bottom: -5px;
        left: -5px;
      }
      .goRivew:hover,
      .goRivew.hover {
        background-color: #c47135;
      }
      .goRivew:hover:before,
      .goRivew.hover:before,
      .goRivew:hover:after,
      .goRivew.hover:after {
        height: 100%;
        width: 100%;
      }
.cross {
    padding: 10px;
    color: #d6312d;
    cursor: pointer;
    font-size: 23px
}

.cross i {
    margin-top: -5px;
    cursor: pointer
}

.comment-box {
    padding: 5px
}

.comment-area textarea {
    resize: none;
    border: 1px solid #ff0000
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #ffffff;
    outline: 0;
    box-shadow: 0 0 0 1px rgb(255, 0, 0) !important
}

.send {
    color: #fff;
    background-color: #ff0000;
    border-color: #ff0000
}

.send:hover {
    color: #fff;
    background-color: #f50202;
    border-color: #f50202
}

.rating {
    display: inline-flex;
    margin-top: -10px;
    flex-direction: row-reverse
}

.rating>input {
    display: none
}

.rating>label {
    position: relative;
    width: 28px;
    font-size: 35px;
    color: #ff0000;
    cursor: pointer
}

.rating>label::before {
    content: "\2605";
    position: absolute;
    opacity: 0
}

.rating>label:hover:before,
.rating>label:hover~label:before {
    opacity: 1 !important
}

 .rating>input:checked~label:before {
    opacity: 1
}

.comment-box .rating:hover>input:checked~label:before {
    opacity: 0.4
}



<!--페이지버튼-->
.pagination-outer{ text-align: center; }
.pagination{
    font-family: 'Ubuntu', sans-serif;
    display: inline-flex;
    position: relative;
}
.pagination li a.page-link{
    color: #fff;
    background-color: #333;
    font-size: 20px;
    font-weight: 500;
    line-height: 39px;
    height: 40px;
    width: 40px;
    padding: 0;
    margin: 0 5px;
    border: none;
    border-radius: 7px;
    overflow: hidden;
    position: relative;
    z-index: 1;
    transition: all 0.3s ease 0s;
}
.pagination li a.page-link:hover,
.pagination li a.page-link:focus,
.pagination li.active a.page-link:hover,
.pagination li.active a.page-link{
    color: #fff;
    background: #2ecc71;
}
.pagination li a.page-link:before,
.pagination li a.page-link:after{
    content: '';
    background: #555;
    height: 100%;
    width: 7px;
    border-radius: 10px 0 0 10px;
    opacity: 1;
    position: absolute;
    left: 0;
    top: 0;
    z-index: -1;
    transition: all 0.4s ease 0s;
}
.pagination li a.page-link:after{
    border-radius: 0 10px 10px 0;
    left: auto;
    right: 0;
    top: auto;
    bottom: 0;
}
.pagination li a.page-link:hover:before,
.pagination li a.page-link:focus:before,
.pagination li.active a.page-link:before{
    background-color: #27ae60;
    border-radius: 10px 10px 0 0;
    width: 100%;
    height: 7px;
}
.pagination li a.page-link:hover:after,
.pagination li a.page-link:focus:after,
.pagination li.active a.page-link:after{
    background-color: #27ae60;
    border-radius: 0 0 10px 10px;
    width: 100%;
    height: 7px;
}
@media only screen and (max-width: 480px){
    .pagination{
        font-size: 0;
        border: none;
        display: inline-block;
    }
    .pagination li{
        display: inline-block;
        vertical-align: top;
        margin: 0 0 10px;
    }
}
</style>

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
					<div class="container ticket-area" style="margin: 0 auto">
						<h3 style="color: white;" class="mb-3">구매한 이용권</h3>
						<c:forEach items="${myTicket}" var="myticket" varStatus="status">
							<div class="ticket">
								<div class="first">
									<input type="hidden" id="payid" value="${myticket.payid}">
									<p class="mr-3 ml-3">
										<fmt:formatDate value="${myticket.orderdate}" pattern="yyyy/MM/dd" />
									</p>
									<p class="mr-3" style="margin-left: 150px;">주문번호</p>
									<p>${myticket.ordernum}</p>
								</div>
								<div class="second">
									<a href="${pageContext.request.contextPath}/common/gymdetail/${myticket.gnum}" class="gogym">
										<p title="헬스장 정보보기">${myticket.gname}</p>
									</a>
									<p>${myticket.tname}<span>${myticket.tdate}개월</span>
									</p>
									<p>
										시작날짜<span><fmt:formatDate value="${myticket.startdate}" pattern="yyyy/MM/dd" /></span>
									</p>
									<div class="last">
										<p>${myticket.cost}원</p>
										<button type="button" class="goRivew" data-toggle="modal" data-target="#form${status.index}">리뷰작성</button>
										<button class="goback">환불하기</button>
									</div>
								</div>
								<div class="modal fade" id="form${status.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="text-right cross">
												<i class="fa fa-times mr-2"></i>
											</div>
											<div class="card-body text-center">
												<img src=" https://i.imgur.com/d2dKtI7.png" height="100" width="100">
												<div class="comment-box text-center">
													<h4>${myticket.gname}의리뷰를남겨주세요!</h4>
													<input type="hidden" id="tknum" value="${myticket.tknum}">
													<div class="rating">
														<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input
															type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio"
															name="rating" value="1" id="1"><label for="1">☆</label>
													</div>
													<div class="comment-area">
														<textarea class="form-control" placeholder="what is your view?" rows="4"></textarea>
													</div>
													<div class="text-center mt-4">
														<input type="hidden" id="gnum" value="${myticket.gnum}">
														<button class="btn btn-success send px-5">
															Send message <i class="fa fa-long-arrow-right ml-1"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
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
					<br>

				</div>
			</div>
		</div>
	</section>
	<!-- 내용물 끝 -->


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
								<a href="#"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
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

<script>
	$(document).ready(function() {

		checkList();

		$("goRivew").mouseleave(function() {
			$(this).removeClass("hover");
		});

		$(".fa").on("click", function() {
			$('.modal').modal('hide');

		});
		$(".rating").on("change", function() {
			var tmp_value = $('input:radio[name=rating]:checked').val();
			console.log(tmp_value);
		});

		$(".send").on("click", function() {
			console.log(this);

			let parent = $(this).parent("div").parent("div");
			let parent2 = parent.parent("div").parent("div");
			let parent3 = parent2.parent("div").parent("div");
			let lastParent = parent3.parent("div");

			let ordernum = Number(lastParent.find("p").eq(2).text());
			let bcontent = $("textarea").val();
			let grstar = $('input:radio[name=rating]:checked').val();
			let gnum = Number($(this).parent("div").find("input").val());
			let tknum = Number(parent.parent("div").find("input").val());

			let form = {
				bcontent : bcontent,
				grstar : grstar,
				gnum : gnum,
				ordernum : ordernum,
				tknum : tknum
			}

			console.log(tknum + "..." + ordernum);

			$.ajax({
				type : "POST",
				url : "/insertReview",
				cache : false,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(form),
				success : function(result) {

					if (result == "SUCCESS") {
						closeModal();
						console.log("작성완료");
					} else {
						alert("이미 작성했습니다");
						closeModal();
					}

				},
				error : function(e) {
					console.log(e);
				}
			})

		});

	});

	function closeModal() {
		$('.modal').modal('hide');
	}

	function checkList() {
		let checkText = $(".ticket p").text();

		if (checkText == "") {
			noTicket();
		}

	}

	function noTicket() {

		let htmls = "";
		htmls += '<h5 class = "mt-5" style="color: white;">구매한 이용권이 없습니다.</h5>';

		$(".ticket-area").append(htmls);
	}
</script>

</html>

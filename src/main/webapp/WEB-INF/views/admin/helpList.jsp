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
            <div class="col-8">
               <!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
               <div>
                  
                  <table class="table table-striped table-light">

                     <thead class="thead-light">
                        <tr>
                           <th>TYPE</th>
                           <th>문의 내용</th>   
                           <th>작성일자</th>   
                        </tr>
                     <thead>

                        <c:forEach var="helpBoard" items="${helpReplyList}">
                           <tr>
                              <td>문의</td>
                              <td><a href="/admin/helpReview?bid=${helpBoard.bid}">${helpBoard.bcontent }</a></td>
                              <td>${helpBoard.bdate}</td>
                           </tr>
                        </c:forEach>   
                        </form>
                  </table>
                  
                  <c:if test="${pageMaker.pre}">
                           <a href="/admin/helpList${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
                        </c:if>

                        <!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
                        <c:forEach var="idx" begin="${pageMaker.startPage}"
                           end="${pageMaker.endPage }">
                           <a href="helpList${pageMaker.makeQuery(idx)}">${idx}</a>
                        </c:forEach>

                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                           <a href="helpList${pageMaker.makeQuery(pageMaker.endPage + 1) }">
                              » </a>
                        </c:if>

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
                        <a href="#"><img src="/img/logo.png" alt=""></a>
                     </div>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                        sed do eiusmod tempor incididunt ut labore dolore magna aliqua
                        endisse ultrices gravida lorem.</p>
                     <div class="fa-social">
                        <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                           class="fa fa-twitter"></i></a> <a href="#"><i
                           class="fa fa-youtube-play"></i></a> <a href="#"><i
                           class="fa fa-instagram"></i></a> <a href="#"><i
                           class="fa  fa-envelope-o"></i></a>
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
                           <a href="#">Physical fitness may help prevent depression,
                              anxiety</a>
                        </h6>
                        <ul>
                           <li>3 min read</li>
                           <li>20 Comment</li>
                        </ul>
                     </div>
                     <div class="fw-recent">
                        <h6>
                           <a href="#">Fitness: The best exercise to lose belly fat
                              and tone up...</a>
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
                        All rights reserved | This template is made with <i
                           class="fa fa-heart" aria-hidden="true"></i> by <a
                           href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- Footer Section End -->
   </div>

   <!-- Search model Begin -->
   <div class="search-model">
      <div class="h-100 d-flex align-items-center justify-content-center">
         <div class="search-close-switch">+</div>
         <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
         </form>
      </div>
   </div>
   <!-- Search model end -->

   <!-- Js Plugins -->
   <script src="/js/jquery-3.3.1.min.js"></script>
   <script src="/js/bootstrap.min.js"></script>
   <script src="/js/jquery.magnific-popup.min.js"></script>
   <script src="/js/masonry.pkgd.min.js"></script>
   <script src="/js/jquery.barfiller.js"></script>
   <script src="/js/jquery.slicknav.js"></script>
   <script src="/js/owl.carousel.min.js"></script>
   <script src="/js/main.js"></script>



</body>

</html>
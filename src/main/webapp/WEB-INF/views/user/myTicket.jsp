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


<!-- 별점라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>마이페이지</title>

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
				<sec:authorize access="hasRole('USER')">
					<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
					<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
				</sec:authorize>
				<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
				<sec:authorize access="hasRole('ADMIN')">
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
							<li><a href="${pageContext.request.contextPath}/common/gymlist">시설찾기</a></li>
							<sec:authorize access="hasRole('USER')">
								<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
								<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
							</sec:authorize>
							<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
							<sec:authorize access="hasRole('ADMIN')">
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

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-4">
					<ul>
<<<<<<< HEAD
						<li><a href="${pageContext.request.contextPath}/user/memberInfo">내 정보</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myTicket">내 이용권</a></li>
						<li><a href="${pageContext.request.contextPath}/user/note">쪽지</a></li>
=======
						<li><a href="/user/memberInfo">내 정보</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myTicket">내 이용권</a></li>
						<li><a href="/user/note">쪽지</a></li>
>>>>>>> b155730d4dfbed9e35a9f223def105e7685e646c
						<li><a href="${pageContext.request.contextPath}/user/faqboard">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
						<li><a href="#">공지/이벤트</a></li>
						<li><a href="#">시설등록하기</a></li>
						<li><a href="#">시설등록내역</a></li>
					</ul>
				</div>
				<!-- 사이드바 끝 -->
				<div class="col-8">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->					
					<div class="container">
					<c:forEach items="${myTicket}" var="myticket">
     					 <div class="ticket">
       						 <div class="first">
       						 <input type="hidden" id="payid" value="${myticket.payid}">
          						<p class="mr-3 ml-3"><fmt:formatDate value="${myticket.orderdate}" pattern="yyyy/MM/dd"/></p>
          						<p class="mr-3" style="margin-left: 150px;">주문번호</p>
         						<p>${myticket.ordernum}</p>         						
        						</div>
       						 <div class="second">
          						<a href="${pageContext.request.contextPath}/common/gymdetail/${myticket.gnum}" class="gogym"> <p title="헬스장 정보보기">${myticket.gname}</p> </a>
         						 <p>${myticket.tname}<span>${myticket.tdate}개월</span></p>
         						 <p>시작날짜<span><fmt:formatDate value="${myticket.startdate}" pattern="yyyy/MM/dd"/></span></p>
         				 	<div class="last">
           					 <p>${myticket.cost}원</p>
           					 	<button type="button" class="goRivew" data-toggle="modal" data-target="#form">리뷰작성</button>           					 
           					 	<button class="goback">환불하기</button>
          					</div>
        					</div>
        						<div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    						<div class="modal-dialog modal-dialog-centered" role="document">
       							<div class="modal-content">
           							 <div class="text-right cross"> <i class="fa fa-times mr-2"></i> </div>
            						<div class="card-body text-center"><img src=" https://i.imgur.com/d2dKtI7.png" height="100" width="100">
                	<div class="comment-box text-center">
                    <h4>${myticket.gname}의 리뷰를 남겨주세요! </h4>
                    <input type="hidden" id="tknum" value="${myticket.tknum}"> 
                    <div class="rating"> 
                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> 
                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> 
                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> 
                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> 
                    </div>
                    <div class="comment-area"> 
                    	<textarea class="form-control" placeholder="what is your view?" rows="4"></textarea> 
                    </div>
                    <div class="text-center mt-4">
                   	 	<input type="hidden" id="gnum" value="${myticket.gnum}"> 
                    	<button class="btn btn-success send px-5">Send message <i class="fa fa-long-arrow-right ml-1"></i></button> 
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
						<c:forEach var="idx" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<a href="${pageContext.request.contextPath}/user/myTicket${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="${pageContext.request.contextPath}/user/myTicket${pageMaker.makeQuery(pageMaker.endPage + 1)}">
								» </a>
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
								<a href="#"><img src="img/logo.png" alt=""></a>
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


	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>
	


</body>

<script>
      $(document).ready(function () {
    	  
        $("goRivew").mouseleave(function () {
          $(this).removeClass("hover");
        });
        
       $(".fa").on("click",function(){
    	   $('.modal').modal('hide');
    	   
       });
       $(".rating").on("change",function(){
    	    var tmp_value = $('input:radio[name=rating]:checked').val();
    	       console.log(tmp_value);
       });
 
       $(".send").on("click",function(){
    	  console.log(this);
    	   
    	  let parent = $(this).parent("div").parent("div");
    	  let parent2 = parent.parent("div").parent("div");
    	  let parent3 = parent2.parent("div").parent("div");
    	  let lastParent = parent3.parent("div");
    	  
    	  let ordernum =  Number(lastParent.find("p").eq(2).text());
		  let bcontent = $("textarea").val();
		  let grstar =  $('input:radio[name=rating]:checked').val();
		  let gnum = Number($(this).parent("div").find("input").val());
		  let tknum = Number(parent.parent("div").find("input").val());
		  
		  let form = {
				  bcontent : bcontent,
				  grstar : grstar,
				  gnum : gnum,
				  ordernum : ordernum,
				  tknum : tknum
		  }
    	   
    	  console.log(tknum+"..."+ordernum);
		  
		  $.ajax({
	           type : "POST",
	           url : "/insertReview",	         
	           cache : false,
	           contentType:'application/json; charset=utf-8',
	            data: JSON.stringify(form), 
	           success: function (result) { 
	        	   
	        	   if(result=="SUCCESS"){
	        		   closeModal();	                     
		               console.log("작성완료");
	        	   }else{
	        		   alert("이미 작성했습니다");
	        		   closeModal();
	        	   }
	        	  	               
	                                   
	           },
	           error: function (e) {
	               console.log(e);
	           }
	       }) 
		  
		  
       });      
       
       
       
      });
    
      function closeModal(){
    	  $('.modal').modal('hide');
      }
      
      
    </script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<style >

</style>


<title>FAQ관리</title>

<!-- Google Font -->
<link	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/flaticon.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/barfiller.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/magnific-popup.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/slicknav.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/style.css" type="text/css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
		$(document).ready(function () {
			
		    
			$("#submitfaq").on("click",function(e){
				var token = $("meta[name='_csrf']").attr("content");
			    var header = $("meta[name='_csrf_header']").attr("content");
				
				 var btitle = $("#btitle").val();
		         var bcontent = $("#bcontent").val();
				
		         console.log(bcontent);
		         
		         
		         var form = {
		        		 btitle : btitle,
		        		 bcontent : bcontent
		         }
		         
		         console.log(JSON.stringify(form));
		         
		         $.ajax({
		             type : "POST",
		             url : "/admin/insertfaq",
		             beforeSend : function(xhr){
		    			  xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
		    		},
		             cache : false,
		             contentType:'application/json; charset=utf-8',
		             data: JSON.stringify(form), 
		             success: function (result) {       
		               if(result == "SUCCESS"){
		                  //list로               
		                  $(location).attr('href', '${pageContext.request.contextPath}/admin/faqpage');                            
		               }                       
		             },
		             error: function (e) {
		                 console.log(e);
		             }
		         })		         
			});
			
			
			$(".view-content").on("click",function(){	
				var token = $("meta[name='_csrf']").attr("content");
			    var header = $("meta[name='_csrf_header']").attr("content");
			    
				console.log("FAQ글보기");
				
				let bid = $(this).parents("tr").find("input").val();
				console.log("faq글번호"+bid);
				let divcontent = $(this).parents("tr");
				console.log(divcontent+".....");
				
				let url = "${pageContext.request.contextPath}/admin/faqpage/"+bid;
				
				let faqContent = divcontent.next("tr").find("input").val();
				console.log(faqContent);
				
				if(faqContent == bid){
					divcontent.next("tr").remove();
				}else{
					 $.ajax({
			               type: 'POST',
			               url: url,
			               dataType: 'JSON',
			               beforeSend : function(xhr){
				    		 xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
				    		},
			               cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐		            
			               success: function(result) {
								
			            	console.log(result);
			            	   
			               var htmls="";
			               

			           		htmls += '<tr>';
			           		htmls += '<input type="hidden" value='+result.bid+'>';
			          		htmls += '<td colspan="3">'+result.bcontent+'</td>';
			           		htmls += '</tr>';	           		

			           		divcontent.after(htmls);		           		
			               
			              }

			         });
				}

				
			});
			
		
		})
		
	
		
	
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
		<div class="canvas-search search-switch">
			<i class="fa fa-search"></i>
		</div>
		<nav class="canvas-menu mobile-menu">
			<ul>

				<li class="active"><a href="/">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/services.html">mypage</a></li>
				<li><a href="${pageContext.request.contextPath}/team.html">찜</a></li>
				<li><a href="${pageContext.request.contextPath}/services.html">지도</a></li>
				<li><a href="${pageContext.request.contextPath}/common/gymlist">시설찾기</a></li>


			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-youtube-play"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/today"> <img
							src="${pageContext.request.contextPath}/img/logo.png" alt=""
							width="500">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li class="active"><a href="$./index.html">Home</a></li>
							<li><a href="./services.html">mypage</a></li>
							<li><a href="./team.html">찜</a></li>
							<li><a href="./services.html">지도</a></li>
							<li><a href="/common/gymlist">시설찾기</a></li>

						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">
						<div class="to-search search-switch">
							<i class="fa fa-search"></i>
						</div>
						<div class="to-social">
							<a href="#">로그인</a> <a href="#">회원가입</a>

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
		<div class="container"
			style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-4">
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/manageMember">회원 관리</a></li>
						<li><a href="#">헬스장 사장님 관리</a></li>
						<li><a href="#">헬스장 관리</a></li>
						<li><a href="#">헬스장 신청서 목록</a></li>
						<li><a href="#">찜 결제 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/faqpage">FAQ 관리</a></li>
						<li><a href="#">1:1 답변 관리</a></li>
						<li><a href="#">공지/이벤트 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/requestpr">환불요청/리뷰삭제요청</a></li>
						<li><a href="#">매출 관리</a></li>
					</ul>
				</div>
				<!-- 사이드바 끝 -->
				<div class="col-8">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div>
						<h4 class="text-white">FAQ 관리</h4>
						<table class="text-white" style="text-align: center;" width="600" border="1" cellpadding="0"cellspacing="0" border="1">
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
						<c:forEach var="idx" begin="${pageMaker.startPage}"	end="${pageMaker.endPage }">
							<a href="faqpage${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="faqpage${pageMaker.makeQuery(pageMaker.endPage + 1) }">
								» </a>
						</c:if>					
						<br>
						<table class="text-white" width="600" border="1" cellpadding="0"cellspacing="0" border="1">
							<form:form id="insertfaq" action="${pageContext.request.contextPath}/insertfaq" method="post">
								<tr>
									<td>제목</td>
									<td><input width="200" type="text" id="btitle" name="btitle"></td>
								</tr>
								 <tr>
            						<td> 내용 </td>
           							 <td><textarea rows="10" cols="60" id="bcontent" name="bcontent" ></textarea></td>
         						</tr>
							</form:form>							
						</table>
						<button id="submitfaq" class="btn btn-light">FAQ작성</button>

					</div>
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
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>



</body>



</html>
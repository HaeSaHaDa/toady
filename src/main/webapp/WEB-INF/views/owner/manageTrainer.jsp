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
					<%@ include file="../layout/user_owner_menu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-9">
					<table class="table">
						 <thead class="thead-light">
						 <tr>
						 <th style="width: 80px;">트레이너 이름</th>
						 <th style="width: 250px;">트레이너 소개 및 경력</th>
						 <th style="width: 40px;">수정</th>
						 <th style="width: 40px;">삭제</th>						 
						 </tr>
						 </thead>
						 <tbody>					 
						
						 <c:forEach items="${trainer}" var="trainer">
						 	<tr style="color: white;">
						 		<td class="trainer-name">${trainer.gtname}</td>
						 		<td style="word-break:break-all;" class="trainer-career">${trainer.gtcareer}</td>
						 		<td class="updateTrainer">수정</td>
						 		<td class="delete-trainer">X</td>
						 	</tr>
						 </c:forEach>
						
						 </tbody>
					</table>
					<br>
					
					<table class="text-white" width="700" border="1" cellpadding="0" cellspacing="0" border="1">
							<form id="insertTrainer" action="${pageContext.request.contextPath}/insertTrainer" method="post">
								<tr>
									<td style="width: 140px;">트레이너 이름</td>
									<td><input width="200" type="text" id="gtname" name="gtname"></td>
								</tr>
								<tr>
									<td style="width: 140px;">소개 및 경력</td>
									<td><textarea rows="10" cols="60" id="gtcareer" name="gtcareer"></textarea></td>
								</tr>
							</form>
						</table>
						<br>
						<button id="submit-trainer" class="btn btn-light">트레이너 등록</button>
					
					
				</div>
			</div>
		</div>
	</section>
	<!-- 마이페이지 내용물 끝 -->
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
							<a href="#"><img src="/img/logo.png" alt=""></a>
						</div>
						<p>오늘의 짐은 운동을 원하는 고객을 Gym 운영자와 연결해 주는 서비스를 제공합니다.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a
								href="#"><i class="fa  fa-envelope-o"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>오늘의</h4>
						<ul>
							<li><a href="#">오금환</a></li>
							<li><a href="#">김보람</a></li>
							<li><a href="#">마성주</a></li>

						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>GYM</h4>
						<ul>
							<li><a href="#">문지윤</a></li>
							<li><a href="#">송인규</a></li>
							<li><a href="#">윤정아</a></li>			
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="fs-widget">
						<h4>Tips & Guides</h4>
						<div class="fw-recent">
							<h6>
								<a href="#">운동을 위해 시간을 내지 않는다면 병때문에 시간을 내게될지 모른다.</a>
							</h6>
							<ul>
								<li>로빈 샤머</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">우리가 늙어서 운동을 그만 두는 거싱 아니라, 우리가 운동을 그만두기 때문에 늙는 것이다. </a>
							</h6>
							<ul>
								<li>케너스 쿠퍼</li>
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
<script type="text/javascript">
$(document).ready(function(){
	checkList();
	
	$("#submit-trainer").on("click",function(){
		console.log("트레이너등록버튼");
		
		var gtname = $("#gtname").val();
		var gtcareer = $("#gtcareer").val();

		console.log(gtcareer);

		if(gtname ==""){
			alert("이름을 입력해주세요!");
		}else if(gtcareer==""){
			alert("내용을 입력해주세요!");
		}else{
			var form = {
					gtname : gtname,
					gtcareer : gtcareer
			}
			console.log(JSON.stringify(form));
			
			$.ajax({
				type : "POST",
				url : "/owner/insertTrainer",
				cache : false,
				contentType : 'application/json; charset=utf-8',
				data : JSON	.stringify(form),
				success : function(	result) {
					if (result == "SUCCESS") {
						//list로               
						$(location).attr('href','${pageContext.request.contextPath}/owner/manageTrainer');
					}
				},
				error : function(e) {
					console.log(e);
				}
			})
		}
		
		

		
		
	});

	$(".updateTrainer").on("click",function(){
		console.log("수정누름");
		
			let name = $(this).parent("tr").find(".trainer-name").text();
			console.log(name);
			let check = $(this).parent("tr").next("tr").find("input").val();
			console.log(check);
			if(name != check){
				let num = $("tbody .update-tr").length;
				
				console.log(num+"..........");
				if(num==0){
					htmls ='';
					
					htmls +='<tr class = "update-tr">';
					htmls +='<form id="update-tr">';
					htmls +='<input type="hidden" id="name" value = "'+name+'">';
					htmls += '<td colspan="3"><textarea id="career" class="career" cols="80" ></textarea></td>';
					htmls +='</form>';
					htmls += '<td><button id="go" onclick= "goUpdate()" class="btn btn-light">수정</button></td>';
					htmls += '</tr>';
					$(this).parent("tr").after(htmls);
				}else{
					alert("한개만 수정해주세요!");
				}				
			}else{
				$(this).parent("tr").next(".update-tr").remove();
			}		
	});	
	
	$(".delete-trainer").on("click",function(){
		console.log("트레이너 삭제버튼 누르는중");		
		
		let name=$(this).parent("tr").find(".trainer-name").text();
		
		
		console.log("트레이너이름..."+name);
		
		$.ajax({
			type : "POST",
			url : "/owner/deleteTrainer/"+name,
			cache : false,
			success : function(	result) {
				if (result == "ok") {
					alert("삭제완료!");             
					$(location).attr('href','${pageContext.request.contextPath}/owner/manageTrainer');
				}
			},
			error : function(e) {
				console.log(e);
			}
		})

})

});
function goUpdate(){
	console.log("수정버튼 누르고 함수실행됨!");
	
	var gtname = $("#name").val();
	var gtcareer = $("#career").val();

	console.log(gtname,gtcareer);

	var form = {
			gtname : gtname,
			gtcareer : gtcareer
	}

	console.log(JSON.stringify(form));
	
	$.ajax({
		type : "POST",
		url : "/owner/updateCareer",
		cache : false,
		contentType : 'application/json; charset=utf-8',
		data : JSON	.stringify(form),
		success : function(	result) {
			if (result == "SUCCESS") {
				alert("수정완료!");             
				$(location).attr('href','${pageContext.request.contextPath}/owner/manageTrainer');
			}
		},
		error : function(e) {
			console.log(e);
		}
	})	
	
}

function checkList(){
	let check = $(".trainer-name").text();
	
	if(check == ""){
		htmls = "";
		
		htmls += '<tr>';
		htmls += '<td colspan="4"><h2>등록된 트레이너가 없습니다.</h2></td>';
		htmls += '<td>';
		
		$("tbody").append(htmls);
	}
	
}


</script>
</html>
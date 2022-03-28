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
						 	<input type="hidden" id="gnum" value="${trainer.gnum}">
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
									<td style="width: 140px;">시설 이름</td>
									<td><input width="200" type="text" id="gname" name="gname"></td>
								</tr>
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
	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
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
		var gname = $("#gname").val();

		console.log(gtcareer);

		if(gtname ==""){
			alert("이름을 입력해주세요!");
		}else if(gtcareer==""){
			alert("내용을 입력해주세요!");
		}else if(gname==""){
			alert("내용을 입력해주세요!");
		}else{
			var form = {
					gtname : gtname,
					gtcareer : gtcareer,
					gname : gname
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
			let gnum = $(this).parent("tr").find("input").val();
			
			if(name != check){
				let num = $("tbody .update-tr").length;
				
				console.log(num+"..........");
				if(num==0){
					htmls ='';
					
					htmls +='<tr class = "update-tr">';
					htmls +='<form id="update-tr">';
					htmls +='<input type="hidden" id="name" value = "'+name+'">';
					htmls +='<input type="hidden" id="gymnum" value = "'+gnum+'">';
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
		let gnum = $(this).parent("tr").find("input").val();
		
		console.log("트레이너이름..."+name);
		console.log("시설번호..."+gnum);
		
		var form = {
				gtname : name,
				gnum : gnum,
		}
		console.log(JSON.stringify(form));
		
		$.ajax({
			type : "POST",
			url : "/owner/deleteTrainer",
			cache : false,
			contentType : 'application/json; charset=utf-8',
			data : JSON	.stringify(form),
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
	var gnum = $("#gymnum").val();
	
	console.log(gtname,gtcareer);

	var form = {
			gtname : gtname,
			gtcareer : gtcareer,
			gnum : gnum
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
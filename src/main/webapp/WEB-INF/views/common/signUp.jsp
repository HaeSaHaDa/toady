<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
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

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!--Script -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>오늘의 짐</title>
</head>
<body  style="background-color: dark">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/today">오늘의 짐</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">

			<!-- if 문법 -->
			<!-- otherwise부분은 로그인 된 사람이 사용 -->
			<c:choose>
				<c:when test="${empty principal}">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signup">회원가입</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link">${principal.user.memail}님 환영합니다.</a></li>
					</ul>

				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<br />


<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>
        <script>
            function checkAll() {
                if (!checkUserId(form.id.value)) {
                    return false;
                } else if (!checkPassword(form.id.value, form.password1.value, form.password2.value)) {
                    return false;
                } else if (!checkMail(form.mail.value)) {
                    return false;
                } else if (!checkName(form.nickname.value)) {
                    return false;
                } else if (!checkFavorite()) {
                    return false;
                } 
                return true;
            }
            function checkExistData(value, dataName) {
                if (value == "") {
                    alert(dataName + " 입력해주세요!");
                    return false;
                }
                return true;
            }
            function checkUserId(id) {
                //Id가 입력되었는지 확인하기
                if (!checkExistData(id, "아이디를")) 
                    return false;
                
                var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
                if (!idRegExp.test(id)) {
                    alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
                    form.userId.value = "";
                    form
                        .id
                        .focus();
                    return false;
                }
                return true; //확인이 완료되었을 때
            }

            function checkPassword(id, password1, password2) {
                //비밀번호가 입력되었는지 확인하기
                if (!checkExistData(password1, "비밀번호를")) 
                    return false;
                
                //비밀번호 확인이 입력되었는지 확인하기
                if (!checkExistData(password2, "비밀번호 확인을")) 
                    return false;
                
                var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
                if (!password1RegExp.test(password1)) {
                    alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
                    form.password1.value = "";
                    form
                        .password1
                        .focus();
                    return false;
                }
                //비밀번호와 비밀번호 확인이 맞지 않다면..
                if (password1 != password2) {
                    alert("두 비밀번호가 맞지 않습니다.");
                    form.password1.value = "";
                    form.password2.value = "";
                    form
                        .password2
                        .focus();
                    return false;
                }

                //아이디와 비밀번호가 같을 때..
                if (id == password1) {
                    alert("아이디와 비밀번호는 같을 수 없습니다!");
                    form.password1.value = "";
                    form.password2.value = "";
                    form
                        .password2
                        .focus();
                    return false;
                }
                return true; //확인이 완료되었을 때

            }

            function checkMail(mail) {
                //mail이 입력되었는지 확인하기
                if (!checkExistData(mail, "이메일을")) 
                    return false;
                
                var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
                if (!emailRegExp.test(mail)) {
                    alert("이메일 형식이 올바르지 않습니다!");
                    form.mail.value = "";
                    form
                        .mail
                        .focus();
                    return false;
                }
                return true; //확인이 완료되었을 때
            }


                
        </script>
>>>>>>> 44c3f050df83ab8f9b078ff5e96e8d90ea7b9370
<div class="container">
	<form name="form">
		<div class="form-group">
			<label for="mid">Username:</label> 
			<input type="text" class="form-control" placeholder="Enter password" id="mid" maxlength="50px" name="userId">
			<input type="button" onclick="id_check(event)" value="중복확인">
			<span id="id_check_alert" style="color: red;"> 중복확인 안됨</span>
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" id="mpassword" name="password1">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" name="password2">
		</div>
		<div class="form-group">
			<label for="memail">Emial:</label> <input type="email" class="form-control" placeholder="Enter Email" id="memail" name="mail">
		</div>
		<div class="form-group">
			<label for="mnickname">닉네임:</label> <input type="text" class="form-control" placeholder="Enter nickname" id="mnickname" name="nickname">
		</div>
		<div class="form-group">
			<label for="mphone">전화번호:</label> <input type="text" class="form-control" placeholder="Enter phoneNumber" id="mphone" name="phone">
		</div>
		<div class="form-group">
			<label for="mbirth">생년월일:</label> <input type="text" class="form-control" placeholder="Enter birthday" id="mbirth" name="birth">


		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입하기</button>
</div>
<script>
//중복 회원 가입 
			//회원 중복 체크
			let check = false;
			async function id_check(e){
			e.preventDefault();
			console.log(1);
				var mid = $('#mid').val();
				/* alert(problem_id); */

				if (mid == "") {
					return false;
				}

				await
				$.ajax({
					url : "idcheck.do",
					type : "POST",
					data : {
					"mid" : mid
					},
						success : function(data) {
						// 있는 문제
							if (data.flag) {
								alert("이미 등록된 ID입니다.");
								$("#id_check_alert").html("이미 등록된 ID입니다.");
								$("#id_check_alert").css("color", "red");
								mid.value = "";
								check = false;
								console.log(2);
								console.log(check);
								
							}
						// 없는 문제
							else {
								alert("등록 가능한 ID입니다.");
								$("#id_check_alert").html("중복확인 완료");
								$("#id_check_alert").css("color", "#7BC379");
								check = true;
								console.log(3);
								console.log(check);
								
							}	
							console.log(4);
							console.log(check);
							console.log("checkDuplicating success!");
						},
						error : function() { /* 404, 415, 400등 이런 에러 발생 시 실행 */
						console.log("checkDuplicating error!");
						console.log(5);
						console.log(check);
	
						}
				});
					console.log(6);
					console.log(check);
				
			}
			console.log(7);
			console.log(check);
			
			
			
</script>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

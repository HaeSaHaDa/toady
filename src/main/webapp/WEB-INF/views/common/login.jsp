<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>

<div class="container" style="height: 500px">
	<!-- form이용하려면 name 값이 필요. -->
	<form action="/common/loginProc" method="post">
		<div class="form-group">
<<<<<<< HEAD
			<label for="memail">Username:</label> 
=======
			<label for="mid">Username:</label> 
>>>>>>> 4d46fdba26ae5018a247bc13d51a64b2235e2576
			<input type="text" name="mid" class="form-control" placeholder="Enter Username" id="mid">
		</div>
		<div class="form-group">
			<label for="mpassword">Password:</label> 
			<input type="password" name="mpassword" class="form-control" placeholder="Enter password" id="mpassword">
		</div>

		<button id="btn-login" class="btn btn-primary">로그인</button>
		<a href="/oauth2/authorization/kakao"> 
		<img height="38px" src="/img/kakao_login_button3.png" /></a> 
		<a href="/oauth2/authorization/google"><img height="38px" src="/img/google_login_button2.png"></a>
		<a href="/oauth2/authorization/naver"><img height="38px" src="/img/naver_login_button.png"></a>
	</form>

</div>
<!-- form으로 값을 보내려면 하면 button은 form태그 안에, js파일의 ajax를 이용하려고 한다면 button은 form태그 밖에 있어야 한다. -->
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>


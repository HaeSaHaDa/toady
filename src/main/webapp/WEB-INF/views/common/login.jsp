<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>

<div class="container">
<!-- form이용하려면 name 값이 필요. -->
	<form action="/common/loginProc" method="post">
		<div class="form-group">
			<label for="memail">Username:</label> 
			<input type="text" name="memail" class="form-control" placeholder="Enter Username" id="memail">
		</div>
		<div class="form-group">
			<label for="mpassword">Password:</label> 
			<input type="password" name="mpassword" class="form-control" placeholder="Enter password" id="mpassword">
		</div>

		<button id="btn-login" class="btn btn-primary">로그인</button>
	</form>

</div>
<!-- form으로 값을 보내려면 하면 button은 form태그 안에, js파일의 ajax를 이용하려고 한다면 button은 form태그 밖에 있어야 한다. -->
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>


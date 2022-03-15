<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="form-group">
			<label for="mid">Username:</label> <input type="text" class="form-control" placeholder="Enter password" id="mid">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" id="mpassword">
		</div>
		<div class="form-group">
			<label for="memail">Emial:</label> <input type="email" class="form-control" placeholder="Enter Email" id="memail">
		</div>
		<div class="form-group">
			<label for="mnickname">닉네임:</label> <input type="text" class="form-control" placeholder="Enter nickname" id="mnickname">
		</div>
		<div class="form-group">
			<label for="mphone">전화번호:</label> <input type="text" class="form-control" placeholder="Enter phoneNumber" id="mphone">
		</div>
		<div class="form-group">
			<label for="mbirth">생년월일:</label> <input type="text" class="form-control" placeholder="Enter birthday" id="mbirth">
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입하기</button>

</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

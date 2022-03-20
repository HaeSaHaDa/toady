<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<!-- 수정하지 않기 위해 readonly를 걸어놔  -->
		<input type="hidden" id="mnum" value="<sec:authentication property="principal.user.mid"/>" />
		<div class="form-group">
			<label for="mid">Username:</label> 
			<input type="hidden" class="form-control" placeholder="Enter password" id="mid" maxlength="50px" name="userId">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" id="mpassword" name="password1">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" name="password2">
		</div>

	</form>
	<button id="btn-pwupdate" class="btn btn-primary">비밀번호수정완료</button>

</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>
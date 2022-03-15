<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>


<div class="container">
	<form>
		<input type="hidden" id="mnum" value="${principal.user.mnum}" />
	<div class="form-group">
			<label for="mid">ID:</label> <input type="text" value="<sec:authentication property="principal.user.mid"/>" class=" form-control" placeholder="Enter Id" id="mid" readonly>
		</div> 
		<c:choose>
			<c:when test="${empty principal}">
				<a href="/user/updatePassword" class="btn btn-primary">비밀번호 변경</a>
				<br />
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<br />
		<div class="form-group">
			<label for="memail">Emial:</label> <input type="email" value="<sec:authentication property="principal.user.memail"/>" class=" form-control" placeholder="Enter Email" id="memail" readonly>
		</div>
		<div class="form-group">
			<label for="mnickname">닉네임:</label> <input type="text" value="<sec:authentication property="principal.user.mnickname"/>" class="form-control" placeholder="Enter nickname" id="mnickname">
		</div>
		<div class="form-group">
			<label for="mphone">전화번호:</label> <input type="text" value="<sec:authentication property="principal.user.mphone"/>" class="form-control" placeholder="Enter phoneNumber" id="mphone">
		</div>
		<div class="form-group">
			<label for="mbirth">생년월일:</label> <input type="text" value="<sec:authentication property="principal.user.mbirth"/>" class="form-control" placeholder="Enter birthday" id="mbirth">
		</div>
	</form>
	<button id="btn-update" class="btn btn-primary">회원정보 수정하기</button>

</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>

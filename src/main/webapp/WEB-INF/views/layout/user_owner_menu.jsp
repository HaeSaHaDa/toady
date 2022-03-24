<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="sidebar-option">
	<div class="so-categories">
		<h5 class="title">MyPage</h5>
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/memberInfo">내 정보</a></li>
			<li><a href="${pageContext.request.contextPath}/user/myTicket">내 이용권</a></li>
			<li><a href="${pageContext.request.contextPath}/user/note">쪽지</a></li>
			<li><a href="${pageContext.request.contextPath}/user/helpBoard">1:1문의</a></li>
			<li><a href="${pageContext.request.contextPath}/user/noticeBoard">공지/이벤트</a></li>
			<li><a href="${pageContext.request.contextPath}/user/registerGym">시설 등록 신청</a></li>
			<sec:authorize access="hasRole('USER')">
				<li><a href="${pageContext.request.contextPath}/owner/manageGym">시설 등록 내역</a></li>
				<li><a href="${pageContext.request.contextPath}/owner/manageTrainer">트레이너 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/owner/gymMemberList">회원 목록 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/owner/totalSales_gym">매출 관리</a></li>
			</sec:authorize>
		</ul>
	</div>
</div>
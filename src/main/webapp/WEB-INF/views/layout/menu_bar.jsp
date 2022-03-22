<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<ul>
	<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
	<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
	<li><a href="${pageContext.request.contextPath}/user/gymlist">시설찾기</a></li>
	<li><a href="${pageContext.request.contextPath}/common/faqboard">FAQ</a></li>
	<sec:authorize access="hasRole('USER')">
		<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
		<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
	</sec:authorize>
	<sec:authorize access="hasRole('USER')">
		<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
	</sec:authorize>
</ul>

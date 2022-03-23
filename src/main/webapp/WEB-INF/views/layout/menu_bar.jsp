<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<ul>
	<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
	<li><a href="${pageContext.request.contextPath}/common/gymLists">시설찾기</a></li>
	<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
	<li><a href="${pageContext.request.contextPath}/common/faqboard">FAQ</a></li>
	<sec:authorize access="hasRole('USER')">
		<li><a href="#">mypage</a>
			<ul class="dropdown">
				<li><a href="${pageContext.request.contextPath}/user/myTicket">내 이용권</a></li>
				<li><a href="${pageContext.request.contextPath}/user/memberInfo">내 정보</a></li>
				<li><a href="${pageContext.request.contextPath}/user/note">쪽지</a></li>
				<li><a href="${pageContext.request.contextPath}/user/faqboard">FAQ</a></li>
				<li><a href="${pageContext.request.contextPath}/user/helpBoard">1:1문의</a></li>
				<li><a href="${pageContext.request.contextPath}/user/noticeBoard">공지/이벤트</a></li>
				<li><a href="${pageContext.request.contextPath}/user/registerGym">시설 등록 신청</a></li>
				<sec:authorize access="hasRole('USER')">
					<li><a href="${pageContext.request.contextPath}/owner/manageGym">시설 등록 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/owner/manageTrainer">트레이너 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/owner/gymMemberList">회원 목록 보기</a></li>
					<li><a href="${pageContext.request.contextPath}/owner/totalSales_gym">매출 관리</a></li>
				</sec:authorize>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
	</sec:authorize>
	<sec:authorize access="hasRole('USER')">
		<li><a href="#">AdminPage</a>
			<ul class="dropdown">
				<li><a href="${pageContext.request.contextPath}/admin/manageMember">회원 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/ownerList">헬스장 사장님 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/gymListInventory">헬스장 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/registerGym">헬스장 신청서 목록</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/gymOrderList">찜 결제 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/faqpage">FAQ 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/helpList">1:1 답변 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/noticeBoard">공지/이벤트 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/requestpr">환불요청/리뷰삭제요청</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/manageReivew">리뷰관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/totalSales">매출 관리</a></li>
			</ul></li>
	</sec:authorize>
</ul>

<%-- <ul>
	<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
	<li><a href="${pageContext.request.contextPath}/common/findMap">지도</a></li>
	<li><a href="${pageContext.request.contextPath}/common/gymLists">시설찾기</a></li>
	<li><a href="${pageContext.request.contextPath}/common/faqboard">FAQ</a></li>
	<sec:authorize access="hasRole('USER')">
		<li><a href="${pageContext.request.contextPath}/user/myTicket">mypage</a></li>
		<li><a href="${pageContext.request.contextPath}/user/wishlist">찜</a></li>
	</sec:authorize>
	<sec:authorize access="hasRole('USER')">
		<li><a href="${pageContext.request.contextPath}/admin/adminPage">AdminPage</a></li>
	</sec:authorize>
</ul> --%>
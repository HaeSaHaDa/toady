<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Home</title>
</head>
<body>
   
   <table width="500" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>요청 번호</td>
         <td>요청 이름</td>
         <td>요청 주소</td>
         <td>연락처</td>
      </tr>
      <c:forEach items="${registList}" var="regist">
      <tr>
         <td>${regist.storenum}</td>
         <td>${regist.storename}</td>
         <td>${regist.storeadr}</td>
         <td>${regist.storetel}</td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5"> <a href="/today">홈</a> </td>
      </tr>
   </table>
</body>
</html>
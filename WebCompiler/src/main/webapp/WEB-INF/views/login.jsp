<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/web/login.do">
아이디 <br>
<input type="text" name="user_id">
<p> 비밀번호 <br>
<input type="text" name="user_passwd">
<button type="submit">로그인</button>
</form> 

<c:if test="${msg == false}">
	<p id="alert_msg" style="color:red"> 존재하지 않거나 비밀번호가 일치하지 않습니다.
	</p>
</c:if>
</body>
</html>
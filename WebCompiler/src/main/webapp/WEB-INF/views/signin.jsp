<%@page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%	
	String imgURL = "";
	if(request.getAttribute("user") !=null) {
		UserVO user = (UserVO)request.getAttribute("user");
		if(user.getUser_img() == null) {
			imgURL = (String)request.getContextPath() + "/resources/images/user.png";
		} else {
			imgURL = "/getByteImage/" + user.getUser_id();
		}
	}
%>

<html>
<head>
<title>CODE SPACE</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/signin.css" />
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="<%=imgURL%>" />
			</jsp:include>
			<div class="inner">
				<div class="signin_form">
					<form id="form" method="post" action="/login.do">
						<div class="inputBox">
							<input type="text" name="user_id" onclick="alert_event()">
							<label>USER ID</label>
						</div>
						<div class="inputBox">
							<input type="password" style="all: initial !important; border-bottom: 1px solid black !important; width: 100% !important;" name="user_passwd" onclick="alert_event()">
							<!-- <input id="temp_password"
								style="-webkit-text-security: square !important;" type="text"
								name="user_passwd" onclick="alert_event()"> -->
							<!-- <input id="password" type="text" name="user_passwd" style="display: none !important;"> -->
							<label>PASSWORD</label>
						</div>
						<div class="signupHelp">
							<span>계정이 없으신가요?</span> <a href="/join">회원가입</a>
						</div>
						<input type="submit" value="LOGIN">
					</form>
					<c:if test="${msg == false}">
						<p id="alert_msg" style="color: red; visibility: visible">
							<img class="alert_img"
								src="<%=request.getContextPath()%>/resources/images/alert.png"
								width="15" height="15" style="vertical-align: middle;" /> 존재하지
							않거나 비밀번호가 일치하지 않습니다.
						</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<!-- <script>
			const form = document.getElementById('form');
			const tempPassword = document.getElementById('temp_password');
			const password = document.getElementById('password');
			const userCheck = (event) => {
						event.preventDefault();
						password.value = tempPassword.value;
						console.log(password.value);
						console.log(tempPassword.value);
						form.submit();
					}
			form.addEventListener("submit", userCheck);
		</script> -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
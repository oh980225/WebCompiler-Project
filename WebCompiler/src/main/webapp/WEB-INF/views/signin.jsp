<%@page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
		<title>Full-Stack</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signin.css" />
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<!-- Header -->
						<header id="header">
							<a class="main_logo" href="/"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="/problem"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="/board"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<c:if test="${user.user_id == null}">
							<a class="header_signup" href="/join"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="/login"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
							</c:if>
							<c:if test="${user.user_id != null}">
							<a class="header_signout" href="/logout.do"><img src="<%=request.getContextPath()%>/resources/images/header_signout.png" alt="로그아웃" /><span>로그아웃</span></a>
							<div class="header_profile" style="cursor: pointer;" onClick="location.href='/mypage'">
								<img class="img" src=<%=imgURL%> alt="사용자 사진">
								<div class="name_intro">
									<div class="header_name">
										<a href="?name=Mr.O">${user.user_name}</a>
									</div>
									<div class="header_intro">
										${user.user_introduce}
									</div>
								</div>
							</div>
							</c:if>
						</header>
						<div class="inner">
							<div class="signin_form">
								<form id="form" method="post" action="/login.do" >
									<div class="inputBox">
										<input type="text" name="user_id" onclick="alert_event()">
										<label>USER ID</label>
									</div>
									<div class="inputBox">
										<input id="temp_password" style="-webkit-text-security: disc !important;"type="text" name="user_passwd" onclick="alert_event()" >
										<!-- <input id="password" type="text" name="user_passwd" style="display: none !important;"> -->
										<label>PASSWORD</label>
									</div>
									<div class="signupHelp">
										<span>계정이 없으신가요?</span> <a href="#">회원가입</a>
									</div>
									<input type="submit" value="LOGIN">
								</form>
								<c:if test="${msg == false}">
									<p id="alert_msg" style="color:red; visibility:visible"><img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" style="vertical-align: middle;" /> 존재하지 않거나 비밀번호가 일치하지 않습니다.</p>
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
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>
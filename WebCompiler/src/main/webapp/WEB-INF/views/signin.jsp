<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
							<a class="main_logo" href="index.html"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="mycode.html"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="Q&A.html"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<a class="header_signup" href="#"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="signin.html"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
						</header>
						<div class="inner">
							<div class="signin_form">
								<form>
									<div class="inputBox">
										<input type="text" name="" value="">
										<label>USER ID</label>
									</div>
									<div class="inputBox">
										<input type="password" name="" value="">
										<label>PASSWORD</label>
									</div>
									<div class="signupHelp">
										<span>계정이 없으신가요?</span> <a href="#">회원가입</a>
									</div>
									<input type="submit" name="" value="LOGIN">
								</form>
							</div>
						</div>
					</div>
			</div>
		<!-- Scripts -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>
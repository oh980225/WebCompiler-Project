<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>코드 스페이스</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" type="text/css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<!-- Header -->
								<!--<header id="header">
									<a href="/" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
									<!-- 바꾸기 -->																
									<!--<c:if test="${user.user_id == null}">
										<ul class="icons">
											<li><a href="/login">로그인</a></li>
											<li><a href="/join">회원가입</a></li>
										</ul>
									</c:if>
									<c:if test="${user.user_id != null}">
										<ul class="icons">
											<li><a href="/logout.do">로그아웃</a></li>
										</ul>
									</c:if>				
								</header> -->
						<!-- -->
						<!-- Header -->
						<header id="header">

							<a class="main_logo" href="/"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="/problem"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="/board"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<a class="header_signup" href="/signin"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="/join"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
						</header>
						<div class="inner">
							<!-- Banner -->
								<section id="banner">
									
								</section>

							<!-- Section -->
								<section>

								</section>

							<!-- Section -->
								<section>
									
								</section>

						</div>
					</div>

				<!-- Sidebar -->
				<!-- 
					<div id="sidebar">
						<div class="inner">
							
								<nav id="menu">
									<header class="major">
										<img class="icon" src="<%=request.getContextPath()%>/resources/images/user.png">
										
										<c:if test="${user.user_id == null}">
										<h3 class="name"><a href="/login">먼저 로그인 해주세요!</a></h3>
										</c:if>
										<c:if test="${user.user_id != null}">
											<h3 class="name"><a href="/mypage">${user.user_id}</a></h3>
										</c:if>
									</header>
									<ul>
										
										<li><a href="/"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
										
										<li><a href="/problem"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
										<li><a href="/board"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</a>
										</li>
									</ul>
								</nav>
						</div>
					</div>
					
				 -->
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>

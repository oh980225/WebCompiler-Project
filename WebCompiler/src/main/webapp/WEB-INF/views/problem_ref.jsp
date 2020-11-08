<%@page import="org.dms.web.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
	<title>CODE SPACE</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_problem.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<header id="header">
				<a href="/" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
				<ul class="icons">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</header>
			<div class="inner">
				<!-- Content -->
				<section>
					<h3 class="problem_title">코드 조회</h3>
					<br>
					<!-- Break -->
					<div class="col-12 lvel">
						<select name="demo-category" id="demo-category">
							<option value="">- Level -</option>
							<option value="1">Bronze</option>
							<option value="1">Silver</option>
							<option value="1">Gold</option>
						</select>
						<div class="select_arrow"></div>
					</div>
					<!-- Break -->
					<div class="col-12 kind">
						<select name="demo-category" id="demo-category1">
							<option value="">- 분류 -</option>
							<option value="1">Sort</option>
							<option value="1">Tree</option>
							<option value="1">For</option>
							<option value="1">While</option>
							<option value="1">If</option>
							<option value="1">DP</option>
						</select>
						<div class="select_arrow"></div>
					</div>
					<div class="col-12 name">
						<select name="demo-category" id="demo-category2">
							<option value="">- 제목 -</option>
							<option value="1">Sort</option>
							<option value="1">Tree</option>
							<option value="1">For</option>
							<option value="1">While</option>
							<option value="1">If</option>
							<option value="1">DP</option>
						</select>
						<div class="small_arrow"></div>
					</div>
					<input class="search" type="text" name="search" placeholder="검색">

					<br>
					<div class="container">
						<div class="problem_container_left">
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level1">
									LEVEL 1
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level2">
									LEVEL 2
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level3">
									LEVEL 3
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="" alt="">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level1">
									LEVEL 1
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="" alt="">
								</div>
							</div>
						</div>
						<div class="problem_container_right">
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level2">
									LEVEL 2
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="" alt="">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level3">
									LEVEL 3
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="" alt="">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level1">
									LEVEL 1
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="" alt="">
								</div>
							</div>
							<div class="problem_item" onclick="location.href='#'">
								<h5>1236. 나는야 포켓몬 마스터</h5>
								<div class="problem_level2">
									LEVEL 2
								</div>
								<div class="problem_percent">
									정답률:28.4%
								</div>
								<br>
								<div class="problem_submit">
									제출:2647
								</div>
								<div class="problem_answer">
									맞은사람:967
								</div>
								<div class="problem_check">
									<img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O">
								</div>
							</div>
						</div>
					</div>
					<div class="page">
						<ul class="paging">
							<li class="page_num"><a href="#">
									<
							</li>
							<li class="page_num"><a href="#">1</a></li>
							<li class="page_num"><a href="#">2</a></li>
							<li class="page_num"><a href="#">3</a></li>
							<li class="page_num">...</li>
							<li class="page_num"><a href="#">8</a></li>
							<li class="page_num"><a href="#">9</a></li>
							<li class="page_num"><a href="#">10</a></li>
							<li class="page_num"><a href="#">></a></li>
						</ul>
					</div>
					</form>
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<img class="icon" src="<%=request.getContextPath()%>/resources/images/user.png">
										<!-- 사용자의 닉네임 클릭시 마이페이지로 이동 -->
										<c:if test="${user.user_id == null}">
										<h3 class="name"><a href="/login">먼저 로그인 해주세요!</a></h3>
										</c:if>
										<c:if test="${user.user_id != null}">
											<h3 class="name"><a href="/mypage">${user.user_id}</a></h3>
										</c:if>
									</header>
									<ul>
										<!-- 사이드 메뉴바에 Main Page 클릭시 메인페이지로 이동 -->
										<li><a href="/"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
										<!-- 사이드 메뉴바에 Problem 클릭시 문제 페이지로 이동 -->
										<li><a href="/problem"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
										<li><a href="/board"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</a>
										</li>
									</ul>
								</nav>
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











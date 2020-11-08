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
	<title>CODESPACE</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_code.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<<!-- Header -->
						<header id="header">
							<a class="main_logo" href="index.html"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="mycode.html"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="Q&A.html"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<a class="header_signup" href="#"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="signin.html"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
						</header>
			<div class="inner">
				<!-- Content -->
				<section>
					<h3 class="board_title">코드 조회</h3>
					<br>
					<!-- Break -->
						<div class="col-12 level">
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
									<option value="">- AC/WA -</option>
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
							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>레벨</th>
											<th>제출</th>
											<th>AC/WA</th>
										</tr>
									</thead>
									<tbody>
										<tr onClick="location.href='#'">
											<td>1012</td>
											<td>친구 네트워크</td>
											<td>
												<div class="problem_level1">
													LEVEL 1
												</div>
											</td>
											<td>2019.02.26</td>
											<td><img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O"></td>
										</tr>
										<tr onClick="location.href='#'">
											<td>1012</td>
											<td>친구 네트워크</td>
											<td>
												<div class="problem_level2">
													LEVEL 2
												</div>
											</td>
											<td>2019.02.26</td>
											<td><img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O"></td>
										</tr>
										<tr onClick="location.href='#'">
											<td>1012</td>
											<td>친구 네트워크</td>
											<td>
												<div class="problem_level3">
													LEVEL 3
												</div>
											</td>
											<td>2019.02.26</td>
											<td><img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O"></td>
										</tr>
										<tr onClick="location.href='#'">
											<td>1012</td>
											<td>친구 네트워크</td>
											<td>
												<div class="problem_level1">
													LEVEL 1
												</div>
											</td>
											<td>2019.02.26</td>
											<td><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="20em" height="20em" alt="O"></td>
										</tr>
										<tr onClick="location.href='#'">
											<td>1012</td>
											<td>친구 네트워크</td>
											<td>
												<div class="problem_level2">
													LEVEL 2
												</div>
											</td>
											<td>2019.02.26</td>
											<td><img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="page">
								<ul class="paging">
									<li class="page_num"><a href="#"><</a></li>
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











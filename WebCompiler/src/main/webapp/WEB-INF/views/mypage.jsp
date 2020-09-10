<%@ page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Page</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_mypage.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/modal.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_code.css" />
</head>

<body class="is-preload">
<%	
	String imgURL = "";
	UserVO user = (UserVO)request.getAttribute("user");
	if(user.getUser_img() == null) {
		imgURL = (String)request.getContextPath() + "/resources/images/user.png";
	} else {
		imgURL = "/getByteImage/" + user.getUser_id();
	}
%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
		<!-- Header -->
						<header id="header">
							<a class="main_logo" href="index.html"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="mycode.html"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="Q&A.html"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<c:if test="${user.user_id == null}">
							<a class="header_signup" href="#"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="signin.html"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
							</c:if>
							<c:if test="${user.user_id != null}">
							<a class="header_signout" href="#"><img src="<%=request.getContextPath()%>/resources/images/header_signout.png" alt="로그아웃" /><span>로그아웃</span></a>
							<div class="header_profile">
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
			<!-- Header -->
			<!--  
								<header id="header">
									<a href="/web" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
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
			<div class="inner">
				<!-- Content -->
				<section class="profile">
					<div class="profile_img">
						<img class="img" src=<%=imgURL%>>
						<form id="img_form" action="/mypage/saveImage" enctype="multipart/form-data" method="post">
							<input type="hidden" name="user_id" value="1" />
    						<input type="file" onChange="endImageSave();" name="user_image" />
						</form>
						<button class="btn_img" type="button" name="button" onClick="changeImageSaveMode();">사진 변경</button>
					</div>
					<div class="profile_name">
						<h3 id="user_name">${user.user_name}</h3>
						<form id="name_form" method="post">
							<input id="input_name" type="text" name="user_name" value="" />
							<input type="hidden" name="user_introduce" value="${user.user_introduce}" />
							<input type="hidden" name="user_id" value="${user.user_id}" />
						</form>
						<button class="btn_name" type="button" name="닉네임 변경" onClick="changeName();">닉네임 변경</button>
					</div>
					<div class="profile_introduce">
						<h3 id="user_introduce">${user.user_introduce}</h3>
						<form id="introduce_form" method="post">
							<input id="input_introduce" type="text" name="user_introduce" value="" />
							<input type="hidden" name="user_name" value="${user.user_name}" />
							<input type="hidden" name="user_id" value="${user.user_id}" />
						</form>
						<button class="btn_introduce" type="button" name="소개 변경" onClick="changeIntroduce();">소개 변경</button>
					</div>
				</section>

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
										<tr id="open">
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
										<div class="modal hidden">
				          			<div class="modal_overlay">
				          			</div>
				          			<div class="modal_content">
				            			<header class="modal_header">
											<span class="title">코드조회</span>
											<img class="close" src="<%=request.getContextPath()%>/resources/images/close.png" width="15em" height="15em" alt="닫기">
				            			</header>
										<div class="modal_left">
											<h3 class="problem_name">2842. 유기농 배추</h3>
											<div class="problem_level">
												LEVEL 3
											</div>
											<div class="modal_wrap">
												<div id="table">
													<div class="row">
														<span class="head col1">제출</span>
														<span class="head col2">언어</span>
														<span class="head col3">AC/WA</span>
														<span class="head col4">공개</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">Python</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/check.png" width="25em" height="25em" alt="O"></span>
														<span class="cell col4">O</span>
													</div>
													<div id="2" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="3" class="row">
														<span class="cell col1">2020.07.31</span>
														<span class="cell col2">Javascript</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/check.png" width="25em" height="25em" alt="O" width="25em" height="25em" alt="O"></span>
														<span class="cell col4">O</span>
													</div>
													<div id="4" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
													<div id="1" class="row">
														<span class="cell col1">2020.08.01</span>
														<span class="cell col2">C++</span>
														<span class="cell col3"><img src="<%=request.getContextPath()%>/resources/images/notCheck.png" width="25em" height="25em" alt="X"></span>
														<span class="cell col4">X</span>
													</div>
												</div>
											</div>
										</div>
										<div class="modal_right">
											<iframe src="<%=request.getContextPath()%>/resources/html/modal_editor.html" width="100%" height="100%"></iframe>
										</div>
										<div class="open_check">
											<span>코드를 다른 사용자에게도 공개합니다.</span> <input type="checkbox" id="check" name="open_check" value="open" /> <label for="check"></label>
										</div>
				          			</div>
				        		</div>
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

				<footer class="footer_btns">
					<button class="btn_change_pwd" type="button" name="button">비밀번호 변경</button>
					<button class="btn_withdraw" type="button" name="button">회원 탈퇴</button>
				</footer>

			</div>
		</div>

		<!-- Sidebar -->
		<%-- <div id="sidebar">
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
					</div> --%>

	</div>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

</body>
</html>
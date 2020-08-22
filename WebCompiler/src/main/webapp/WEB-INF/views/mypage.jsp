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
</head>

<body class="is-preload">
<%	
	String imgURL = "";
	UserVO user = (UserVO)request.getAttribute("user");
	if(user.getUser_img() == null) {
		imgURL = (String)request.getContextPath() + "/resources/images/user.png";
	} else {
		imgURL = "/web/getByteImage/" + user.getUser_id();
	}
%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<header id="header">
				<a href="/web" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
				<ul class="icons">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</header>
			<div class="inner">
				<!-- Content -->
				<section class="profile">
					<div class="profile_img">
						<img class="img" src=<%=imgURL%>>
						<form id="img_form" action="/web/mypage/saveImage" enctype="multipart/form-data" method="post">
							<input type="hidden" name="user_id" value="${user.user_id}" />
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
					<!-- Break -->
					<form method="post" action="#">
						<div class="col-12">
							<select name="demo-category" id="demo-category">
								<option value="">- Level -</option>
								<option value="1">Bronze</option>
								<option value="1">Silver</option>
								<option value="1">Gold</option>
							</select>
						</div>
						<br>
						<!-- Break -->
						<div class="col-12">
							<select name="demo-category" id="demo-category">
								<option value="">- Kind -</option>
								<option value="1">Sort</option>
								<option value="1">Tree</option>
								<option value="1">For</option>
								<option value="1">While</option>
								<option value="1">If</option>
								<option value="1">DP</option>
							</select>
						</div>
						<br>
						<ul class="actions">
							<li><a href="#" class="button">Search</a></li>
						</ul>
					</form>

					<!-- Table -->
					<h3>Table</h3>

					<h4>Default</h4>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr id="open">
									<td>2842번</td>
									<td>유기농 배추</td>
									<td>Level 3</td>
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
								<tr>
									<td>Item2</td>
									<td>Vis ac commodo adipiscing arcu aliquet.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item3</td>
									<td> Morbi faucibus arcu accumsan lorem.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item4</td>
									<td>Vitae integer tempus condimentum.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item5</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</section>

				<footer class="footer_btns">
					<button class="btn_change_pwd" type="button" name="button">비밀번호 변경</button>
					<button class="btn_withdraw" type="button" name="button">회원 탈퇴</button>
				</footer>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<!-- <nav id="menu">
							<header class="major">
								<h2><a href="index.html">Home</a></h2>
							</header>
							<ul>
								<li><span class="opener">Mypage</span>
									<ul>
										<li><a href="#">MyPage</a></li>
										<li><a href="mycode.html">MyCode</a></li>
										<li><a href="#">PlayGround</a></li>
									</ul></li>

								<li><a href="Q&A.html">Q & A</a></li>
								<li><a href="search.html">Code Table</a></li>
								<li><a href="explain.html">How to use it</a></li>
							</ul>
						</nav> -->
				<nav id="menu">
					<header class="major">
						<img class="icon" src="<%=request.getContextPath()%>/resources/images/user.png">
						<h3 class="name"><a href="/web/mypage">MR.O</a></h3>
					</header>
					<ul>
						<li><a href="/web"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
						<li><a href="/web/problem"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
						<li>
							<span class="opener"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</span>
							<ul>
								<li><a href="/web/question">Q & A</a></li>
								<li><a href="/web/freeboard">Free Board</a></li>
							</ul>
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
	<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

</body>
</html>
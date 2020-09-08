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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board.css" />
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
							<a class="header_signup" href="/join"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="/signin"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
						</header>
						<div class="inner">
							<section>
					<h3 class="board_title">자유게시판</h3>
					<br>
					<!-- Break -->
						<form method="post" action="#">
							<div class="col-12 name">
								<select name="demo-category" id="demo-category">
									<option value="">- 선택 -</option>
									<option value="board_title">제목</option>
									<option value="user_id">작성자</option>
									<option value="problem_id">문제 번호</option>
		
								</select>
							</div>
							<input class="search" type="text" name="search" value="검색">
						</form>
							

							<br>
							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											
											<th style="text-align: left;">제목</th>
											<th>작성자</th>
											<th>게시일</th>
											<th>문제번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${board}" >
									      
												 <tr>

												    <td style="text-align: left;">
												    	<a href="/board/${board.board_id}" style="color:black; border:0"><c:out value="${board.board_title}"/></a>
												    </td>
												    <td><c:out value="${board.user_id}"/></td>
												    <td><c:out value="${board.board_upload}"/></td>
												   	<c:if test="${board.problem_id > 0}">
														<td><a href="/problem/${board.problem_id}" style="color:black; border:0"><c:out value="${board.problem_id}"/></a></td>
													</c:if>
													<c:if test="${board.problem_id == 0}">
														<td><c:out value=""/></td>
													</c:if>	
												    
												  </tr>
												  </c:forEach>
										
									</tbody>
								</table>

							</div>
							<a href="/board/insert" style="color: black; border:0">글쓰기</a>
							<div class="page">
								<ul class="paging">
									<li class="page_num"><a href="#">1</a></li>
									<li class="page_num"><a href="#">2</a></li>
									<li class="page_num"><a href="#">3</a></li>
									<li class="page_num"><a href="#">4</a></li>
									<li class="page_num"><a href="#">5</a></li>
									<li class="page_num"><a href="#">6</a></li>
									<li class="page_num"><a href="#">7</a></li>
									<li class="page_num"><a href="#">8</a></li>
								</ul>
							</div>


						</form>
				</section>
								

						</div>
					</div>

				<!-- Sidebar -->

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.dms.web.domain.UserVO"%>
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
		
		
		<style>
		
			#main > .inner {
				padding: 0 6em 0.1em 6em;
				margin: 0 auto;
				max-width: 85em;
			}	
		</style>
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
							<input class="search" type="text" name="search" placeholder="검색">
						</form>
							

							<br>
							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											
											<th class="board_title" >제목</th>
											<th>작성자</th>
											<th>게시일</th>
											<th>문제번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${board}" >
									      
												 <tr>

												    <td class="board_title" style="text-align: left;">
												    	<a href="/board/${board.board_id}" style="color:black; border:0"><c:out value="${board.board_title}"/></a>
												    </td>
												    <td><c:out value="${board.user_id}"/></td>
												    <td><c:out value="${board.board_upload}"/></td>
												   	<c:if test="${board.problem_id > 0}">
														<td class="problem_id"><a href="/problem/${board.problem_id}" style="border:0"><c:out value="${board.problem_id}"/></a></td>
													</c:if>
													<c:if test="${board.problem_id == 0}">
														<td><c:out value=""/></td>
													</c:if>	
												    
												  </tr>
												  </c:forEach>
										
									</tbody>
								</table>

							</div>
							<div class="board_option">
								<a href="/board/insert">
								<img src="<%=request.getContextPath()%>/resources/images/write.png">글쓰기
								</a>
							</div>
							
							 
							<div class="page">
								<ul class="paging" id="pagenav" >
								<c:if test="$test{pageMaker.prev}">
									<li class="page_num"><a href="javascript:getBoardList(pageMaker.startPage - 1)">이전</a></li>
									</c:if> 
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
										 <c:if test="${cri.page eq page}">
										 	<li class="page_num page_on" value="${page}"><a href="board${pageMaker.makeQuery(page)}">${page}</a></li>
										 </c:if>
										 <c:if test="${cri.page != page}">
										 	<li class="page_num" value="${page}"><a href="board${pageMaker.makeQuery(page)}">${page}</a></li>
										 </c:if>
									
									 </c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="page_num"><a href="javascript:getBoardList(pageMaker.endPage + 1)">다음</a></li>
									 </c:if>
								</ul>
							</div>
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

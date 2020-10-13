<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.dms.web.domain.UserVO"%>
<%
	String imgURL = "";
if (request.getAttribute("user") != null) {
	UserVO user = (UserVO) request.getAttribute("user");
	if (user.getUser_img() == null) {
		imgURL = (String) request.getContextPath() + "/resources/images/user.png";
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/study.css" />


<style>
#main>.inner {
	padding: 0 6em 0.1em 6em;
	margin: 0 auto;
	max-width: 85em;
}

header#header {
	height: 3.5em;
	display: block;
	padding: 0;
	background-color: rgb(17, 20, 31);
	margin-bottom: 0;
}
</style>
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

			<div>
			
				<nav class="menu" id="menu">
					<ul>
						<li><span class="opener">자료구조</span>
							<ul style="display: block;">
								<li><a href="#">리스트</a></li>
								<li><a href="#">스택</a></li>
								<li><a href="#">큐</a></li>

							</ul></li>
						<li><span class="opener">정렬</span>
							<ul style="display: block;">
								<li><a href="#">선택정렬 삽입정렬 버블정렬</a></li>
								<li><a href="#">합병정렬 퀵정렬</a></li>
							</ul></li>
						<li><a href="generic.html">수학</a></li>
						<li><span class="opener">그래프</span>
							<ul>
								<li><a href="#">그래프</a></li>
								<li class="test"><a href="#">깊이 우선 탐색</a></li>
								<li><a href="#">너비 우선 탐색</a></li>
							</ul></li>
						<li><span class="opener">트리</span>
							<ul>
								<li><a href="#">트리</a></li>
								<li><a href="#">힙</a></li>
								<li><a href="#">너비 우선 탐색</a></li>
							</ul></li>
						<li><a href="#">다이나믹 프로그래밍</a></li>
						<li><a href="#">재귀 알고리즘</a></li>
						<li><span class="opener active">분할정복</span>
							<ul>
								<li><a href="#">트리</a></li>
								<li><a href="#">힙</a></li>
								<li><a href="#">너비 우선 탐색</a></li>
							</ul></li>

						<li><span class="opener active">최단경로</span>
							<ul>
								<li><a href="#">다익스트라</a></li>
								<li><a href="#">플로이드 와샬</a></li>
								<li><a href="#">벨만포드</a></li>
							</ul></li>
						<li><span class="opener active">최소 스패닝 트리</span>
							<ul>
								<li><a href="#">최소 스패닝 트리</a></li>
								<li><a href="#">disjoint-set</a></li>
								<li><a href="#">쿠르스칼</a></li>
								<li><a href="#">프림</a></li>
							</ul></li>
						<li><a href="#">브루트포스</a></li>
						<li><a href="#">백트래킹</a></li>
					</ul>
				</nav>
		
			
				<div class="right">
					<span> ${category.high}</span>
					<c:forEach items="${category.low}" var="city">

                    <p>${city.name}
                    <p>${city.price}
   
                </c:forEach>
					<table>
							<thead>
								<tr>
								    <th>번호</th>
									<th>문제</th>
									<th>난이도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="problem" items="${board}">
									<tr>
										<td class="board_title" style="text-align: left;"><a
											href="/board/${board.board_id}"
											style="color: black; border: 0"><c:out
													value="${board.board_title}" /></a></td>
										<td><c:out value="${board.user_id}" /></td>
										<td><c:out value="${board.board_upload}" /></td>
										<c:if test="${board.problem_id > 0}">
											<td class="problem_id"><a
												href="/problem/${board.problem_id}" style="border: 0"><c:out
														value="${board.problem_id}" /></a></td>
										</c:if>
										<c:if test="${board.problem_id == 0}">
											<td><c:out value="" /></td>
										</c:if>
									</tr>
								</c:forEach>

							</tbody>
						</table>
				
				
				</div>



			</div>


		</div>
		<!-- Sidebar -->
		<!-- Sidebar -->



	</div>

	<!-- Scripts -->
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

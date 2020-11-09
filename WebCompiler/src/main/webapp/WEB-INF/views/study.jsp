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
<title>CODE SPACE</title>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_problem2.css" />


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
							<li><a href="#">자료구조</a>
								<ul style="display: block;">
									<li><a>리스트</a></li>
									<li><a>스택</a></li>
									<li><a>큐</a></li>

								</ul></li>
							<li><a href="#">정렬</a>
								<ul style="display: block;">
									<li onclick="check_list(this.id);" id="CA_0004"><a>선택정렬 삽입정렬 버블정렬</a></li>
									<li onclick="check_list(this.id);" id="CA_0004"><a>합병정렬 퀵정렬</a></li>
								</ul></li>
							<li onclick="check_list(this.id);" id="CA_0016"><a>수학</a></li>
							<li><span class="opener">그래프</span>
								<ul>
									<li><a>그래프</a></li>
									<li onclick="check_list(this.id);" id="CA_0001"><a
										>깊이 우선 탐색</a></li>
									<li onclick="check_list(this.id);" id="CA_0002"><a
										>너비 우선 탐색</a></li>
								</ul></li>
							<li><span class="opener">트리</span>
								<ul>
									<li><a>트리</a></li>
									<li><a>힙</a></li>
								</ul></li>
							<li onclick="check_list(this.id);" id="CA_0003"><a>다이나믹
									프로그래밍</a></li>
							<li onclick="check_list(this.id);" id="CA_0020"><a>재귀
									알고리즘</a></li>
							<li><span>분할정복</span>
								<ul>
									<li onclick="check_list(this.id);" id="CA_0011"><a
										>분할 정복</a></li>
									<li onclick="check_list(this.id);" id="CA_0017"><a>트리</a></li>
									
								</ul></li>

							<li><span>최단경로</span>
								<ul>
									<li><a>다익스트라</a></li>
									<li><a>플로이드 와샬</a></li>
									<li><a>벨만포드</a></li>
								</ul></li>
							<li><span>최소 스패닝 트리</span>
								<ul>
									<li><a>disjoint-set</a></li>
									<li><a>쿠르스칼</a></li>
									<li><a>프림</a></li>
								</ul></li>
							<li onclick="check_list(this.value);" id="CA_0009"><a
								>브루트포스</a></li>
							<li><a>백트래킹</a></li>
						</ul>
				</nav>


				<div class="right">
					<!--  <span> ${category.high}</span>
					<c:forEach items="${category.low}" var="city">

						<p>${city.name}
						<p>${city.price}
					</c:forEach>
					-->
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>문제</th>

									<th>난이도</th>
									<th>정답률</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="problem_id">1431</td>
									<td>시리얼 번호</td>
									<td><div class="problem_level"
											style="background-color: #FFCC80">LEVEL 1</div></td>
									<td>51.2%</td>
								</tr>
								<tr>
									<td class="problem_id">1431</td>
									<td>시리얼 번호</td>
									<td><div class="problem_level"
											style="background-color: #7BC379">LEVEL 2</div></td>
									<td>51.2%</td>
								</tr>
																<tr>
									<td class="problem_id">1431</td>
									<td>시리얼 번호</td>
									<td><div class="problem_level"
											style="background-color: #7BC379">LEVEL 2</div></td>
									<td>51.2%</td>
								</tr>
								<!--<c:forEach var="problem" items="${board}">
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
								</c:forEach>-->

							</tbody>
						</table>

					</div>
					<div class="title" >
						<div class="title_color" >
							01
						</div>
						<div class="title_name">
						개념</div>
					</div>
					
					<div class="title" >
						<div class="title_color" >
							02
						</div>
						<div class="title_name">
						적용</div>
					</div>
					
					<div class="title" >
						<div class="title_color" >
							03
						</div>
						<div class="title_name">
						코드</div>
					</div>
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

	<script>
		var c_value = "unselected";
		function check_list(ref){
			$("#"+c_value).removeClass('selected');
			
			if(ref != c_value){
				$("#"+ref).addClass('selected');
				c_value = ref;
			}
			else{
				c_value="unselected";
			}
			
			console.log("select category: " + c_value);
			
			//$("#" + ref).addClass('selected');
		}
	</script>

</body>
</html>

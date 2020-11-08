<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="<%=request.getContextPath()%>/resources/css/custom_board.css" />


<style>
#main>.inner {
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
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="<%=imgURL%>" />
			</jsp:include>
			<div class="inner">
				<section>
					<h3 class="board_title">자유게시판</h3>
					<br>
					<!-- Break -->
					<div class="wrapper">
			
				
				
				
					<div class="search_box">
					
					<div class="dropdown">
						
					<div class="default_option">번호</div>  
						<ul>
			              <li>번호</li>
			              <li>제목</li>
			            </ul>
					</div>
				 <div class="search_field">
			          <input type="text" class="input">
			          <i class="fas fa-search"></i>
			      </div>
				</div>
				</div>


					<br>
					<!-- Table -->
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>

									<th class="board_title">제목</th>
									<th style="width:15%">작성자</th>
									<th style="width:10%">게시일</th>
									<th style="width:10%">문제번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${board}">

									<tr>

										<td class="board_title" style="text-align: left;"><a
											href="/board/${board.board_id}"
											style="color: black; border: 0"><c:out
													value="${board.board_title}" /></a></td>
										<td ><c:out value="${board.user_id}" /></td>
										<td ><fmt:formatDate pattern="yyyy.MM.dd" value="${board.board_upload}"/></td>
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
					<div class="board_option">
						<a href="/board/insert"> <img
							src="<%=request.getContextPath()%>/resources/images/write.png">글쓰기
						</a>
					</div>


					<div class="page">
						<ul class="paging" id="pagenav">
							<c:if test="$test{pageMaker.prev}">
								<li class="page_num"><a
									href="javascript:getBoardList(pageMaker.startPage - 1)">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="page">
								<c:if test="${cri.page eq page}">
									<li class="page_num page_on" value="${page}"><a
										href="board${pageMaker.makeQuery(page)}">${page}</a></li>
								</c:if>
								<c:if test="${cri.page != page}">
									<li class="page_num" value="${page}"><a
										href="board${pageMaker.makeQuery(page)}">${page}</a></li>
								</c:if>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page_num"><a
									href="javascript:getBoardList(pageMaker.endPage + 1)">다음</a></li>
							</c:if>
						</ul>
					</div>
				</section>


			</div>
		</div>
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
	var on = 1;
	$(".default_option").click(function(){
	  if(on == 1){
	     $(".dropdown ul").addClass("active");
	    on = 0;
	  }
	  else{
	    $(".dropdown ul").removeClass("active");
	    on = 1;
	  }
	 
	});

	$(".dropdown ul li").click(function(){
	  var text = $(this).text();
	  $(".default_option").text(text);
	  $(".dropdown ul").removeClass("active");
	});
	</script>

</body>
</html>

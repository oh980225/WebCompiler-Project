<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.dms.web.domain.UserVO"%>
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
		<!--  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board.css" /> 우선 주석처리 해봄 -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board_detail.css" />
		
		<script>
			function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
			function comment_register(){
				if($("#comments_content").val() == ""){
						alert("hello");
						return false;
					}
				return true;
				/* var id=document.getElementById("user_id");
				var passwd=document.getElementById("user_passwd");
				var passwd_check=document.getElementById("passwd_check");
				아이디와 패스워드 값 데이터 정규화 공식
			     var regul_id = /^[a-zA-Z0-9]{4,12}$/;
			     var regul_passwd = /^[a-zA-Z0-9]{4,12}$/;

					
				 if ((id.value)=="") {
					 var msg = document.getElementById("id_alert");
					 msg.innerHTML="*필수 항목 입니다.";
					 msg.style.visibility = "visible";
			         id.focus();
			         return false;
			      }
			      */
				}
		</script>
		
		
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
								
								
								<div class="title_header">
									<div class="header_problemid">
										<c:if test="${board.problem_id > 0}">
											<span id="problem_id">${board.problem_id}</span>
										</c:if>
									
									</div>
									<div class="board_info">
										<a href="edit?id=${board.board_id}" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/edit.png">글쓰기</a>
										<a href="delete" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/delete.png">목록</a>
									</div>
									
								</div>
								<div class="title_box">
									<span>${board.board_title}</span>
									<span id="info_id">${board.user_id}</span>
								</div>
								<div>
									
								</div>
								<div class="content">
									<p id="board_upload">${board.board_upload}</p>

									<div class="content_box">
										<p>${board.board_content}<br>
									</div>
									
									<div class="info_box">
											<div class="comment_count">
												<img src="<%=request.getContextPath()%>/resources/images/comment.png"><span>2개</span>
											</div>
											<div class="board_info">
											
													<c:if test="${user.user_id == board.user_id}">
															<a href="edit?id=${board.board_id}" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/edit.png"></a>
															<a href="delete" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/delete.png"></a>
													</c:if>
												
											</div>
											
											<!-- <form method="post" action="delete">
												<a onclick="return alert('정말로 삭제하시겠습니까?')"
												href="delete?board_id=${board.board_id}" value="${board.board_id}">삭제</a>
											</form> -->
									</div>
									
								</div>
								
								
								
								<div>
									<%int i = 0; %>
									
									<c:forEach var="comments" items="${comments}">
										<div id="comment_list">
											<%if(i!=0){ %>
												<div class="comment_dashline"></div>
											<% } %>
									
										
											<div id="comment_image"><img src="/getByteImage/${comments.user_id}" width="50px" height="50px"></div>
											
											<div class="comment_content">
												<p id="comment_user">${comments.user_id}
												<p> ${comments.comments_content}
											</div>
												<div class="comment_info">
													<p id="comment_date">${comments.comments_upload} <br>
													<div id="comment_edit">
														<c:if test="${user.user_id == comments.user_id}">
															<a href="#" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/edit.png"></a>
															<a href="#" style="color:black"><img src="<%=request.getContextPath()%>/resources/images/delete.png"></a>
														</c:if>	
													</div>
												</div>
												
												<% i++; %>
										</div>
										

									</c:forEach>
									<form action="/" method="POST" onsubmit="return comment_register()">
									<div class="comment_typing">
										
											<textarea id="comments_content" name="comments_content" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
											<div class="comment_typing_button">
												<input type="image" src="<%=request.getContextPath()%>/resources/images/submit.png" class="submit-button">
											</div>
									
									</div>
									</form>
									
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

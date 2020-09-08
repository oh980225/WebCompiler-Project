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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board.css" />
		<style>
			#main > .inner {
			    padding: 0 6em 0.1em 6em;
			    margin: 0 auto;
			    max-width: 85em;
			}
			a {
				color:black;
				border:0;
				
			}
			a:hover {
			   color: none;  
			}
			.title_header{
				overflow:auto;
			}
			.header_problemid{
				float:left;
			}
			.title_header #problem_id{
				text-align:left;
				font-size: 13.5px;
				font-weight:600;
				color: #3AB6BC;
			}
			.title_box{
				font-size: 13.5px;
				font-weight:600;
				color: #484848;
				margin:10px 0 0 0;
				padding:10px;
				border-top:solid 0.5px #222629;
				border-bottom:solid 0.5px #222629;
			}
			.content{
				overflow:auto;
				font-size: 12px;
				color: #707070;
				margin: 0 0 20px 0px;
				border-bottom:solid 2px #aaaaaa;
				padding: 10px 10px 0 10px;
			}
			.content #board_upload{
				
				text-align:right;
			}
			
			.content_box{
				margin: 0 10px 20px 10px;
				font-size: 13.5px;
				color: #484848;
			}
			.comment_count{
				float:left;
			}
			.board_info{
				float:right;
			}
			.board_info img{
				vertical-align:middle;
				margin:3px;
				width:16.5px;
				height:16.5px;
			}
			
			
			.content_date{
				float:right;
				margin: 0;
				display:block;
			}
			.content_date p{
				float:right;
				margin: 0;
			}
			.info_box img{
				vertical-align:middle;
				margin:3px;
				width:16.5px;
				height:16.5px;
			}
			.title_box #info_id{
				float:right;
			}
			#comment_list {
				width:auto;				
				overflow: auto;
			}
			#comment_image {
				float: left;
				margin-left:10px;
				
			}
			.comment_content{
				margin: 0 0 0 0;
				display:block;
				float: left;
				width: 850px;
				margin-left:20px;
			}
			.comment_content p{
				margin: 0 0 0 0;
				font-size: 12px;
				color: #707070;
			}
			.comment_content #comment_user{
				font-weight:bold;
				margin: 0 0 6px 0;
			}
			.comment_info{
				margin: 0 15px 0 0;
				
				float: right;
				width: 80px;
			
			}
			.comment_info a{
				color:red;
				margin: 0 0 0 0;
				border:0;
			}
			.comment_info img{
				margin:2px;
				width:16.5px;
				height:16.5px;
			}
			.comment_info #comment_edit{
				float:right;
				font-size: 10px;
			}
			.comment_info #comment_date {
				color: #707070;
				float:right;
				font-size: 12px;
				margin: 0 0 0 0;
			}
			.comment_dashline {
				overflow: auto;
				margin:12px 0 12px 0;
				border-top:dashed 1px #cccccc;
			}
			.comment_line {
				overflow: auto;
				margin:12px 0 12px 0;
				border-top:solid 1px #cccccc;
			}
			.comment_typing{
				position:relative;
				padding:10px 30px 10px 30px;
				width:auto;				
				overflow: auto;
			}
			.comment_typing_button{
				position:absolute;
				bottom: 10px;
    			right: 25px;
				padding:10px;
				width:auto;				
				overflow: auto;
			}
			
			.comment_typing #comments_content{
				margin: 10px 0px 10px 0px;
			}
			
			input[type="text"], textarea {
			    -moz-appearance: none;
			    -webkit-appearance: none;
			    -ms-appearance: none;
			    appearance: none;
			    background: #ffffff;
			    border-radius: 20px 0px 20px 20px;
			    border: none;
			    border: solid 1px rgba(210, 215, 217, 0.75);
			    color: inherit;
			    display: block;
			    outline: 0;
			    padding: 0 1em;
			    text-decoration: none;
			    width: 100%;
			    font-size:12px;
			    min-height: 70px;
			}
			
			input[type="text"]:focus, textarea:focus {
			     border-color: rgba(210, 215, 217, 0.75);
			    /* box-shadow: 0 0 0 1px #ffffff; */
			}
			input.submit-button{
				border:none;
				width:30px;
				heigth:30px;
				cursor:pointer;
			}
		
		</style>
		
		<script>
			function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
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
									<div class="comment_typing">
										<textarea id="comments_content" name="comments_content" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
										<div class="comment_typing_button">
											<input type="image" src="<%=request.getContextPath()%>/resources/images/submit.png" class="submit-button" onclick="DoSomething();">
										</div>
										
									</div>
									
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

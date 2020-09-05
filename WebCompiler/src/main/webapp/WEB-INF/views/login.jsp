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
		<style>
			a {
				color:black;
				border:0;
				text-decoration: underline;
				
			}
			a:hover {
			   color: none;  
			}
			span{
			 	text-align:center;
				font-size:8pt;
			}

			#inputform{
				
			       width: 310px;
				    height: 400px;
				    /* overflow: auto; */
				    margin: 20% auto;
				    margin-bottom: 0;
				    font-family: sans-serif;
			}
			input[type="text"]{
			   background: #ffffff;
			   border: solid 1px rgba(210, 215, 217, 0.75);
			   display: block;
			   outline: 0;
			   text-decoration: none;
			   font-family: sans-serif;
			   BORDER-BOTTOM:  1px solid #7c7c7c;
			   BORDER-LEFT:  none;
			   BORDER-RIGHT:  none;
			   BORDER-TOP:  none;
			   FONT-SIZE: 9pt;
			   width:300px;
			   border-radius: 0;
			}
			input:focus {outline:none;}
			
			p {
				margin: 2em 0 0 0;
				
			}
			p.inputform{
			   font-size:9pt;
			   font-weight: 600녁ㄷ;
			   
			}
			#info{
			   font-size:8pt;
			   text-align:center;
			   color: #7E7E7E;
			}
			
			#submit{
			       float: right;
				    /* display: inline-block; */
				    vertical-align: middle !important;
				    padding-top: 0 !important;
				    padding-bottom: 0 !important;
				    margin-top: 0.5em;
			}
			
			input[type="button"], button, .button {
			    -moz-appearance: none;
			    -webkit-appearance: none;
			    -ms-appearance: none;
			    appearance: none;
			    -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			    -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			    -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			    transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			    background-color: #202137;
			    border-radius: 2em;
			    border: 0;
			    box-shadow: inset 0 0 0 2px #ffffff;
			    color: #fcfcfc !important;
			    cursor: pointer;
			    display: inline-block;
			    font-family: sans-serif;
			    font-size: 0.8em;
			    font-weight: 700;
			    height: 3em;
			    letter-spacing: 0em;
			    line-height: 3.5em;
			    padding: 0 2.25em;
			    text-align: center;
			    text-decoration: none;
			    text-transform: uppercase;
			    white-space: nowrap;
			}
			button:hover, .button:hover {
    			background-color: #202137;
			}
			#alert_msg {
				margin:1em 0 0 0;
				font-size: 8pt;
				color:red;
				text-align:center;
			}
			#alert_img{
				vertical-align:middle;
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
									<a href="/" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
									<!-- 바꾸기 -->																
									<c:if test="${user.user_id == null}">
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
								</header>
								<div class="inner">
									<div id="inputform">
										   <form method="post" action="/login.do" >
										      <p class="inputform"> USER ID <br></p>
										      <input type="text" name="user_id" onclick="alert_event()">
										      <p class="inputform"> PASSWORD <br></p>
										      <input type="text" name="user_passwd" onclick="alert_event()">
										      <c:if test="${msg == false}">
										      <p id="alert_msg" style="color:red; visibility:visible">
										      	<img id="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15px" height="15px"/>
										      	존재하지 않거나 비밀번호가 일치하지 않습니다.
										      </p>	
										      </c:if>	
											  <p id="info"> 계정이 없으신가요? <a href="#">회원가입</a></p>
										      
										      <button type="submit" id="submit">LOGIN</button>
										   </form> 
										
										</div>
		

										<c:if test="${msg == false}">
										   <p id="alert_msg" style="color:red; visibility:visible"> 존재하지 않거나 비밀번호가 일치하지 않습니다.
										   </p>
										</c:if>	
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
										<li><a href="/web"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
										<!-- 사이드 메뉴바에 Problem 클릭시 문제 페이지로 이동 -->
										<li><a href="/problem"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
										<li>
											<span class="opener"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</span>
											<ul>
												<!-- 사이드 메뉴바에 Q & A 클릭시 QnA 페이지로 이동 -->
												<li><a href="/question">Q & A</a></li>
												<!-- 사이드 메뉴바에 Free Board 클릭시 자유게시판 페이지로 이동 -->
												<li><a href="/freeboard">Free Board</a></li>
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

	</body>
</html>

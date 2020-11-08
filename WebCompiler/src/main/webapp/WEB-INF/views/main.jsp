<%@page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

<script>
		function setupTypewriter(t) {
			
	        var HTML = t.innerHTML;
	        t.innerHTML = "";

	        var cursorPosition = 0,
	            tag = "",
	            writingTag = false,
	            tagOpen = false,
	            typeSpeed = 100,
	        tempTypeSpeed = 0;

	        var type = function() {
	        
	            if (writingTag === true) {
	                tag += HTML[cursorPosition];
	            }

	            if (HTML[cursorPosition] === "<") {
	                tempTypeSpeed = 0;
	                if (tagOpen) {
	                    tagOpen = false;
	                    writingTag = true;
	                } else {
	                    tag = "";
	                    tagOpen = true;
	                    writingTag = true;
	                    tag += HTML[cursorPosition];
	                }
	            }
	            if (!writingTag && tagOpen) {
	                tag.innerHTML += HTML[cursorPosition];
	            }
	            if (!writingTag && !tagOpen) {
	                if (HTML[cursorPosition] === " ") {
	                    tempTypeSpeed = 0;
	                }
	                else {
	                    tempTypeSpeed = (Math.random() * typeSpeed) + 50;
	                }
	                t.innerHTML += HTML[cursorPosition];
	            }
	            if (writingTag === true && HTML[cursorPosition] === ">") {
	                tempTypeSpeed = (Math.random() * typeSpeed) + 50;
	                writingTag = false;
	                if (tagOpen) {
	                    var newSpan = document.createElement("span");
	                    t.appendChild(newSpan);
	                    newSpan.innerHTML = tag;
	                    tag = newSpan.firstChild;
	                }
	            }

	            cursorPosition += 1;
	            if (cursorPosition < HTML.length) {
	                setTimeout(type, tempTypeSpeed);
	            }

	        };

	        return {
	            type: type
	        };
	    }
	    function typing(){
		    var cpptyper = document.getElementById('cpptypo');
		    cpptypewriter = setupTypewriter(cpptypo);    
		    cpptypewriter.type();
		}

	    window.onload = setInterval(function (){
	    	typing();
	    }, 4000);
	    
		</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
	   
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="<%=imgURL%>" />
			</jsp:include>
			<!--  <header id="header">
							<a class="main_logo" href="/"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="/problem"><img src="<%=request.getContextPath()%>/resources/images/coding.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="/board"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<a class="header_problem" href="#"><img src="/resources/images/header_problem.png"/>개념다잡기</a>
							<a class="header_problem_insert" href="/problem/insert"><img src="/resources/images/problem_insert.png"/>문제등록</a>
							
							<c:if test="${user.user_id == null}">
								<a class="header_signup" href="/join"><span>회원가입</span></a>
								<a class="header_signin" href="/login"><span>로그인</span></a>
							</c:if>
							<c:if test="${user.user_id != null}">
								<a class="header_signout" href="/logout.do"><span>로그아웃</span></a>
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
						-->
			<div class="inner">


				<img class="main_image"
					src="<%=request.getContextPath()%>/resources/images/main_custom.png" />

				<div class="typo">
					<span class="blue">std</span>::<span class="green">cout</span> ＜＜ <span
						class="red" id="cpptypo">"CODE SPACE" </span> ＜＜ <span
						class="blue">std</span>::<span class="yello">endl</span>;</span>
					</pre>


					<!-- Banner -->


				</div>


			</div>
			<footer>
				<p>
					2020 한이음<br>
				<p style="margin:0;"><a href="https://github.com/DongGeon0908">@한신대학교 김동건&emsp;</a><a href="https://github.com/mindi1206"> @한국산업기술대학교 김민지</a>&emsp;<a href="https://github.com/oh980225">@서울과학기술대학교 오승재</a><br>
				<p style="font-size:0.7em;"><a href="https://lab.hanium.or.kr/20_hf431" class="teamlab" >https://lab.hanium.or.kr/20_hf431</a>
			</footer>


		</div>
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

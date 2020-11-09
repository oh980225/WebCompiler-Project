<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/error.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

</head>
<body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <!-- Header -->
            <header id="header">
            <a class="main_logo" href="/"><img
		src="<%=request.getContextPath()%>/resources/images/main_logo.png"
		alt="메인페이지" /></a>   <a class="header_study" href="/study"><img
		src="/resources/images/header_problem.png" />개념다잡기</a> <a class="header_problem" href="/problem"><img
		src="<%=request.getContextPath()%>/resources/images/coding.png"
		alt="문제 페이지" />문제풀기</a> <a class="header_board" href="/board"><img
		src="<%=request.getContextPath()%>/resources/images/header_board.png"
		alt="게시판 페이지" />자유게시판</a>
            </header>
			
            
            <div class="inner">
				<p class="info red" > 앗! </p>
				<p class="info" style="font-size:2.5em; margin-bottom:1em;">문제가 생겼어요  ( ´•̥×•̥` )</p>
                    <img
		src="<%=request.getContextPath()%>/resources/images/404.png"/>
		<p> <a href="/" class="move">홈으로 이동합니다</a>
                
                
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
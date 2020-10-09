<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_problem_insert.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

<script>
    	function a(){
	var category = document.getElementById("category_name");	
	var category_value = category.options[category.selectedIndex].value;

	document.getElementById("category_id").value = category_value;
}
    </script>
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
					<h3>문제 등록</h3>
					<form action="insert.do" method="post" onsubmit="return validate()">
						<div class="title_box" id="title_box">
							번호 <input type="text" name="problem_id" id="problem_id" /> 제목 <input
								type="text" name="problem_title" id="problem_title" /> 분류 <input
								type="hidden" name="category_id" id="category_id" /> <select
								id="category_name" onchange="a()">
								<option value="0">------ 선택 ------</option>
								<c:forEach var="category" items="${category}">
									<option id="category_id" value="${category.category_id}">${category.category_name}</option>
								</c:forEach>
							</select><br> 제한시간 <input type="text" name="problem_time" />
							<!-- 제출횟수  <input type="text" name="problem_submitnum" />
                                   	 성공  <input type="text" name="problem_successnum" />
                            		-->
							레벨 <input type="text" name="problem_level" /> <br> 내용<br>
							<textarea name="problem_content" cols="100" rows="10"></textarea>
							<br>
						</div>
						<button type="submit" class="board_submit" id="board_submit">등록</button>
					</form>
				</section>
			</div>
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
<!--  <body>
    <div style="align:center">
    <form action="insert.do" method="post" onsubmit="return b()">
        <div width="50%" >

                제목   <input type="text" id="board_title" name="board_title"/> <p id="title_alert" style="color:red; visibility:hidden"> *제목을 입력하세요.</p> <br>

                문제번호   <input type="text" id="problem_id" name="problem_id" value=""/><br>
                <label>내용</label><br>
                <textarea id="board_content" name="board_content" cols="100" rows="10"></textarea> <p id="content_alert" style="color:red; visibility:hidden"> *내용을 작성해주세요.</p><br>
                <input type="submit" name="submit" value="회원 가입" >
        </div>

        </form>
    </div>



</body>
-->
</html>
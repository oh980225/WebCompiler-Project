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
<title>CODE SPACE</title>
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
	href="<%=request.getContextPath()%>/resources/css/custom_board_insert.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
<script>
	function addCode() {
	    //div 객체 생성
	    var code_visible = document.getElementById("code_visible");
	    var obj = document.getElementById("code_box");
	    obj.style.display = "block";
	
	
	    code_visible.style.visibility = "hidden";
	}
	function b(){
		var board_title=document.getElementById("board_title");
		var board_content=document.getElementById("board_content");
		var problem_id = document.getElementById("problem_id");
		var title_msg = document.getElementById("title_alert");
		var content_msg = document.getElementById("content_alert");
		title_msg.style.visibility = "hidden";	
		content_msg.style.visibility = "hidden";	      

		if((board_title).value == ""){
				board_title.focus();
			
				title_msg.style.visibility = "visible";		      
				return false;
			}

		if((board_content).value == ""){
				board_content.focus();
				content_msg.style.visibility = "visible";
		         
				return false;
			}
		
		if((problem_id).value == ""){
				problem_id.value = 0;
			}

		return true;
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
					<h3>글 수정</h3>
					<form action="edit.do" method="post" onsubmit="return validate()">
						<div class="title_box" id="title_box">
							<div class="content_box">
								<span class="board_title">제목</span><input type="text"
									id="board_title" name="board_title"
									value="${board.board_title}" /> <span class="alert_msg"
									id="title_alert" style="color: red; visibility: hidden">
									<img class="alert_img"
									src="<%=request.getContextPath()%>/resources/images/alert.png"
									width="15" height="15" /> 제목을 입력하세요.
								</span><br /> <span class="board_content">내용</span> <span
									class="alert_msg" id="content_alert"
									style="color: red; visibility: hidden"> <img
									class="alert_img"
									src="<%=request.getContextPath()%>/resources/images/alert.png"
									width="15" height="15" /> 내용을 작성해주세요.
								</span>
								<textarea class="board_content" name="board_content"
									id="board_content" cols="100" rows="10">${board.board_content}</textarea>

								<!-- hidden value -->
								<input type="hidden" id="board_id" name="board_id"
									value="${board.board_id}" /> <input type="hidden"
									id="board_upload" name="board_upload"
									value="${board.board_upload}" /> <input type="hidden"
									id="user_id" name="user_id" value="${board.user_id}" />
							</div>


							<c:if test="${board.problem_id == 0}">
								<div class="code_visible" id="code_visible"
									style="float: right; margin: 0 auto; text-align: center">
									<img
										src="<%=request.getContextPath()%>/resources/images/addcode.png"
										width="28" height="28" style="margin: 0 auto;"
										onclick="addCode()" />
									<p style="margin: 0 auto; font-size: 9px">소스코드 추가</p>
								</div>
								<div style="clear: both"></div>
								<div class="content_box code_box" id="code_box">
									<span>문제번호</span><input type="text" id="problem_id"
										name="problem_id" value="${board.problem_id}" /><br />
									<br> <span class="board_content">소스코드</span>
									<textarea class="board_content" name="board_content"
										id="board_content" cols="100" rows="10"></textarea>
								</div>
							</c:if>
							<c:if test="${board.problem_id > 0 }">
								<div style="clear: both"></div>
								<div class="content_box code_box" id="code_box"
									style="display: block;">
									<span>문제번호</span><input type="text" id="problem_id"
										name="problem_id" value="${board.problem_id}" /><br />
									<br> <span class="board_content">소스코드</span>
									<textarea class="board_content" name="board_content"
										id="board_content" cols="100" rows="10"></textarea>
								</div>
							</c:if>

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
</html>


<!-- 제목   <input type="text" id="board_title" name="board_title" value="${board.board_title}"/> <p id="title_alert" style="color:red; visibility:hidden"> *제목을 입력하세요.</p> <br>
				<c:if test="${board.problem_id > 0}">
					문제번호   <input type="text" id="problem_id" name="problem_id" value="${board.problem_id}"/><br>
				</c:if>
				<c:if test="${board.problem_id == 0}">
					문제번호   <input type="text" id="problem_id" name="problem_id" value=""/><br>					
				</c:if>
				
				<label>내용</label><br>
				<textarea id="board_content" name="board_content" cols="100" rows="10">${board.board_content}</textarea> <p id="content_alert" style="color:red; visibility:hidden"> *내용을 작성해주세요.</p><br>
				<input type="submit" name="submit" value="수정" >	
				
				<input type="hidden" id="board_id" name="board_id" value="${board.board_id}"/>
				<input type="hidden" id="board_upload" name="board_upload" value="${board.board_upload}"/>
				<input type="hidden" id="user_id" name="user_id" value="${board.user_id}"/> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

<script>
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
<body>
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
</html>
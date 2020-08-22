<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="align:center">
	<form action="insert.do" method="post">
		<div width="50%" >
				<label>ProblemVO</label><br><br><br>
				제목   <input type="text" name="board_title"/><br>
				<label>내용</label><br>
				<textarea name="board_content" cols="100" rows="10"></textarea> <br>
				<button type="sumbit">등록</button>
		</div>
		
		</form>
	</div>
	
</body>
</html>
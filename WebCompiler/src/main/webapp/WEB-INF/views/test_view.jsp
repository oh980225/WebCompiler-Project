<!-- 테스트 페이지 입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>TestFromView</title>
</head>
<body>
	<form enctype="multipart/form-data" method="post">
		<input type="hidden" name="user_id" value="1" />
    	<input type="file" name="user_image" />
    	<input type="submit" value="이미지저장"/>
	</form>
	
	<img src="/web/getByteImage/1" width="100px" height= "100px"/>
</body>
</html>
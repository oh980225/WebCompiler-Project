<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODE SPACE</title>
</head>
<body>
	<div id="paging">
		<c:forEach var="codeBoard" items="${codeBoardList}" varStatus="st_">
		<tr class="open" id="${st_.index}">
			<td>${codeBoard.problem_id}</td>
			<td>${codeBoard.problem_title}</td>
			<td>
				<c:if test="${codeBoard.problem_level == 1}">
				<div class="problem_level1">
					LEVEL 1
				</div>
				</c:if>
				<c:if test="${codeBoard.problem_level == 2}">
					<div class="problem_level2">
						LEVEL 2
					</div>
				</c:if>
				<c:if test="${codeBoard.problem_level == 3}">
					<div class="problem_level3">
						LEVEL 3
					</div>
				</c:if>
			</td>
			<td><fmt:formatDate pattern="yyyy.MM.dd" value="${codeBoard.code_date}"/></td>
			<td><img src="<%=request.getContextPath()%>/resources/images/${codeBoard.code_success == 1 ? 'check.png' : 'notCheck.png'}" width="20em" height="20em" alt=""></td>
		</tr>
		</c:forEach>
	</div>
</body>
</html>
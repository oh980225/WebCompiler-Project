<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table class="table table-striped">
        <thead>
            <tr>
                <th>분야번호</th>
            <th>점검분야</th>
                <th>항목번호</th>
                <th>점검항목</th>
            <th>중요도</th>
            </tr>
        </thead>
        
        <tbody>
           <c:forEach var = "data" items="${vul_check}">
           
            <tr>
                <td><c:out value="${data.detailc}" /></td>
            <td><c:out value="${data.vul_field}" /></td>
                <td><c:out value="${data.item_num}" /></td>
                <td><c:out value="${data.vul_item}" /></td>
            <td><c:out value="${data.importance}" /></td>
            </tr>
            
            </c:forEach>          
           
        </tbody>
    </table>
</body>
</html>
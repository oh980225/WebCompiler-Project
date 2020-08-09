<!-- 테스트 페이지 입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<p>  The time on the server is ${serverTime}. </p>
<p> 한글 출력 좀 해줄래 </p>

	<div class ="row">
         <table id="Control_Item_Table" class="table table-striped" style="text-align:center; border:1px solid #dddddd">       
         <thead>
         <tr>
         <th width=2%  style="background-color:#eeeeee; text-align:center;">id</th>      
         <th width=9% style = "background-color : #eeeeee; text-align:center;">password</th>
         <th width=11% style = "background-color : #eeeeee; text-align:center;">name</th>
         <th width=4% style = "background-color : #eeeeee; text-align:center;">introduce</th>
         <th width=5% style = "background-color : #eeeeee; text-align:center;">authority</th>
        </tr>
        </thead>      
        <tbody>
        <c:forEach var="user" items="${user}" >
      
			  <tr>
			    <td>
			    	<strong>
			    		<font color="blue"><c:out value="${user.user_id}"/>
			    		</font>
			    	</strong>
			    	</td>
			    <td>
			    	<c:out value="${user.user_passwd}"/>
			    </td>
			    <td><c:out value="${user.user_name}"/></td>
			    <td><c:out value="${user.user_introduce}"/></td>
			    <td><c:out value="${user.user_authority}"/></td>
			  </tr>
		</c:forEach>
		
		
		</tbody>
       </table>
       
       <c:forEach var="category" items="${category}" >
      
			  <tr>
			    <td>
			    	<strong>
			    		<font color="blue"><c:out value="${category.category_id}"/>
			    		</font>
			    	</strong>
			    	</td>
			    <td>
			    	<c:out value="${category.category_name}"/>
			    </td>
			  </tr>
		</c:forEach>
    </div>
    
</body>
</html>

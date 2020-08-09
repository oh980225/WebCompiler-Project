<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function a(){
	var category = document.getElementById("category_name");	
	var category_value = category.options[category.selectedIndex].value;

	document.getElementById("category_id").value = category_value;
}

</script>
</head>
<body>
<!-- private int problem_id;
	private String problem_title;
	private String problem_content;
	private String problem_hint;
	private int problem_time;	
	private int problem_submitnum;
	private int problem_sucessnum;
	private int problem_failnum;
	private int problem_level;
	private String category_id; 냉-->
	<div style="align:center">
	<form action="p.do" method="post">
		<div width="50%" >
		
			
				<label>ProblemVO</label><br><br><br>
				번호 <input type="text" name="problem_id"/> 
				제목   <input type="text" name="problem_title"/> 
				분류 
				<input type="hidden" name="category_id" id="category_id"/>


				<select id="category_name" onchange="a()">
					<option value="0">------ 선택 ------</option>
						<c:forEach var="category" items="${category}">
						<option id="category_id" value="${category.category_id}">${category.category_name}</option>
						</c:forEach>
				</select><br>
				
				제한시간  <input type="text" name="problem_time" /> 
				제출횟수  <input type="text" name="problem_submitnum" /> 
				성공  <input type="text" name="problem_successnum" /> 
				레벨  <input type="text" name="problem_level" /> <br>
				
				<label>내용</label><br>
				<textarea name="problem_content" cols="100" rows="10"></textarea> <br>
				
				
				
				<button type="sumbit">등록</button>
			
		</div>
		
		</form>
	</div>
	

	


</body>
</html>
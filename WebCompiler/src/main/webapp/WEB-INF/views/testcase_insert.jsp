<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<p>테스트케이스 등록은  problem 테이블에 있는 문제만 됩니다!!<br>
	<p> 없는거 insert 하면 제약조건 걸려서 에러뜸
	<form action="t.do" method="post">
		<label>TestcaseVO</label><br>
		번호 <input type="text" name="problem_id"/> <br>
			<label>입력</label><br>
				<textarea name="testcase_input" cols="100" rows="10"></textarea> <br>
				<label>출력</label><br>
			<textarea name="testcase_output" cols="100" rows="10"></textarea> <br>
			<button type="sumbit">등록</button>
		</form>
	</div>
	

	


</body>
</html>
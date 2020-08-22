<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>${problem.problem_id}. ${problem.problem_title}</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_solve.css" />
</head>

<body>
	<div id="wrap">
		<header>
			<a class="back_btn" href="#"><img src="<%=request.getContextPath()%>/resources/images/back_btn.png" alt="뒤로가기"></a>
			<div class="problem_title">
				[ ${problem.problem_id} ] ${problem.problem_title}
			</div>
			<c:if test="${problem.problem_level == 1}">
    					<div class="problem_level" style="background-color: #FFCC80 ">
							LEVEL ${problem.problem_level}
						</div>
					</c:if>
					<c:if test="${problem.problem_level == 2}">
					    <div class="problem_level" style="background-color: #7BC379">
							LEVEL ${problem.problem_level}
						</div>
					</c:if>
					<c:if test="${problem.problem_level == 3}">
					    <div class="problem_level" style="background-color: #79BCC3">
							LEVEL ${problem.problem_level}
						</div>
					</c:if>
					<c:if test="${problem.problem_level == 4}">
					    <div class="problem_level" style="background-color: #EA7862">
							LEVEL ${problem.problem_level}
						</div>
					</c:if>
					
					<c:if test="${problem.problem_level == 5}">
					    <div class="problem_level" style="background-color: #8C699B">
							LEVEL ${problem.problem_level}
						</div>
					</c:if>
			<div class="problem_lang">
				<select class="lang_list" name="language">
					<option value="1" selected>JAVA</option>
					<option value="2">C</option>
					<option value="3">C++</option>
					<option value="4">Python</option>
					<option value="5">Javascript</option>
				</select>
			</div>
		</header>
		<aside>
			<div class="problem">
				${problem.problem_content}
				<h2 class="input_title">
					입력
				</h2>
				${testcase.testcase_input}
				<h2 class="output_title">
					출력
				</h2>
				${testcase.testcase_output}
			</div>
		</aside>
		<section class="code">
			<iframe src="<%=request.getContextPath()%>/resources/html/solve_editor.html" width="100%" height="100%"></iframe>
		</section>
		<section class="result">
			<div class="result_header">
				<div class="result_title">
					실행 결과
				</div>
				<a href="#">
					<div class="result_help">
						도와주세요!
					</div>
				</a>
			</div>
			<div class="result_main">

			</div>
			<div class="result_footer">
				<button class="submit_btn" type="button" name="button">제출</button>
				<button class="execute_btn" type="button" name="button">실행</button>
			</div>
		</section>
	</div>
</body>

</html>

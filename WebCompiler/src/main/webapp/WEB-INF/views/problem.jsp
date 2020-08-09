<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Solve Problem</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css" />
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_solve.css" type="text/css"/>
		<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" type="text/css"/>
	</head>
    <body>
			<div id="wrap">
        <header>
        	뒤로가기 등~
        </header>
        <aside>
					<div class="problem">
						<p>${problem.problem_id}
						<p>${problem.problem_content}</p>
					</div>
					<div class="input">
						<p>${testcase.testcase_input}</p>
					</div>
					<div class="output">
						<p>${testcase.testcase_output}</p>
					</div>
        </aside>
        <section class="code">
        	<iframe src="<%=request.getContextPath()%>/resources/html/editor.html" width="100%" height="100%"></iframe>
        </section>
				<section class="result">
					실행 결과~
				</section>
    </div>
    </body>

</html>
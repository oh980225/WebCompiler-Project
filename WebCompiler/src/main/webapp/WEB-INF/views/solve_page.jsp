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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
			<div class="problem_lang" onchange="chageLangSelect()">
				<select class="lang_list" name="language">
					<option value="java" selected>JAVA</option>
					<option value="c">C</option>
					<option value="c++">C++</option>
					<option value="python">Python</option>
					<option value="javascript">Javascript</option>
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
			<iframe id="iframe" onload="access()" src="<%=request.getContextPath()%>/resources/html/solve_editor.html" width="99.9%" height="100%"></iframe>
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
				<%-- ${result == null ? 'null' : result} --%>
			</div>
			<div class="result_footer">
				<button class="submit_btn" type="button" name="button">제출</button>
				<button class="execute_btn" type="button" name="button">실행</button>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		const iframe = document.getElementById("iframe");
		let innerDoc = null;
		const submit_btn = document.querySelector(".submit_btn");
		
		const access = () => {
		    innerDoc = iframe.contentDocument || iframe.contentWindow.document;
		}

		const codeSubmit = () => {
			let getCodeBtn = innerDoc.getElementById("getCode");
			getCodeBtn.click();
			
			let code = innerDoc.getElementById("code").value;
			console.log(code);

			let lang = innerDoc.getElementById("lang").value;
			console.log(lang);
			
			$.ajax({ 
				  url: '/submit',  
				  type: 'POST',
				  data: "code=" + encodeURIComponent(code) + "&lang=" + encodeURIComponent(lang),  
				  success: function(data) {
					  const result = data.result;
					  const printResult = document.querySelector(".result_main");
					  printResult.innerText = result;
					  console.log(data.result);
				  },
				  error: function() {
					  console.log("실패!");
				  }
			}); 
		}

		const chageLangSelect = () =>{
		    const langSelect = document.querySelector(".lang_list");
		    let selectValue = langSelect.options[langSelect.selectedIndex].value;
		    innerDoc.getElementById("lang").value = selectValue;
		    innerDoc.getElementById("getLang").click();
		}
		
		submit_btn.addEventListener("click", codeSubmit);
	</script>
</body>

</html>

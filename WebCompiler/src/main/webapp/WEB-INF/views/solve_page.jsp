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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/modal.css" />
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
	<div id="wrap">
		<header>
			<a class="back_btn" href="#"><img src="<%=request.getContextPath()%>/resources/images/back.png" alt="뒤로가기"></a>
			<div class="problem_title">
				<span>[ ${problem.problem_id} ] ${problem.problem_title}</span>
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
				<div class="problem_content">
					${problem.problem_content}
				</div>
				
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
					<span>실행 결과</span>
				</div>
				<!--  
				<a href="#">
					<div class="result_help">
						토론하기
					</div>
				</a>
				-->
				<div class="result_help" id="open">
						<a href="#">
							토론하기
							<img src="<%=request.getContextPath()%>/resources/images/chat.png">
						</a>
				</div>
				<div class="modal hidden">
                      <div class="modal_overlay">
                      </div>
                        <div class="help_modal">
                        <header class="modal_header">
                        	<div class="close"></div>
                        </header>
                        <div class="chat_list">
                        	<div class="chat_data">
                        		<div class="comment_image">
									<img src="<%=request.getContextPath()%>/resources/images/check.png">
								</div>
											
								<div class="comment_content">
									<p class="comment_user">mindi
									<p class="comment_content"> 인접 배열이 아닌 (유사) 인접 리스트 Way와 nWay를 사용하였으며 일반적인 위상정렬 알고리즘을 사용했습니다 직접 만든 예제 넣어봐도 잘 나오고 게시판에 적힌 다른 분들 예제도 다 잘 나오는데 제출 시 "틀렸습니다"라고 나오네요..
									<p class="comment_date">2020.09.16
								</div>
											

                        	</div>
                        	<div class="chat_data">
                        		<div class="comment_image">
									<img src="<%=request.getContextPath()%>/resources/images/check.png">
								</div>
											
								<div class="comment_content">
									<p class="comment_user">mindi
									<p class="comment_content"> 오! 반례 감사합니다ㅎㅎ  우선 풀던거풀고나서 다시 손대봐야겠습니다<br>
									<p class="comment_date">2020.09.16
								</div>
										
                        	</div>
                        	
                        	<div class="chat_data_me">			
								<div class="comment_content">
									<p class="comment_content"> 엥? 그냥 단순한 위상정렬 아닌가요?
									<p class="comment_date">2020.09.16
								</div>
                        	</div>
                        </div>
                        <div class="chat_textarea">
                        	<textarea id="chat_content" name="chat_content" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
							<div class="chat_send">
								<input id="chat_send" type="image" src="<%=request.getContextPath()%>/resources/images/submit.png" class="submit-button"
								onclick="comment_register()">
							</div>
                        </div>
                        </div>
                </div>
			</div>
			<div class="result_main">

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
				  success: function(code) {
					  console.log("성공");
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
<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
</body>

</html>

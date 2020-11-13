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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_solve_test_ui.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/modal.css" />
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
	<div id="wrap">
		<header>
			<a class="back_btn" href="/problem"><img src="<%=request.getContextPath()%>/resources/images/back.png" alt="뒤로가기"></a>

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
		<div style="height:calc(100vh - 2.8em);">
		<aside>
			<div class="problem">
				<div class="problem_content">
					${problem.problem_content}
				</div>
				
				<div class="line"></div>
				
				<div><!-- style="padding:0.5em" -->
				<h2 class="input_title">
					입력
				</h2>
				
				 	<div class="testcase">
				 		${testcase.testcase_input}
				 	</div>
				
				</div>
				
				 <div><!-- style="padding:0.5em" -->
				<div class="line"></div>
				
				<h2 class="output_title">
					출력
				</h2>
				<div class="testcase">
				 	${testcase.testcase_output}
				</div>
				</div>
				
			</div>
		</aside>
		<section class="code">
			<iframe id="iframe" onload="access()" src="<%=request.getContextPath()%>/resources/html/solve_editor.html" width="100%" height="100%"></iframe>
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
					<div class="modal hidden">
          				<div class="modal_overlay">
          				</div>
          			  	<div class="help_modal">
            				<header class="modal_header">
            					<img class="close" src="<%=request.getContextPath()%>/resources/images/close.png" width="15em" height="15em" alt="닫기">
            				</header>
            				<h1>안녕 난 Modal~~</h1>
            				<button class="button">☑</button>
          			  	</div>
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
                        <div class="chat_list" id="chat_list">
                        <!-- 
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
                        	
                        	-->
                        </div>
                       <div class="chat_textarea">
                        	<textarea id="chat_content" name="chat_content" onkeyup="enterkey();"></textarea>
							<div class="chat_send">
								<input id="chat_send" type="image" src="<%=request.getContextPath()%>/resources/images/submit.png" class="submit-button">
							</div>
                        </div>
                        </div>
                </div>
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
	</div>
	<script type="text/javascript">
	console.log("socket make");
	one = document.getElementById("one");
	two = document.getElementById("two");

	var flag = false;
	var u_id = "${user.user_id}";
	var chat_count = 1;
	var p_id="${problem.problem_id}";
	
	document.getElementById("open").addEventListener("click", function() {
	//웹 소켓 연결해주는 함수 호출
	connect();
	});

	document.getElementById("chat_send").addEventListener("click", function() {
		//연결을 해제해주는 함수 호출
		send();
	});
	
	var websocket;
	
	function formatDate(date) {
		var d = new Date(date),
		month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(),
		year = d.getFullYear();

		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		return [year, month, day].join('.');
	}

	function connect(){

		//websocket = new WebSocket("ws://localhost:8080/ws/chat.do");

		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		if(!flag){
			websocket = new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + "/chat.do");
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
			websocket.onclose = onClose;
			flag = true;
		}

		console.log("socket connect");
	}
	//퇴장 버튼을 눌렀을 때 호출되는 함수
	function disconnect(){
		msg = document.getElementById("nickname").value;
		websocket.send(msg+"님이 퇴장하셨습니다");
		websocket.close();
	}
	//보내기 버튼을 눌렀을 때 호출될 함수
	function send(){
		//var content = document.getElementById("message").value;
		var content = $("#chat_content").val();
		var msg = {
			    //type: "message",
			    chat_content: content,
			    user_id:   u_id,
			    problem_id: p_id
		};
		
		websocket.send(JSON.stringify(msg));
		$("#chat_content").val('');
	}
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             send();
        }
	}
	
	//웹 소켓에 연결되었을 때 호출될 함수
	function onOpen(){
		$("#chat_list").empty();
	 	// 데이터를 뿌린다...?
	 	$.ajax({
			url: "/chat/read.do",
			type: "GET",
			data: {
				"problem_id" : p_id
				},

				success: function(data){
					$(data).each(function(){
						//var idx = this.comments_id;
						var comment_id = "comments_" + chat_count;
					
		
						if(u_id == this.user_id){
							$("#chat_list").append("<div class='chat_data_me' id=" + comment_id + "></div>");
							$("#" +comment_id).append("<div class='comment_content'></div>");
						}
						else{
							$("#chat_list").append("<div class='chat_data' id=" + comment_id + "></div>");
							$("#" + comment_id).append("<div class='comment_image'></div>");

							$("#" +comment_id  + " .comment_image").append("<img src='/getByteImage/"+ this.user_id +"' width='50px' height='50px'>");
							$("#" +comment_id).append("<div class='comment_content'></div>");
							$("#" +comment_id +  " .comment_content").append("<p class='comment_user'>"+ this.user_id +"</p>");
						}

						$("#" +comment_id +  " div.comment_content").append("<p class='comment_content'>"+ this.chat_content +"</p>");
						$("#" +comment_id +  " div.comment_content").append("<p class='comment_date'>"+ formatDate(this.chat_date) +"</p>");

						chat_count++;
						

						});

						$("#chat_list").stop()
						.animate({ scrollTop: $('#chat_list')[0].scrollHeight }, 1000);
					},
					error:function(){

					}
		 	});
		 	
		
	}
	//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
	function onMessage(event){
		//data= evt.data;
		var msg = JSON.parse(event.data);
		//var chat_id = msg.chat_id;
		var chat_content = msg.chat_content;
		var user_id = msg.user_id;
		var chat_date = formatDate(msg.chat_date);

		//var idx = this.comments_id;
		var comment_id = "comments_" + chat_count;

		if(u_id == user_id){
			$("#chat_list").append("<div class='chat_data_me' id=" + comment_id + "></div>");
			$("#" +comment_id).append("<div class='comment_content'></div>");
		}
		else{
			$("#chat_list").append("<div class='chat_data' id=" + comment_id + "></div>");
			$("#" + comment_id).append("<div class='comment_image'></div>");

			$("#" +comment_id  + " .comment_image").append("<img src='/getByteImage/"+ user_id +"' width='50px' height='50px'>");
			$("#" +comment_id).append("<div class='comment_content'></div>");
			$("#" +comment_id +  " .comment_content").append("<p class='comment_user'>"+ user_id +"</p>");
		}

		$("#" +comment_id +  " div.comment_content").append("<p class='comment_content'>"+ chat_content +"</p>");
		$("#" +comment_id +  " div.comment_content").append("<p class='comment_date'>"+ chat_date +"</p>");

		chat_count++;
		$("#chat_list").stop()
		.animate({ scrollTop: $('#chat_list')[0].scrollHeight }, 100);
	}
	function onClose(){
		console.log("연결끊김");
		flag =  false;
	}
</script>
	<script type="text/javascript">
		const iframe = document.getElementById("iframe");
		let innerDoc = null;
		const submit_btn = document.querySelector(".submit_btn");
		const execute_btn = document.querySelector(".execute_btn");
		
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

			const printResult = document.querySelector(".result_main");
			printResult.innerHTML = "<H3>제출중입니다. 잠시만 기다려주세요.</H3>"
			
			$.ajax({ 
				  url: '/submit',  
				  type: 'POST',
				  data: "code=" + encodeURIComponent(code) + "&lang=" + encodeURIComponent(lang),  
				  success: function(data) {
					  const result = data.result;
					  printResult.innerHTML = result;
					  console.log(data.result);
				  },
				  error: function() {
					  console.log("실패!");
				  }
			}); 
		}

		const codeExecute = () => {
			let getCodeBtn = innerDoc.getElementById("getCode");
			getCodeBtn.click();
			
			let code = innerDoc.getElementById("code").value;

			let lang = innerDoc.getElementById("lang").value;


			const printResult = document.querySelector(".result_main");
			printResult.innerHTML = '<H3>실행중입니다. 잠시만 기다려주세요.</H3>';

			$.ajax({ 
				  url: '/execute',  
				  type: 'POST',
				  data: "code=" + encodeURIComponent(code) + "&lang=" + encodeURIComponent(lang),  
				  success: function(data) {
					  const result = data.result;
					  console.log(data.result);
					  printResult.innerHTML = result;
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
		execute_btn.addEventListener("click", codeExecute);
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/modal.css" />
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="one">
		별명:<input type="text" id="nickname" /> <input type="button"
		id="enter" value="입장" />
	</div>
	<div id="two" style="display: none">
		
	<div id="chatarea" style="width:400px; height:600px; border:1px solid;"></div>
		<input type="text" id="message" /> <input type="button" id="send"
	value="보내기" />
	</div>
	
	<div class="help_modal">
                        <header class="modal_header">
                        	<div class="close"></div>
                        </header>
                        <div class="chat_list" id="chat_list">
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
                        	<textarea id="chat_content" name="chat_content" ></textarea>
							<div class="chat_send">
								<input id="chat_send" type="image" src="<%=request.getContextPath()%>/resources/images/submit.png" class="submit-button">
							</div>
                        </div>
                        </div>
</body>
<script type="text/javascript">
	one = document.getElementById("one");
	two = document.getElementById("two");
	
	var u_id = "${user.user_id}";
	var chat_count = 0;
	//var p_id="${problem.problem_id}";
	
	document.getElementById("enter").addEventListener("click", function() {
	//웹 소켓 연결해주는 함수 호출
	connect();
	});

	document.getElementById("send").addEventListener("click", function() {
		//연결을 해제해주는 함수 호출
		send();
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
		websocket = new WebSocket("ws://localhost:8080/chat.do");
		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
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
			    user_id:   u_id//,
			    //problem_id: p_id
		};
		
		websocket.send(JSON.stringify(msg));
		$("#chat_content").val('');
	}
	//웹 소켓에 연결되었을 때 호출될 함수
	function onOpen(){
		nickname = document.getElementById("nickname").value;
		two = document.getElementById("two");
		two.style.display='block';
		//websocket.send(nickname + "님 입장하셨습니다.");
	}
	//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
	function onMessage(event){
		//data= evt.data;
		var msg = JSON.parse(event.data);
		//var chat_id = msg.chat_id;
		var chat_content = msg.chat_content;
		var user_id = msg.user_id;
		var chat_date = formatDate(msg.chat_date);
		
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = chat_content + "<br/>" + chatarea.innerHTML

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
	}
	function onClose(){

	}
</script>
</html>
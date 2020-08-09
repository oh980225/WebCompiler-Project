<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" type="text/css"/>
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css"/>
		<script>
		function passwdcheck(){	
			var passwd=document.getElementById("user_passwd").value;
			var passwd_check=document.getElementById("passwd_check").value;
			var msg = document.getElementById("alert_msg");

			
			if(passwd == passwd_check){
				msg.style.visibility = "hidden";
				
			}

			else{
				msg.style.visibility = "visible";
			}
		}

		
		
		function validate(){
			var id=document.getElementById("user_id");
			var passwd=document.getElementById("user_passwd");
			var passwd_check=document.getElementById("passwd_check");
			//아이디와 패스워드 값 데이터 정규화 공식
		     var regul_id = /^[a-zA-Z0-9]{4,12}$/;
		     var regul_passwd = /^[a-zA-Z0-9]{4,12}$/;

				
			 if ((id.value)=="") {
				 var msg = document.getElementById("id_alert");
				 msg.innerHTML="*필수 항목 입니다.";
				 msg.style.visibility = "visible";
		         id.focus();
		         return false;
		      }
			 if((passwd.value)=="") {
				 var msg = document.getElementById("passwd_alert");
				 msg.innerHTML="*필수 항목 입니다.";
				 msg.style.visibility = "visible";
				 passwd.focus();
		         return false;
			 }

		     	// 아이디 유효성 검사
		        if (!check(regul_id,id)) {
		        	id.value = "";
			        id.focus();	
		        	var msg = document.getElementById("id_alert");
		        	msg.innerHTML="아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.";
		        	msg.style.visibility = "visible";
		            return false;
		        }
		        if (!check(regul_passwd,passwd)) {
		        	passwd.value = "";
		        	passwd_check.value= "";
		        	passwd.focus();	
		        	var msg = document.getElementById("passwd_alert");
		        	msg.innerHTML="비밀번호는 4~16자의 대소문자와 숫자로만 입력 가능합니다.";
		        	msg.style.visibility = "visible";
		            return false;
		        }		        			 

				return true;
		}

		function check(re, what){//정규화데이터,아이템 id,메세지
	        if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
	        //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
	            return true;
	        }
	        else{
	        	return false;      
		    }
	          
	    }
	

		
		</script>

	</head>
	<body class="is-preload" >

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
							<form action="/web/join" method="post" onsubmit="return validate()">
							<div>		
		
								아이디 <input type="text" name="user_id" id="user_id" /> <p id="id_alert" style="color:red; visibility:hidden"> </p> 
								비밀번호   <input type="text" name="user_passwd" id="user_passwd"/> <p id="passwd_alert" style="color:red; visibility:hidden"> *필수 항목 입니다.</p>
								비밀번호 확인   <input type="text" id="passwd_check" onchange="passwdcheck()"/> 
								<p id="alert_msg" style="color:red; visibility:hidden"> 비밀번호가 일치하지 않습니다. </p>
					
								이름  <input type="text" name="user_name" id="user_name" /> <p id="id_alert" style="color:red; visibility:hidden"> *필수 항목 입니다.</p>
								
								<p>소개</p><br>
								<textarea name="user_introduce" cols="100" rows="10"></textarea> <br>
				
						
								<input type="submit" name="submit" value="회원 가입" >	
							</div>
		
							</form>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">



					<!-- Menu -->
					<!-- <nav id="menu">
						<header class="major">
							<h2><a href="index.html">Home</a></h2>
						</header>
						<ul>
							<li><span class="opener">Mypage</span>
								<ul>
									<li><a href="#">MyPage</a></li>
									<li><a href="mycode.html">MyCode</a></li>
									<li><a href="#">PlayGround</a></li>
								</ul></li>

							<li><a href="Q&A.html">Q & A</a></li>
							<li><a href="search.html">Code Table</a></li>
							<li><a href="explain.html">How to use it</a></li>
						</ul>
					</nav> -->
					<nav id="menu">
						<header class="major">
							<img class="icon" src="<%=request.getContextPath()%>/resources/images/user.png">
							<h3 class="name"><a href="/web/mypage">MR.O</a></h3>
						</header>
						<ul>
							<li><a href="/web"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
							<!-- <li>
								<span class="opener">Mypage</span>
								<ul>
									<li><a href="#">MyPage</a></li>
									<li><a href="mycode.html">MyCode</a></li>
									<li><a href="#">PlayGround</a></li>
								</ul>
							</li> -->
							<!-- <li><a href="Q&A.html">Q & A</a></li> -->
							<li><a href="search.html"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
							<!-- <li><a href="explain.html">How to use it</a></li> -->
							<li>
								<span class="opener"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</span>
								<ul>
									<li><a href="Q&A.html">Q & A</a></li>
									<li><a href="#">Free Board</a></li>
								</ul>
							</li>
						</ul>
					</nav>


							<!-- Section -->



							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>

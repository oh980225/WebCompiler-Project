<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.dms.web.domain.UserVO"%>
<%	
	String imgURL = "";
	if(request.getAttribute("user") !=null) {
		UserVO user = (UserVO)request.getAttribute("user");
		if(user.getUser_img() == null) {
			imgURL = (String)request.getContextPath() + "/resources/images/user.png";
		} else {
			imgURL = "/getByteImage/" + user.getUser_id();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>CODE SPACE</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_problem_insert.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

<script>
    function a(){
	var category = document.getElementById("category_name");	
	var category_value = category.options[category.selectedIndex].value;

	document.getElementById("category_id").value = category_value;
}
    </script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="<%=imgURL%>" />
			</jsp:include>
			
			<div class="inner">

				<section style="padding:0">
					<h3>테스트케이스</h3>
					<form action="testcase.do" method="post" onsubmit="return validate()">

		<div class="title_box" id="title_box">
			<span class="alert_msg" id="id_alert" style="margin-left: 2em;">
				<img id= "alert_img" class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />
					필수 입력 항목입니다.
			</span><br>
			번호 <input type="text" name="problem_id" id="problem_id"/>
			<input type="button" onclick="id_check(event)" class="id_check" value="문제확인">
				<span class="alert_msg" id="id_check_alert" >
					<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />
						작성할 테스트케이스에 대한 문제를 확인해주세요.
				</span>
			
			<br><br>
			입력  <span class="alert_msg" id="input_alert">
				<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />
					필수 입력 항목입니다.
			</span><br>
				<textarea name="testcase_input" cols="100" rows="10" id="testcase_input"></textarea> <br>
				출력  <span class="alert_msg" id="output_alert">
				<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />
					필수 입력 항목입니다.
			</span><br>
			<textarea name="testcase_output" cols="100" rows="10" id="testcase_output"></textarea> <br>
			
						</div>
						<button type="submit" class="board_submit">등록</button>
		</form>
		</section>
	</div>
				
			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script>
	var check=false;
	async function id_check(e) {
		e.preventDefault();
		var problem_id = $('#problem_id').val();
		if(problem_id == ""){ 
            return false;
        }
		await $.ajax({
            url: "/problem/idcheck.do",
            type: "POST",
            data: {
		            "problem_id": problem_id
		        },
            success: function(data){
            	
	            // 있는 문제
	            if(!data.flag){
	            	$("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/alert.png'></img>등록되지 않은 문제입니다.");
		            $("#id_check_alert").css("visibility","visible");
		            $("#id_check_alert").css("color","red");
		            problem_id.value = "";
		            check = false;
		        }
	            // 없는 문제
	            else {
	            	$("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/check.png'></img>문제확인 완료");
		            $("#id_check_alert").css("visibility","visible");
		            $("#id_check_alert").css("color","#7BC379");
	            	check = true;
		         }

	            console.log("checkDuplicating success!");
            },
            error: function(){
                console.log("checkDuplicating error!");
            }
        });
		
	}	
	function validate() {
		
        var problem_id = document.getElementById("problem_id");
        var testcase_input = document.getElementById("testcase_input"); 
        var testcase_output = document.getElementById("testcase_output");

        var msg;
        //아이디와 패스워드 값 데이터 정규화 공식
        var regul_id = /^[a-zA-Z0-9]{4,12}$/;
        var regul_passwd = /^[a-zA-Z0-9]{4,12}$/;

        //alert(id.value);
        if (problem_id.value == "") {
            var msg = document.getElementById("id_alert");
           // msg.innerHTML = "필수 입력 항목 입니다.";
            msg.style.visibility = "visible";
            problem_id.focus();
            return false;
        }
        msg = document.getElementById("id_alert");
        msg.style.visibility = "hidden";
        
       if(!check){
    	   $("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/alert.png'></img>문제 확인 필요");
       	$("#id_check_alert").css("color","red");
    	   $("#id_check_alert").css("visibility","visible");
    	   return false;
        }


       
        if ((testcase_input.value) == "") {
            var msg = document.getElementById("input_alert");
            //msg.innerHTML = "필수 입력 항목 입니다.";
            msg.style.visibility = "visible";
            testcase_input.focus();
            return false;
        }
        msg = document.getElementById("input_alert");
        msg.style.visibility = "hidden";
        
        if((testcase_output.value) == ""){
        	var msg = document.getElementById("output_alert");
            msg.style.visibility = "visible";
            testcase_output.focus();
            return false;
        }
        msg = document.getElementById("output_alert");
        msg.style.visibility = "hidden";
       
        return true;
    }

	</script>

</body>
<!--  <body>
    <div style="align:center">
    <form action="insert.do" method="post" onsubmit="return b()">
        <div width="50%" >

                제목   <input type="text" id="board_title" name="board_title"/> <p id="title_alert" style="color:red; visibility:hidden"> *제목을 입력하세요.</p> <br>

                문제번호   <input type="text" id="problem_id" name="problem_id" value=""/><br>
                <label>내용</label><br>
                <textarea id="board_content" name="board_content" cols="100" rows="10"></textarea> <p id="content_alert" style="color:red; visibility:hidden"> *내용을 작성해주세요.</p><br>
                <input type="submit" name="submit" value="회원 가입" >
        </div>

        </form>
    </div>



</body>
-->
</html>
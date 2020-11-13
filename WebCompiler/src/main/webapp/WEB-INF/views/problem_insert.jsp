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

				<section>
					<h3>문제 등록</h3>
					<form action="insert.do" method="post" onsubmit="return validate()">
						<div class="title_box" id="title_box">
							<div class="table-wrapper">
							
						<table>
						<thead>
						</thead>
						<tbody>
						<tr>
						<!-- 1열 번호 분류 레벨 -->
						<td class="table_key"> 번호</td>
						<td class="table_value"> <input type="text" name="problem_id" id="problem_id" style="width: 70px;"/>
						<input type="button" onclick="id_check(event)" class="id_check" value="중복확인">
						
						<span class="alert_msg" id="id_check_alert" style="color:red;">
						<img class="alert_img" id="alert_img"  src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						중복확인 안됨</span>
						</td>
						<td> <!-- 1열 번호 분류 레벨 -->
						</td>
						<td class="table_key">분류</td>
						<td><select id="category_name" onchange="a()">
									<option value="0">------ 선택 ------</option>
									<c:forEach var="category" items="${category}">
										<option value="${category.category_id}">${category.category_name}</option>
									</c:forEach>
								</select></td>
						
						<td class="table_key">레벨</td>
						<td><select id="level" onchange="level_select()">
									<option value="0">------ 선택 ------</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select></td>
						</tr>
						
						<!-- alert -->
						<tr>
						
						<td></td>
						<td class="alert"> <span class="alert_msg" id="id_alert" style="color:red;">
						<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						필수 입력 항목입니다.</span>
						</td>
						<td></td>
						<td></td>
						<td><span class="alert_msg" id="category_alert" style="color:red;">
						<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						필수 입력 항목입니다.</span></td>
						
						<td></td>
						<td><span class="alert_msg" id="level_alert" style="color:red;">
						<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						필수 입력 항목입니다.</span></td>
						</tr>
						
						<!-- 제목 -->
						<tr>
						<td class="table_key">
							제목
						</td>
						<td  class="table_value">
						<input
								type="text" name="problem_title" id="problem_title" />
						</td>
						</tr>
						<!-- alert -->
						<tr>
						<td></td>
						<td class="alert"><span class="alert_msg" id="title_alert" style="color:red;">
						<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						필수 입력 항목입니다.</span></td>
						</tr>
						
						<!-- 제한시간 -->
						<tr>
						<td class="table_key">제한시간 </td>
						<td  class="table_value"><input type="text" name="problem_time" id="problem_time" style="width: 50px;" /></td>
						</tr>
						
						<!-- alert -->
						<tr>
						<td></td>
						<td class="alert"><span class="alert_msg alert" id="time_alert" style="color:red;">
						<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png"
						width="15" height="15" /> 
						필수 입력 항목입니다.</span></td>
						</tr>
						</tbody>
							</table>
							</div>
							<%-- 번호 <input type="text" name="problem_id" id="problem_id" style="width: 50px;"/>
							
							분류
							<input type="hidden" name="category_id" id="category_id" />
								<select id="category_name" onchange="a()">
									<option value="0">------ 선택 ------</option>
									<c:forEach var="category" items="${category}">
										<option id="category_id" value="${category.category_id}">${category.category_name}</option>
									</c:forEach>
								</select>
							레벨 <!-- <input type="text" name="problem_level" /> -->
							<select id="category_name" onchange="a()">
									<option value="0">------ 선택 ------</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							<br>
							제목 <input
								type="text" name="problem_title" id="problem_title" />
							<br>
							
							제한시간 <input type="text" name="problem_time" style="width: 50px;" />
							<!-- 제출횟수  <input type="text" name="problem_submitnum" />
                                   	 성공  <input type="text" name="problem_successnum" />
                            		--> --%>
							 <br>
							 <div style="margin: 0 3em;">
							 문제 설명
							 <span class="alert_msg" id="content_alert">
							<img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />
									필수 입력 항목입니다.
							</span><br>
							<textarea name="problem_content" cols="100" rows="10" id="problem_content"></textarea>
							<br>
							 </div>
						</div>
						<button type="submit" class="board_submit">등록</button>
					
							<input type="hidden" name="category_id" id="category_id" />
							<input type="hidden" name="problem_level" id="problem_level" />
					</form>
				</section>
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
    	function a(){
			var category = document.getElementById("category_name");	
			var category_value = category.options[category.selectedIndex].value;
		
			document.getElementById("category_id").value = category_value;
		}
    	function level_select(){
    		var level = document.getElementById("level");	
    		var level_value = level.options[level.selectedIndex].value;

    		document.getElementById("problem_level").value = level_value;

    	}
    	let check=false;
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
		            if(data.flag){
		            	$("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/alert.png'></img>이미 등록된 문제입니다.");
		            	$("#id_check_alert").css("color","red");
			            $("#id_check_alert").css("visibility","visible");
			            problem_id.value = "";
			            check = false;
			        }
		            // 없는 문제
		            else {
		            	$("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/check.png'></img>중복확인 완료");
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
            var category_id = document.getElementById("category_id");
            var problem_title = document.getElementById("problem_title");
            var problem_level = document.getElementById("problem_level");
            var problem_content = document.getElementById("problem_content");
            var problem_time = document.getElementById("problem_time");
            //아이디와 패스워드 값 데이터 정규화 공식
            var regul_id = /^[a-zA-Z0-9]{4,12}$/;
            var regul_passwd = /^[a-zA-Z0-9]{4,12}$/;

            //alert(id.value);
            if (problem_id.value == "") {
                var msg = document.getElementById("id_alert");
                msg.style.visibility = "visible";
                problem_id.focus();
                return false;
            }
            if(!check){
            	$("#id_check_alert").html("<img id='alert_img' style='vertical-align: middle; margin-right:0.2em;' width='15' height='15' src='/resources/images/alert.png'></img>중복 확인 필요");
            	$("#id_check_alert").css("color","red");
         	   $("#id_check_alert").css("visibility","visible");
         	   return false;
            }

            if((category_id.value) == ""){
            	var msg = document.getElementById("category_alert");
                msg.style.visibility = "visible";
                category_id.focus();
                return false;
            }

            if((problem_level.value) == ""){
            	var msg = document.getElementById("level_alert");
                msg.style.visibility = "visible";
                problem_level.focus();
                return false;
            }
           

            if ((problem_title.value) == "") {
                var msg = document.getElementById("title_alert");
            
                msg.style.visibility = "visible";
                problem_title.focus();
                return false;
            }
           
            
            
            if((problem_content.value) == ""){
            	var msg = document.getElementById("content_alert");
                msg.style.visibility = "visible";
                problem_content.focus();
                return false;
            }
            if((problem_time.value) == ""){
            	var msg = document.getElementById("time_alert");
                msg.style.visibility = "visible";
                problem_time.focus();
                return false;
            }

           
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
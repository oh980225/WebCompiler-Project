<%@page import="org.dms.web.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<!-- 1 -->
	<%
		MyClass cls = (MyClass) request.getAttribute("myCls");
	%>
	number:<%=cls.getNumber()%><br> name:<%=cls.getName()%><br>

	<!--2 -->
	<br>
	<br> number:${myCls.number}
	<br> name: ${myCls.name }

	<!-- 3 -->
	<form>
		아이디:<input type="text" id="checkid"><br> <br>
		<button type="button" id="_check" onclick="idcheck()">id 체크</button>
	</form>
	<p id="result"><p>

	<script>
		function idcheck() {
			alert("idCheck");

			$.ajax({
				url : "./idCheck.do",
				type : "get",
				data : "id=" + $("#checkid").val(),
				success : function(data) {
					$('#result').text(data);
					//alert("되요ㅋ");
					//alert(data);
				},
				error : function() {
					alert("에러나요");
				}
			})
		}
	</script>
	
	
	<label> 레벨 </label>
		<select id="problem_level" onchange="a()">
				<option value="0">------ 선택 ------</option>
				<option value="1">LEVEL 1</option>
				<option value="2">LEVEL 2</option>
				<option value="3">LEVEL 3</option>
				<option value="4">LEVEL 4</option>
				<option value="5">LEVEL 5</option>
		</select>
			
		<label style="margin-top: 30px">  분류 </label>
		<select id="category_name" onchange="a()">
			<option value="0">------ 선택 ------</option>
			<c:forEach var="category" items="${category}">
				<option value="백트래킹">백트래킹</option>
				<option value="다이나믹">다이나믹</option>
				<option value="dfs">dfs</option>
				<option value="bfs">bfs</option>
				
			</c:forEach>
		</select>
		<script>
		/*
		function idcheck() {
			alert("idCheck");

			$.ajax({
				url : "./idCheck.do",
				type : "get",
				data : "id=" + $("#checkid").val(),
				success : function(data) {
					$('#result').text(data);
					//alert("되요ㅋ");
					//alert(data);
				},
				error : function() {
					alert("에러나요");
				}
			})
		}
		*/
		function a(){
			var level = document.getElementById("problem_level")
			var category = document.getElementById("category_name");

			var level_value = level.options[level.selectedIndex].value;
			var category_value = category.options[category.selectedIndex].value;

			if(level_value != 0 && category_value != 0){
				//document.getElementById("result").innerHTML = form.problem_level + form.category_name;
				$.ajax({
		            url: "./problemList.do",
		            type: "GET",
		            data: {
			            "problem_level": level_value,
			            "category_name": category_value
			        },
		            success: function(data){
		                $('#result').text(data);
		            },
		            error: function(){
		                alert("simpleWithObject err");
		            }
		        });
			}  
		}
		</script>
		

	<!-- 4 -->
	<form method="post">
		이름: <input type="text" id="_name" value="홍길동"><br> 전화: <input
			type="text" id="_phone" value="123-4567-789"><br> 이메일: <input
			type="text" id="_email" value="http200@kakao.com"><br>
		생년월일: <input type="text" id="_birth" value="2001/11/23"><br>
		<button type="button" id="account">account</button>
	</form>

	<script type="text/javascript">
		$("#account").click(function() {
			//alert("click");

			var human = {
				name : $("#_name").val(),
				tel : $("#_phone").val(),
				email : $("#_email").val(),
				birth : $("#_birth").val()
			};
			console.log(human);
			$.ajax({
				url : "./account.do",
				data : human,
				type : "post",
				dataType : "json",
				async : true,
				success : function(resp) {
					alert("success");
					alert(resp.msg);
					alert(resp.name);

				},
				error : function() {
					alert("error")
				}
			});
		});
	</script>

	<br>
	<br>
	<br>
	<!-- 5 -->

	이름:
	<input type="text" id="_name1" value="정수동">
	<br> 전화:
	<input type="text" id="_phone1" value="123-4567-589">
	<br> 이메일:
	<input type="text" id="_email1" value="http200@kakao.com">
	<br> 생년월일:
	<input type="text" id="_birth1" value="2001-11-21">
	<button type="button" id="account1">account</button>
	<br>

	<script>
		/* Json -> Map */

		$("#account1").on("click", function() {
			//alert("account1")
			var data = {};

			data["name"] = $("#_name1").val();
			data["tel"] = $("#_phone1").val();
			data["email"] = $("#_email1").val();

			var birth = $("#_birth1").val();
			data["birth"] = birth.replace(/-/g, "");
			//alert(data["birth"]);

			$.ajax({
				contentType : 'application/json',
				dataType : 'json',
				url : "updateUser.do",
				type : 'post',
				data : JSON.stringify(data), // json -> string <-> parse
				success : function(resp) {
					alert("success")
				},
				error : function() {
					alert("error");
				}
			});
		});
	</script>

</body>
</html>










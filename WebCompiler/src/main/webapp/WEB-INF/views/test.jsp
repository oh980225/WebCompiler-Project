<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function btn(){
	var temp = $('#login-id').val();
	//alert(temp);
	
	$.ajax({
		type: "POST", 
		url: "http://localhost:8080/test", 
		data: { 
			"username" : $('#login-id').val(), 
			"password" : $('#login-pw').val()
			},
			success: function(data) { 
				$('#result').text(data); 
				alert('로그인 정보가 올바르지 않습니다.');
			
				}, 
			error: function() { 
				alert('로그인 정보가 올바르지 않습니다.');
				} 
			});
	
}

/*
			$('#login-btn').click(function(){ 
				alert( $('#login-id').val());
				$.ajax({
					type: "POST", 
					url: "test", 
					data: { 
						"username" : $('#login-id').val(), 
						"password" : $('#login-pw').val()
						},
						success: function(data) { 
							$('#result').text(data); 
							alert('로그인 정보가 올바르지 않습니다.');
						
							}, 
						error: function() { 
							alert('로그인 정보가 올바르지 않습니다.');
							} 
						});
				});
				*/
  </script>
</head>
<body>
   아이디 <input type="text" id="login-id">
   비밀번호 <input type="text" id="login-pw">
   <input type="button" id="login-btn" name="login" onclick="btn()" value="버튼" >버튼</button>
<p id="result"></p>
</body>
</html>
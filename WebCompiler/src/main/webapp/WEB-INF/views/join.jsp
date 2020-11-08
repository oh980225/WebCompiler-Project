<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_join.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

    <script>
    	function id_validate(){
    		var regul_id = /^[a-zA-Z0-9]{5,12}$/;
    		var id = document.getElementById("user_id");

    		 // 아이디 유효성 검사
            if (!check(regul_id, id)) {
                id.value = "";
                id.focus();
                var msg = document.getElementById("id_alert");
                msg.innerHTML = "아이디는 5~12자의 대소문자와 숫자로만 입력 가능합니다.";
                msg.style.visibility = "visible";
                return false;
            }
            else{
            	var msg = document.getElementById("id_alert");
                msg.style.visibility = "hidden";
                return false;
               }
    		
        	}
    	function passwd_validate(){
    		var regul_passwd = /^[a-zA-Z0-9]{5,12}$/;
    		var passwd = document.getElementById("user_passwd");

    		// 아이디 유효성 검사
            if (!check(regul_passwd, passwd)) {
            	passwd.value = "";
            	passwd.focus();
                var msg = document.getElementById("passwd_alert");
                msg.innerHTML = "비밀번호는 5~12자의 대소문자와 숫자로만 입력 가능합니다.";
                msg.style.visibility = "visible";
                return false;
            }
            else{
            	 var msg = document.getElementById("passwd_alert");
                 msg.style.visibility = "hidden";
                 return false;
                }
        	}

        function passwdcheck() {
            var passwd = document.getElementById("user_passwd").value;
            var passwd_check = document.getElementById("passwd_check").value;
            var msg = document.getElementById("passwd_checkalert");


            if (passwd == passwd_check) {
                msg.style.visibility = "hidden";

            }

            else {
                msg.style.visibility = "visible";
            }
        }

        function validate() {
            var id = document.getElementById("user_id");
            var passwd = document.getElementById("user_passwd");
            var passwd_check = document.getElementById("passwd_check");
            var name = document.getElementById("user_name");
            //아이디와 패스워드 값 데이터 정규화 공식
            var regul_id = /^[a-zA-Z0-9]{4,12}$/;
            var regul_passwd = /^[a-zA-Z0-9]{4,12}$/;

            //alert(id.value);
            if (id.value == "") {
                var msg = document.getElementById("id_alert");
                msg.innerHTML = "필수 입력 항목 입니다.";
                msg.style.visibility = "visible";
                id.focus();
                return false;
            }
           

            if ((passwd.value) == "") {
                var msg = document.getElementById("passwd_alert");
                msg.innerHTML = "필수 입력 항목 입니다.";
                msg.style.visibility = "visible";
                passwd.focus();
                return false;
            }
            
            
            if((name.value) == ""){
            	var msg = document.getElementById("name_alert");
                msg.style.visibility = "visible";
                name.focus();
                return false;
            }

           
            return true;
        }

        function check(re, what) {//정규화데이터,아이템 id,메세지
            if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
                //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
                return true;
            }
            else {
                return false;
            }

        }
        async function checkDuplicating(e) {
        	e.preventDefault();
            const inputId = document.getElementById("user_id");
            const idValue = inputId.value;
            const form = document.getElementsByTagName("form");
            let signUp = true;
        	await $.ajax({
	            url: "/checkDuplicating",
	            type: "POST",
	            data: {
			            "value": idValue
			        },
	            success: function(data){
		            if(!data.isRight) {
		            	signUp = false;
			            alert("아이디가 중복됬습니다.");
			            inputId.value = "";
			        }	       
		            console.log("signUp : " + signUp);
		            console.log("checkDuplicating success!");
	            },
	            error: function(){
	                console.log("checkDuplicating error!");
	            }
	        });
	        console.log(signUp);
	        if(signUp) {
		        form[0].submit();
		    }
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
				<jsp:param name="imgURL" value="" />
			</jsp:include>
            
            <div class="inner">

                <section>
                    <h3>회원가입</h3>
                    <form action="/join.do" method="post" onsubmit="return validate()">
                        <div class="title_box" id="title_box">

                            <div class="table-wrapper">

                                <table>
                                    <thead>

                                    </thead>
                                    <tbody>
                                        <!-- 아이디 -->
                                        <tr>
                                            <td class="table_key">
                                                <span class="board_title">아이디</span>
                                            </td>
                                            <td class="table_value">
                                                <input type="text" name="user_id" id="user_id"  onchange="id_validate()"/>
                                                <!--<input class="id_button" type="button" id="" name="board_title" />  -->
                                            </td>

                                        </tr>
                                        <!-- 필수입력 -->
                                        <tr>
                                            <td></td>
                                            <td><span class="alert_msg" id="id_alert" style="color:red; visibility:hidden"><img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" />  필수 입력 항목입니다.</span></td> <!-- -->
                                        </tr>
                                        <!-- 비밀번호 -->
                                        <tr>
                                            <td class="table_key">
                                                <span>비밀번호</span>
                                            </td>
                                            <td class="table_value">
                                                <input type="text" name="user_passwd" id="user_passwd" value="" onchange="passwd_validate()" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><span class="alert_msg" id="passwd_alert" style="color:red; visibility:hidden"><img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" /> 필수 입력 항목입니다.</span></td> <!-- visibility:hidden-->
                                        </tr>
                                        <!-- 비밀번호 확인 -->
                                        <tr>
                                            <td class="table_key">
                                                <span>비밀번호 확인</span>
                                            </td>
                                            <td>
                                                <input type="text" id="passwd_check" onchange="passwdcheck()" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><span class="alert_msg" id="passwd_checkalert" style="color:red; visibility:hidden"><img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" /> 비밀번호가 일치하지 않습니다.</span></td> <!-- visibility:hidden-->
                                        </tr>
                                        <!-- 이름 -->
                                        <tr>
                                            <td class="table_key">
                                                <span>이름</span>
                                            </td>
                                            <td>
                                                <input type="text" name="user_name" id="user_name" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><span class="alert_msg" id="name_alert" style="color:red; visibility:hidden"><img class="alert_img" src="<%=request.getContextPath()%>/resources/images/alert.png" width="15" height="15" /> 필수 입력 항목입니다.</span></td> <!-- visibility:hidden-->
                                        </tr>
                                        <!-- 자기소개 -->
                                        <tr>
                                            <td class="table_key">
                                                <span>자기소개</span>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="">
                                                <textarea class="board_content" name="user_introduce" id="user_introduce" cols="100" rows="6"></textarea>
                                            </td>

                                        </tr>

                                    </tbody>
                                    <tfoot>

                                    </tfoot>

                                </table>
                            </div>
                            </div>
                            <button type="button" class="board_submit" id="board_submit" onclick="checkDuplicating(event)">등록</button>
                    </form>
                </section>
            </div>
        </div>

    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

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
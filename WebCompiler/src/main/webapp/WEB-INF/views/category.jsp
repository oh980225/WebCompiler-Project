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
		function b(){
			alert("hello!");
		}
	
		
		function a(){
			var level = document.getElementById("problem_level")
			var category = document.getElementById("category_name");

			var level_value = level.options[level.selectedIndex].value;
			var category_value = category.options[category.selectedIndex].value;

			if((level_value != 0 && category_value != 0) || (level_value == 0 && category_value == "unselected")){
				//document.getElementById("result").innerHTML = form.problem_level + form.category_name;
				$.ajax({
		            url: "./problemList.do",
		            type: "GET",
		            data: {
			            "problem_level": level_value,
			            "category_name": category_value
			        },
		            success: function(data){			            
			            var problem = data.list;
			            
			            $("#problem tr:not(:first)").remove();  

			            var body = document.getElementById('problem_body');
			            // var row = my_tbody.insertRow(0); // 상단에 추가
			            

			            for(var i=0; i< problem.length; i++) {
			            	var row = body.insertRow( body.rows.length ); // 하단에 추가
			            	row.insertCell(0).innerHTML = problem[i].problem_id;
			            	row.insertCell(1).innerHTML = '<a href="problem/'+problem[i].problem_id+'" style="border:0">' + problem[i].problem_title+ '</a>'//problem[i].problem_title;
			            	row.insertCell(2).innerHTML = problem[i].problem_successnum;
			            	row.insertCell(3).innerHTML = "O";
			            	
			            }

		            },
		            error: function(){
		                alert("simpleWithObject err");
		            }
		        });
			}
			
		}
		</script>

	</head>
	<body class="is-preload" >

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<!-- <header id="header">
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>-->
								

							<!-- Content -->
								<section>
									<!-- Break -->
									<div class="col-12">
										<label> 레벨 </label>
											<select id="problem_level" onchange="b()">
													<option value="0">------ 선택 ------</option>
													<option value="1">LEVEL 1</option>
													<option value="2">LEVEL 2</option>
													<option value="3">LEVEL 3</option>
													<option value="4">LEVEL 4</option>
													<option value="5">LEVEL 5</option>
											</select>
											
											<label style="margin-top: 30px">  분류 </label>
												<select id="category_name" onchange="b()">
													<option value="unselected">------ 선택 ------</option>
													<c:forEach var="category" items="${category}">
														<option value="${category.category_id}">${category.category_name}</option>
													</c:forEach>
												</select>
									</div>
									<br>

									<div class="table-wrapper">
										<table id=problem>
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>정답률</th>
													<th style="text-align:center">O/X</th>
												</tr>
												</thead>
											<tbody id=problem_body>
											
											 <c:forEach var="problem" items="${problem}" >
												  <tr>
												    <td>
												    	<strong>
												    		<font color="blue"><c:out value="${problem.problem_id}"/>
												    		</font>
												    	</strong>
												    	</td>
												    <td>
												    	<c:out value="${problem.problem_title}"/>
												    </td>
												    <td><c:out value="98"/></td>
												    <td><c:out value="O"/></td>
												  </tr>
											</c:forEach>
												<tr>
													
												</tr>
							
											</tbody>
											<tfoot>
												<tr>
												<td colspan="2" onClick = " location.href='http://ihouse.so.vc' "></td>
												<td></td>
												</tr>
											</tfoot>
											</table>
									</div>
								</section>

						</div>
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
								<c:if test="${user.user_id == null}">
										<h3 class="name"><a href="/web/login">먼저 로그인 해주세요!</a></h3>
								</c:if>
								<c:if test="${user.user_id != null}">
									<h3 class="name"><a href="/web/mypage">${user.user_id}</a></h3>
								</c:if>
						</header>
						<ul>
							<li><a href="index.html"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
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

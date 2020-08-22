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
		function getBoardList(page){		
			$.ajax({
	            url: "./category_test.do",
	            type: "GET",
	            data: "page="+page,
	            success: function(data){	
	            	           
		            var problem = data.list;
		            var pageMaker = data.pageMaker;
		            $("#problem tr:not(:first)").remove();  
		            		 
		            var body = document.getElementById('problem_body');
		            // var row = my_tbody.insertRow(0); // 상단에 추가
		            
						
		            for(var i=0; i< problem.length; i++) {
		            	var row = body.insertRow( body.rows.length ); // 하단에 추가
		            	row.insertCell(0).innerHTML = problem[i].problem_id;
		            	row.insertCell(1).innerHTML = '<a href="problem/'+problem[i].problem_id+'" style="border:0">' + problem[i].problem_title+ '</a>'//problem[i].problem_title;
		            	row.insertCell(2).innerHTML = pageMaker.startPage;
		            	row.insertCell(3).innerHTML = pageMaker.endPage;
		            	
		            }
					
		            var elem = '';
		            //var num = 0;
		            // start
		            /*if(pageMaker.prev){
			            elem = elem + '<li><a href="javascript:getBoardList(' + pageMaker.startPage - 1 + ') "> ◀  </a></li>';
			            }
		            */
		            $("#pagenav").empty();
		            
		            for(var i=pageMaker.startPage; i < pageMaker.endPage + 1; i++) {
			            if(page == i){
			            	var txt = '<li onclick="a(' + i + ')" value="' + i + '"></li>';
			            	$("#pagenav").append('<li onclick="getBoardList(' + i + ')" value="' + i + '" style="border:0; color:blue">' + i + '</li>');
			     
				        }
			            else{
			            	var txt ='<li onclick="a(' + i + ')" value="' + i + '"></li>';
			            	$("#pagenav").append('<li onclick="getBoardList(' + i + ')" value="' + i + '">' + i+ '</li>');
				        }       
		            }
		           
		            // end
		            /*if(pageMaker.next && pageMaker.endPage > 0){
		            	elem = elem + '<li><a href="javascript:getBoardList(' + pageMaker.endPage - 1 + ') "> ▶ </a></li>';
			            }*/
		            

	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });

		}
		
		function a(page){
			var level = document.getElementById("problem_level")
			var category = document.getElementById("category_name");

			var level_value = level.options[level.selectedIndex].value;
			var category_value = category.options[category.selectedIndex].value;

			if((level_value != 0 && category_value != 0) || (level_value == 0 && category_value == "unselected")){
				//document.getElementById("result").innerHTML = form.problem_level + form.category_name;
				$.ajax({
		            url: "./problemList_test.do",
		            type: "GET",
		            data: {
			            "problem_level": level_value,
			            "category_name": category_value,
			            "page": page
			        },
		            success: function(data){			            
			            var problem = data.list;
			            var pageMaker = data.pageMaker;
			            $("#problem tr:not(:first)").remove();  

			            var body = document.getElementById('problem_body');
			            // var row = my_tbody.insertRow(0); // 상단에 추가
			            
			            for(var i=0; i< problem.length; i++) {
			            	var row = body.insertRow( body.rows.length ); // 하단에 추가
			            	row.insertCell(0).innerHTML = problem[i].problem_id;
			            	row.insertCell(1).innerHTML = '<a href="problem/'+problem[i].problem_id+'" style="border:0">' + problem[i].problem_title+ '</a>'//problem[i].problem_title;
			            	row.insertCell(2).innerHTML = pageMaker.startPage;
			            	row.insertCell(3).innerHTML = pageMaker.endPage;
			            	
			            }
			           
			            
			            /*if(pageMaker.prev){
				            elem = elem + '<li><a href="javascript:getBoardList(' + pageMaker.startPage - 1 + ') "> ◀  </a></li>';
				            }
			            */
			          
			            $("#pagenav").empty();
			            
			            for(var i=pageMaker.startPage; i < pageMaker.endPage + 1; i++) {
				            if(page == i){
				            	var txt = '<li onclick="a(' + i + ')" value="' + i + '" style="border:0"></li>';
				            	$("#pagenav").append('<li onclick="a(' + i + ')" value="' + i + '" style="color:blue">' + i + '</li>');
				     
					        }
				            else{
				            	var txt ='<li onclick="a(' + i + ')" value="' + i + '"></li>';
				            	$("#pagenav").append('<li onclick="a(' + i + ')" value="' + i + '">' + i+ '</li>');
					        }       
			            }
			        
			            //document.getElementById('pagenav').innerHTML = elem;

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
									<div>
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
													<option value="unselected">------ 선택 ------</option>
													<c:forEach var="category" items="${category}">
														<option value="${category.category_id}">${category.category_name}</option>
													</c:forEach>
												</select>
									</div>
									<br>

									<div class="table-wrapper">
										<table id="problem">
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
												
											</tfoot>
											</table>
											
												
											<div>
												<!--  <ul>
												<c:if test="$test{pageMaker.prev}">
													<li><a href=*category_test${pageMaker.makeQuery(pageMaker.startPage - 1) }">이전</a></li>
													</c:if> 
												<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
    												<li><a href="category_test${pageMaker.makeQuery(page)}">${page}</a></li>
												    </c:forEach>
												
												    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
												    	<li><a href="category_test${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
												    </c:if> 
												</ul>
												-->
												<ul id="pagenav" >
													   <c:if test="$test{pageMaker.prev}">
															<li><a href="javascript:getBoardList(pageMaker.startPage - 1)">이전</a></li>
														</c:if> 
														<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
	    													<li onclick="javascript:getBoardList(this.value)" value="${page}">${page}</li>
													    </c:forEach>
													    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													    	<li><a href="javascript:getBoardList(pageMaker.endPage + 1)">다음</a></li>
													    </c:if>
														
												</ul>
												
											</div>
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
										<h3 class="name"><a href="/login">먼저 로그인 해주세요!</a></h3>
								</c:if>
								<c:if test="${user.user_id != null}">
									<h3 class="name"><a href="/mypage">${user.user_id}</a></h3>
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

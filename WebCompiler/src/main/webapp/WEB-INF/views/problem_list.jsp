<%@page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
<!DOCTYPE HTML>
<!--
    Editorial by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
    <title>JAVA 버전 컴파일러 화면</title>
   
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_problem.css" />
		
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css"/>
	<script>
		function link( event ) {
			location.href = '/problem/' + event.data.problem_id ;
		}
		
		function getBoardList(page){	
			var level = document.getElementById("problem_level")
			var category = document.getElementById("category_name");

			var level_value = level.options[level.selectedIndex].value;
			var category_value = category.options[category.selectedIndex].value;
			$.ajax({
	            url: "./problem.do",
	            type: "GET",
	            //data: "page="+page,
	            data: {
			            "problem_level": level_value,
			            "category_name": category_value,
			            "page": page//page
			        },
	            success: function(data){	           
		            var problem = data.list;
		            var pageMaker = data.pageMaker;

		            
		        
		            for(var i=0; i< problem.length; i++) {
		            	var temp = problem[i].problem_successnum / problem[i].problem_submitnum * 100;
		            	var percent= temp.toFixed(1); // 99.98765 출력
						var str= "location.href='/problem/" + problem[i].problem_id + "'";
				        var idx = i + 1;
				        var id = problem[i].problem_id;
				        //$("#problem_item_"+id).on(myfunc(id));

				        //$("#problem_item_"+idx).on("click", function(idx) { alert(idx); });
		            	$( "#problem_item_"+idx ).on( "click", {
		            		problem_id: id
						}, link );

		            	$("#item_title_"+idx).html(problem[i].problem_id + ". " + problem[i].problem_title);
		            	$("#item_submit_"+idx).html(problem[i].problem_submitnum);
		            	$("#item_level_"+idx).html("LEVEL " +problem[i].problem_level);

		            	if(problem[i].problem_level == 1){ $("#item_level_"+idx).css("background-color", "#FFCC80"); }
		            	if(problem[i].problem_level == 2){ $("#item_level_"+idx).css("background-color", "#7BC379"); }
		            	if(problem[i].problem_level == 3){ $("#item_level_"+idx).css("background-color", "#79BCC3"); }
		            	if(problem[i].problem_level == 4){ $("#item_level_"+idx).css("background-color", "#EA7862"); }
		            	if(problem[i].problem_level == 5){ $("#item_level_"+idx).css("background-color", "#8C699B"); }
		            	
		            	
		            	$("#item_success_"+idx).html("맞은사람: " + problem[i].problem_successnum);
		            	$("#item_percent_"+idx).html("정답률: " + percent + "%");
		            	//$("#item_check_"+(i+1)).html(problem[i].problem_id);
		            	$("#item_submit_"+ idx).html("제출: " + problem[i].problem_submitnum);
		            	$("#problem_item_"+ idx).css("display","inline-block");

		            	
		            }
		            // 나머지 요소 숨기기
					if(problem.length < 8){
						for(var i=problem.length + 1; i <= 8; i++){
							$("#problem_item_"+i).css("display","none");
							
							}
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
			            	$("#pagenav").append('<li class="page_num page_on" onclick="getBoardList(' + i + ')" value="' + i + '"><a>' + i + '</a></li>');
			     
				        }
			            else{
			            	var txt ='<li onclick="a(' + i + ')" value="' + i + '"></li>';
			            	$("#pagenav").append('<li class="page_num" onclick="getBoardList(' + i + ')" value="' + i + '"><a>' + i+ '</a></li>');
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

		</script>
</head>

<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <!-- Header -->
           <header id="header">
							<a class="main_logo" href="/"><img src="<%=request.getContextPath()%>/resources/images/main_logo.png" alt="메인페이지" /></a>
							<a class="header_problem" href="/problem"><img src="<%=request.getContextPath()%>/resources/images/header_problem.png" alt="문제 페이지" />문제풀기</a>
							<a class="header_board" href="/board"><img src="<%=request.getContextPath()%>/resources/images/header_board.png" alt="게시판 페이지" />자유게시판</a>
							<c:if test="${user.user_id == null}">
							<a class="header_signup" href="/join"><img src="<%=request.getContextPath()%>/resources/images/header_signup.png" alt="회원가입" /><span>회원가입</span></a>
							<a class="header_signin" href="/login"><img src="<%=request.getContextPath()%>/resources/images/header_signin.png" alt="로그인" /><span>로그인</span></a>
							</c:if>
							<c:if test="${user.user_id != null}">
							<a class="header_signout" href="/logout.do"><img src="<%=request.getContextPath()%>/resources/images/header_signout.png" alt="로그아웃" /><span>로그아웃</span></a>
							<div class="header_profile" style="cursor: pointer;" onClick="location.href='/mypage'">
								<img class="img" src=<%=imgURL%> alt="사용자 사진">
								<div class="name_intro">
									<div class="header_name">
										<a href="?name=Mr.O">${user.user_name}</a>
									</div>
									<div class="header_intro">
										${user.user_introduce}
									</div>
								</div>
							</div>
							</c:if>

						</header>
            <div class="inner">
                <!-- Content -->
                
                <section>
                    <!--
            <h3 class="problem_title">코드 조회</h3>
        -->

                    <br>
                    <!-- Break -->
                    <div class="col-12 level">
                        <select name="problem_level" id="problem_level" onchange="getBoardList()">
                            <option value="0">------ 선택 ------</option>
							<option value="1">LEVEL 1</option>
							<option value="2">LEVEL 2</option>
							<option value="3">LEVEL 3</option>
							<option value="4">LEVEL 4</option>
							<option value="5">LEVEL 5</option>
                        </select>
                        <div class="select_arrow"></div>
                    </div>
                    <!-- Break -->
                    <div class="col-12 kind">
                        <select name="category_name" id="category_name" onchange="getBoardList()">
                        		<option value="unselected">------ 선택 ------</option>
                            	<c:forEach var="category" items="${category}">
									<option value="${category.category_id}">${category.category_name}</option>
								</c:forEach>
                        </select>
                        <div class="select_arrow"></div>
                    </div>
                   <div class="col-12 name">
						<select name="demo-category" id="demo-category2">
						<option value="">-- 선택 --</option>
						<option value="problem_title">제목</option>
							<option value="problem_id">문제번호</option>
							</select>
						<div class="small_arrow"></div>
					</div>
                    <input class="search" type="text" name="search" placeholder="검색">

                    <br>

                    <div id ="container" class="container">
						 <c:forEach var="problem" items="${problem}"  varStatus="status">
			                 <c:if test="${status.count%2 == 1 }">
			                 <div class="problem_container_left">
			            
			                
			                <div id="problem_item_${status.count}" class="problem_item" onclick="location.href='/problem/${problem.problem_id}'">
			                    <div class="item_top" >
			                        <span class="problem_title" id="item_title_${status.count}">${problem.problem_id}. ${problem.problem_title}</span>
			                        <c:if test="${problem.problem_level == 1}">
				    					<div class="problem_level" id="item_level_${status.count}" style="background-color: #FFCC80 ">
											LEVEL ${problem.problem_level}
										</div>
									</c:if>
									<c:if test="${problem.problem_level == 2}">
									    <div class="problem_level" id="item_level_${status.count}" style="background-color: #7BC379">
											LEVEL ${problem.problem_level}
										</div>
									</c:if>
									<c:if test="${problem.problem_level == 3}">
									    <div class="problem_level" id="item_level_${status.count}" style="background-color: #79BCC3">
											LEVEL ${problem.problem_level}
										</div>
									</c:if>
									<c:if test="${problem.problem_level == 4}">
									    <div class="problem_level" id="item_level_${status.count}"style="background-color: #EA7862">
											LEVEL ${problem.problem_level}
										</div>
									</c:if>
									
									<c:if test="${problem.problem_level == 5}">
									    <div class="problem_level" id="item_level_${status.count}" style="background-color: #8C699B">
											LEVEL ${problem.problem_level}
										</div>
									</c:if>
							                        
			                        
			                        <div class="problem_percent" id="item_percent_${status.count}">
			                               	정답률: 28.4%
			                        </div>
			                    </div>
			                    <div class="item_bottom" >
			                        <div class="problem_submit" id="item_submit_${status.count}">
			                               	제출: ${problem.problem_submitnum}
			                        </div>
			                        <div class="problem_answer" id="item_success_${status.count}">
			                               	맞은사람: ${problem.problem_successnum}
			                        </div>
			                        <div class="problem_check" id="item_check_${status.count}">
			                            <img src="<%=request.getContextPath()%>/resources/images/check.png" width="20em" height="20em" alt="O">
			                        </div>
			                    </div>
			                </div>
			                </div>
			                
			    <!--  ${status.count}
			                  ${problem.problem_title} --> 
			                 
			                  
			               </c:if>
			             
				               <c:if test="${status.count%2 == 0 }">
					                 <div class="problem_container_right">
							            <div id="problem_item_${status.count}" class="problem_item" onclick="location.href='location.href='/problem/${problem.problem_id}'">
							                <div class="item_top">
							                    <span class="problem_title" id="item_title_${status.count}">${problem.problem_id}. ${problem.problem_title}</span>
							                    <c:if test="${problem.problem_level == 1}">
							    					<div class="problem_level" id="item_level_${status.count}" style="background-color: #FFCC80 ">
														LEVEL ${problem.problem_level}
													</div>
												</c:if>
												<c:if test="${problem.problem_level == 2}">
												    <div class="problem_level" id="item_level_${status.count}" style="background-color: #7BC379">
														LEVEL ${problem.problem_level}
													</div>
												</c:if>
												<c:if test="${problem.problem_level == 3}">
												    <div class="problem_level" id="item_level_${status.count}" style="background-color: #79BCC3">
														LEVEL ${problem.problem_level}
													</div>
												</c:if>
												<c:if test="${problem.problem_level == 4}">
												    <div class="problem_level" id="item_level_${status.count}" style="background-color: #EA7862">
														LEVEL ${problem.problem_level}
													</div>
												</c:if>
												
												<c:if test="${problem.problem_level == 5}">
												    <div class="problem_level" id="item_level_${status.count}" style="background-color: #8C699B">
														LEVEL ${problem.problem_level}
													</div>
												</c:if>
							                    <div class="problem_percent" id="item_percent_${status.count}">
							                        정답률: 28.4%
							                    </div>
							                </div>
							                <div class="item_bottom">
							                    <div class="problem_submit" id="item_submit_${status.count}">
							                        	제출: ${problem.problem_submitnum}
							                    </div>
							                    <div class="problem_answer" id="item_success_${status.count}">
							                     		 맞은사람: ${problem.problem_successnum}
							                    </div>
							                    <div class="problem_check" id="item_check_${status.count}">
							                        <img src="<%=request.getContextPath()%>/resources/images/check.png" alt="O">
							                    </div>
							                </div>
							           	</div>
									</div>
				                  
				               </c:if>
			                </c:forEach>
                       </div>
                       
                        <div class="page">
						<ul class="paging" id="pagenav" >
						<c:if test="$test{pageMaker.prev}">
							<li class="page_num"><a href="javascript:getBoardList(pageMaker.startPage - 1)"><</a></li>
							</c:if> 
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
	    							<li class="page_num" onclick="javascript:getBoardList(this.value)" value="${page}"><a>${page}</a></li>
							 </c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page_num"><a href="javascript:getBoardList(pageMaker.endPage + 1)">></a></li>
							 </c:if>
						</ul>
						</div>
												
                        
</section>

            </div>
        </div>

    </div>

  
</body>

</html>











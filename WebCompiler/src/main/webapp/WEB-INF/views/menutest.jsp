<%@page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%
	String imgURL = "";
if (request.getAttribute("user") != null) {
	UserVO user = (UserVO) request.getAttribute("user");
	if (user.getUser_img() == null) {
		imgURL = (String) request.getContextPath() + "/resources/images/user.png";
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
<title>CODE SPACE</title>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_problem2.css" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" />
<script>
		var l_value = 0;
		var c_value = "unselected";
		let isSearch = false;
		
		function link( event ) {
			location.href = '/problem/' + event.data.problem_id ;
		}
		
		function check_radio(chk){
			l_value = chk.value;

			var obj = document.getElementsByName("slideItem");
			var is_check=false;
		    for(var i=0; i < obj.length; i++){
			    if(obj[i].checked == true){
			    	is_check = true;
				}
		        if(obj[i] != chk){
		            obj[i].checked = false;
		        }
		    }
		    if(is_check == false){
		    	l_value=0;
			}

		    console.log("select level: " + l_value);
			
			getBoardList(1);
		}
		function check_list(ref){
			$("#"+c_value).removeClass('selected');
			
			if(ref != c_value){
				$("#"+ref).addClass('selected');
				c_value = ref;
			}
			else{
				c_value="unselected";
			}
			
			console.log("select category: " + c_value);
			
			//$("#" + ref).addClass('selected');
			getBoardList(1);
		}
		function getPercent(problem_submitnum, problem_successnum, count){
			var temp = problem_successnum /problem_submitnum * 100;
	    	var percent= temp.toFixed(1); // 99.98765 출력
	    	if(isNaN(percent) == true){
					percent  = 0;
		    	}
	    	var str ="정답률: " + percent + "%" ;
	    	id="#item_percent_"+ count;
	    	$(id).text(str);
		}
		
		function getBoardList(page){	
			//var level = document.getElementById("problem_level")
			//var category = document.getElementById("category_name");

			var level_value = /*level.options[level.selectedIndex].value*/ l_value;
			var category_value = /*category.options[category.selectedIndex].value*/ c_value;

		
				$.ajax({
		            url: "./problem.do",
		            type: "GET",
		            //data: "page="+page,
		            data: {
				            "problem_level": level_value,
				            "category_name": category_value,
				            "page": page,
				            "isSearch": isSearch
				        },
		            success: function(data){	           
			            var problem = data.list;
			            var pageMaker = data.pageMaker;
			            const isSuccess = data.successList;
			            console.log(isSuccess);
			        
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

			            	let code_success = (isSuccess[i] == 1) ? 'check.png' : 'notCheck.png';
			            	
			            	$("#item_success_"+idx).html("맞은사람: " + problem[i].problem_successnum);
			            	$("#item_percent_"+idx).html("정답률: " + percent + "%");
			            	$("#item_check_"+idx).html(`<img src="<%=request.getContextPath()%>/resources/images/` + code_success + `" alt="">`);
			            	getPercent(problem[i].problem_submitnum, problem[i].problem_successnum, idx)
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

		function searchProblem() {
			const searchBtn = document.getElementById("searchBtn");
			const searchInput = document.getElementById("searchInput");
			const searchType = document.getElementById("search_option");
			
			const searchType_value = searchType.innerText;
			const searchInput_value = searchInput.value;

			isSearch = true;

			console.log("searchType_value: " + searchType_value);
			console.log("searchInput_value: " + searchInput_value);

			$.ajax({
	            url: "/searchProblem",
	            type: "POST",
	            data: {
			            "searchInput": searchInput_value,
			            "searchType": searchType_value
			        },
	            success: function(){	           
		            console.log("search success!");
	            },
	            error: function(){
	                console.log("search error!");
	            }
	        });

			getBoardList(1);
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
				<!-- Content -->
				<div class="left-side">
					<div class="wrapper">

						<nav class="slidemenu">
							<!-- Item 1 -->
							<input type="checkbox" name="slideItem" id="slide-item-1"
								value="1" class="slide-toggle" onclick="check_radio(this);" />
							<label for="slide-item-1"><p class="icon">1</p> <!--<span>Home</span>--></label>

							<!-- Item 2 -->
							<input type="checkbox" name="slideItem" id="slide-item-2"
								value="2" class="slide-toggle" onclick="check_radio(this);" />
							<label for="slide-item-2"><p class="icon">2</p> <!--<span>About</span>--></label>

							<!-- Item 3 -->
							<input type="checkbox" name="slideItem" id="slide-item-3"
								value="3" class="slide-toggle" onclick="check_radio(this);" /> <label
								for="slide-item-3"><p class="icon">3</p> <!--<span>Folio</span>--></label>

							<!-- Item 4 -->
							<input type="checkbox" name="slideItem" id="slide-item-4"
								value="4" class="slide-toggle" onclick="check_radio(this);" /> <label
								for="slide-item-4"><p class="icon">4</p> <!--<span>Blog</span>--></label>
							<input type="checkbox" name="slideItem" id="slide-item-5"
								value="5" class="slide-toggle" onclick="check_radio(this);" />
							<label for="slide-item-5"><p class="icon">5</p> <!--  <span>Blog</span>--></label>

							<div class="clear"></div>

							<!-- Bar -->
							<div class="slider">
								<div class="bar"></div>
							</div>

						</nav>


					</div>
					<nav class="menu" id="menu">

						<ul>
							<li><a>기초</a>
								<ul style="display: block;">
									<li onclick="check_list(this.id);" id="CA_0022"><a>입출력</a></li>
									<li onclick="check_list(this.id);" id="CA_0023"><a>조건</a></li>
									<li onclick="check_list(this.id);" id="CA_0024"><a>반복</a></li>
								</ul></li>
							<li><a>자료구조</a>
								<ul style="display: block;">
									<li onclick="check_list(this.id);" id="CA_0001"><a>리스트</a></li>
									<li onclick="check_list(this.id);" id="CA_0002"><a>스택</a></li>
									<li onclick="check_list(this.id);" id="CA_0003"><a>큐</a></li>

								</ul></li>
							<li onclick="check_list(this.id);" id="CA_0004"><a>정렬</a>
								<!-- <ul style="display: block;">
									<li onclick="check_list(this.id);" id="CA_0004"><a>선택정렬 삽입정렬 버블정렬</a></li>
									<li onclick="check_list(this.id);" id="CA_0004"><a>합병정렬 퀵정렬</a></li>
								</ul> --></li>
							<li onclick="check_list(this.id);" id="CA_0005"><a>수학</a></li>
							<li><span class="opener">그래프</span>
								<ul>
									<li onclick="check_list(this.id);" id="CA_0006"><a>그래프</a></li>
									<li onclick="check_list(this.id);" id="CA_0007"><a
										>깊이 우선 탐색</a></li>
									<li onclick="check_list(this.id);" id="CA_0008"><a
										>너비 우선 탐색</a></li>
								</ul></li>
							<li><span class="opener">트리</span>
								<ul>
									<li onclick="check_list(this.id);" id="CA_0009" ><a>트리</a></li>
									<li onclick="check_list(this.id);" id="CA_0010"><a>힙</a></li>
								</ul></li>
							<li onclick="check_list(this.id);" id="CA_0011"><a>다이나믹
									프로그래밍</a></li>
							<li onclick="check_list(this.id);" id="CA_0021"><a>그리디 알고리즘</a></li>
							<li onclick="check_list(this.id);" id="CA_0012"><a>재귀</a></li>
							<li onclick="check_list(this.id);" id="CA_0013"><span>분할정복</span>
								<!-- <ul>
									<li onclick="check_list(this.id);" id="CA_0013"><a
										>분할 정복</a></li>
									<li onclick="check_list(this.id);" id="CA_0014"><a>트리</a></li>
									
								</ul> --></li>

							<li><span>최단경로</span>
								<ul>
									<li onclick="check_list(this.id);" id="CA_0014"><a>다익스트라</a></li>
									<li onclick="check_list(this.id);" id="CA_0015"><a>플로이드 와샬</a></li>
									<li onclick="check_list(this.id);" id="CA_0016"><a>벨만포드</a></li>
								</ul></li>
							<li><span>최소 스패닝 트리</span>
								<ul>
									<li onclick="check_list(this.id);" id="CA_0017"><a>disjoint-set</a></li>
									<li onclick="check_list(this.id);" id="CA_0018"><a>쿠르스칼</a></li>
									<li onclick="check_list(this.id);" id="CA_0025"><a>프림</a></li>
								</ul></li>
							<li onclick="check_list(this.value);" id="CA_0019"><a
								>브루트포스</a></li>
							<li onclick="check_list(this.id);" id="CA_0020"><a>백트래킹</a></li>
						</ul>
					</nav>
				</div>

				<!--
            <h3 class="problem_title">코드 조회</h3>
        -->

				<div class="right">
					<div class="wrapper">
					<div class="search_box">

						<div class="dropdown">

							<div class="default_option" id="search_option">번호</div>
							<ul id="searchType">
								<li>번호</li>
								<li>제목</li>
							</ul>
						</div>
						<div class="search_field">
							<input id="searchInput" type="text" class="input"> <i
								class="fas fa-search" id="searchBtn" onclick="searchProblem()"></i>
						</div>
					</div>
					</div>
					<div id="container" class="container">
						<c:forEach var="problem" items="${problem}" varStatus="status">
							<c:if test="${status.count%2 == 1 }">
								<div class="problem_container_left">


									<div id="problem_item_${status.count}" class="problem_item"
										onclick="location.href='/problem/${problem.problem_id}'">
										<div class="item_top">
											<span class="problem_title" id="item_title_${status.count}">${problem.problem_id}.
												${problem.problem_title}</span>
											<c:if test="${problem.problem_level == 1}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #FFCC80">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 2}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #7BC379">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 3}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #79BCC3">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 4}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #EA7862">LEVEL
													${problem.problem_level}</div>
											</c:if>

											<c:if test="${problem.problem_level == 5}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #8C699B">LEVEL
													${problem.problem_level}</div>
											</c:if>


											<div class="problem_percent"
												id="item_percent_${status.count}">
												<script type="text/javascript">
												getPercent(${problem.problem_submitnum}, ${problem.problem_successnum}, ${status.count})</script>
											</div>
										</div>
										<div class="item_bottom">
											<div class="problem_submit" id="item_submit_${status.count}">
												제출: ${problem.problem_submitnum}</div>
											<div class="problem_answer" id="item_success_${status.count}">
												맞은사람: ${problem.problem_successnum}</div>
											
											<div class="problem_check" id="item_check_${status.count}">
												<img src="<%=request.getContextPath()%>/resources/images/${successList[status.count-1] ? 'check.png' : 'notCheck.png'}" width="20em" height="20em" alt="O">
											</div>
										
										</div>
									</div>
								</div>

								<!--  ${status.count}
			                  ${problem.problem_title} -->


							</c:if>

							<c:if test="${status.count%2 == 0 }">
								<div class="problem_container_right">
									<div id="problem_item_${status.count}" class="problem_item"
										onclick="location.href='/problem/${problem.problem_id}'">
										<div class="item_top">
											<span class="problem_title" id="item_title_${status.count}">${problem.problem_id}.
												${problem.problem_title}</span>
											<c:if test="${problem.problem_level == 1}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #FFCC80">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 2}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #7BC379">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 3}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #79BCC3">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<c:if test="${problem.problem_level == 4}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #EA7862">LEVEL
													${problem.problem_level}</div>
											</c:if>

											<c:if test="${problem.problem_level == 5}">
												<div class="problem_level" id="item_level_${status.count}"
													style="background-color: #8C699B">LEVEL
													${problem.problem_level}</div>
											</c:if>
											<div class="problem_percent"
												id="item_percent_${status.count}">
												<script type="text/javascript"> getPercent(${problem.problem_submitnum}, ${problem.problem_successnum}, ${status.count})</script>
											</div>
										</div>
										<div class="item_bottom">
											<div class="problem_submit" id="item_submit_${status.count}">
												제출: ${problem.problem_submitnum}</div>
											<div class="problem_answer" id="item_success_${status.count}">
												맞은사람: ${problem.problem_successnum}</div>
											
											<div class="problem_check" id="item_check_${status.count}">
												<img src="<%=request.getContextPath()%>/resources/images/${successList[status.count-1] ? 'check.png' : 'notCheck.png'}" width="20em" height="20em" alt="O">
											</div>
										
										</div>
									</div>
								</div>

							</c:if>
						</c:forEach>
					</div>

					<div class="page">
						<ul class="paging" id="pagenav">
							<c:if test="$test{pageMaker.prev}">
								<li class="page_num"><a
									href="javascript:getBoardList(pageMaker.startPage - 1)"><</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="page">

								<c:if test="${cri.page eq page}">
									<li class="page_num page_on"
										onclick="javascript:getBoardList(this.value)" value="${page}"><a>${page}</a></li>
								</c:if>
								<c:if test="${cri.page != page}">
									<li class="page_num"
										onclick="javascript:getBoardList(this.value)" value="${page}"><a>${page}</a></li>
								</c:if>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page_num"><a
									href="javascript:getBoardList(pageMaker.endPage + 1)">></a></li>
							</c:if>
						</ul>
					</div>

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
	var on = 1;
	$(".default_option").click(function(){
	  if(on == 1){
	     $(".dropdown ul").addClass("active");
	    on = 0;
	  }
	  else{
	    $(".dropdown ul").removeClass("active");
	    on = 1;
	  }
	 
	});

	$(".dropdown ul li").click(function(){
	  var text = $(this).text();
	  $(".default_option").text(text);
	  $(".dropdown ul").removeClass("active");
	});
	</script>


</body>

</html>











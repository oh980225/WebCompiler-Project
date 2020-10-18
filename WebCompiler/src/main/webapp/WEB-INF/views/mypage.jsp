<%@ page import="org.dms.web.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_mypage.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/modal.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_code.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<%	
	String imgURL = "";
	UserVO user = (UserVO)request.getAttribute("user");
	if(user.getUser_img() == null) {
		imgURL = (String)request.getContextPath() + "/resources/images/user.png";
	} else {
		imgURL = "/getByteImage/" + user.getUser_id();
	}
%>

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
				<section class="profile">
					<h3 class="head">마이페이지</h3>
					<br class="clear">
					<div class="profile_img">
						<img class="img" src=<%=imgURL%>>
						<label for="pictureBtn"></label>
						<form id="img_form" action="/mypage/saveImage" enctype="multipart/form-data" method="post">
							<input type="hidden" name="user_id" value="${user.user_id}" />
							<input id="pictureBtn" type="file" name="user_img" onChange="document.getElementById('img_form').submit(); console.log(this.files);">
						</form>
					</div>
					<div class="profile_name">
						<form id="name_form" method="post">
							<div class="editBox">
								<input type="text" name="user_name" value="${user.user_name}">
								<input type="hidden" name="user_introduce" value="${user.user_introduce}" />
								<input type="hidden" name="user_id" value="${user.user_id}" />
								<button  type="button" name="button" onClick="submit();"></button>
							</div>
						</form>
					</div>
					<div class="profile_introduce">
						<form id="intro_form" method="post">
							<div class="editBox">
								<textarea name="user_introduce" rows="4" cols="50">${user.user_introduce}</textarea>
								<input type="hidden" name="user_name" value="${user.user_name}" />
								<input type="hidden" name="user_id" value="${user.user_id}" />
								<button type="button" name="button" onClick="submit();"></button>
							</div>
						</form>
					</div>

				</section>

				<section class="code">
					<h3 class="board_title">
						<span>코드 조회</span>
					</h3>
					<!-- Break -->
						<div style="clear: both;" class="col-12 level">
							<select name="problem_level" id="problem_level">
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
								<select name="category_name" id="category_name">
									<option value="unselected">------ 선택 ------</option>
                            		<c:forEach var="category" items="${category}">
									<option value="${category.category_id}">${category.category_name}</option>
									</c:forEach>
								</select>
								<div class="select_arrow"></div>
							</div>
							<!-- <button id="searchBtn" class="searchBtn">검색</button>
							<div class="col-12 name">
								<select name="demo-category" id="demo-category2">
									<option value="">-- 선택 --</option>
									<option value="problem_title">제목</option>
									<option value="problem_id">문제번호</option>
								</select>
								<div class="small_arrow"></div>
							</div>
							<input id="searchInput" class="search" type="text" name="search" placeholder="검색"> -->
							
							
							<div class="wrapper">
					<div class="search_box">

						<div class="dropdown">

							<div class="default_option" id="search_option">번호</div>
							<ul>
								<li>번호</li>
								<li>제목</li>
							</ul>
						</div>
						<div class="search_field">
							<input type="text" class="input" id="searchInput"> <i
								id="searchBtn" class="fas fa-search"></i>
						</div>
					</div>
					</div>
							
							
							<br class="clear"> <!-- change -->

							
							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>레벨</th>
											<th>제출</th>
											<th>AC/WA</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="codeBoard" items="${codeBoardList}" varStatus="st_">
										<tr class="open" id="tr${st_.index}">
											<td class="problem_id" id="code_board_problem_id">${codeBoard.problem_id}</td>
											<td id="code_board_problem_title">${codeBoard.problem_title}</td>
											<td>
												<c:if test="${codeBoard.problem_level == 1}">
												<div id="code_board_problem_level" class="problem_level1">
													LEVEL ${codeBoard.problem_level}
												</div>
												</c:if>
												<c:if test="${codeBoard.problem_level == 2}">
												<div id="code_board_problem_level" class="problem_level2" >
													LEVEL ${codeBoard.problem_level}
												</div>
												</c:if>
												<c:if test="${codeBoard.problem_level == 3}">
												<div id="code_board_problem_level" class="problem_level3" >
													LEVEL ${codeBoard.problem_level}
												</div>
												</c:if>
												
												<c:if test="${codeBoard.problem_level == 5}">
												<div id="code_board_problem_level" class="problem_level5" >
													LEVEL ${codeBoard.problem_level}
												</div>
												</c:if>
												
												<c:if test="${codeBoard.problem_level == 4}">
												<div id="code_board_problem_level" class="problem_level4" >
													LEVEL ${codeBoard.problem_level}
												</div>
												</c:if>
											</td>
											<td id="code_board_code_date"><fmt:formatDate pattern="yyyy.MM.dd" value="${codeBoard.code_date}"/></td>
											<td id="code_board_code_success"><img src="<%=request.getContextPath()%>/resources/images/${codeBoard.code_success == 1 ? 'check.png' : 'notCheck.png'}" width="20em" height="20em" alt=""></td>
										</tr>
				        				</c:forEach>
				        				<div class="modal hidden">
				          					<div class="modal_overlay">
				          					</div>
				          					<div class="modal_content">
				            					<header class="modal_header">
													<span class="title">코드조회</span>
													<img class="close" src="<%=request.getContextPath()%>/resources/images/close.png" width="15em" height="15em" alt="닫기">
				            					</header>
												<div class="modal_left">
													<h3 class="problem_name"></h3>
													<div class="modal_level"></div>
													<div class="modal_wrap">
														<div id="table">
															<div class="head row">
																<span class="head col1">제출</span>
																<span class="head col2">언어</span>
																<span class="head col3">AC/WA</span>
																<span class="head col4">공개</span>
															</div>
														</div>
													</div>
												</div>
												<div class="modal_right">
													<iframe src="<%=request.getContextPath()%>/resources/html/modal_editor.html" id="iframe" onload="access()" width="100%" height="100%"></iframe>
												</div><!-- 
												<div class="open_check">
													<span>코드를 다른 사용자에게도 공개합니다.</span> <input type="checkbox" id="check" name="open_check" value="open" /> <label for="check"></label>
												</div> -->
				          					</div>
				        				</div>
									</tbody>
								</table>
							</div>
							<!-- 다음, 이전은 나중에 -->
							<div class="page">
								<ul class="paging" id="pagenav">
									<c:if test="${pageMaker.isPrev()}">
									<li class="page_num"><a href="#"><</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">

									<c:if test="${criteria.page eq page}">
									<li class="page_num page_on" onclick="javascript:getBoardList(this.value)" value="${page}"><a
										>${page}</a></li>
								</c:if>
								<c:if test="${criteria.page != page}">
									<li class="page_num" onclick="javascript:getBoardList(this.value)" value="${page}"><a
										>${page}</a></li>
								</c:if>
									
									<%-- <c:if test="${page== 1}">
									<li class="page_num" onclick="javascript:getBoardList(this.value)" value="${page}"><a style="color: black !important;">${page}</a></li>
									</c:if>
									<c:if test="${page != 1}">
									<li class="page_num" onclick="javascript:getBoardList(this.value)" value="${page}"><a>${page}</a></li>
									</c:if> --%>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page_num"><a href="#">></a></li>
									</c:if>
								</ul>
							</div>
							
							
						</form>
				</section>

				<footer class="footer_btns">
					<button class="btn_change_pwd" type="button" name="button">비밀번호
						변경</button>
					<button class="btn_withdraw" type="button" name="button"
						onClick="location.href='/mypage/delete/${user.user_id}'">회원
						탈퇴</button>
					<!-- <div class="modal hidden">
				    	<div class="modal_overlay">
				        </div>
				        <div class="withdrwa_check">
				        </div>
				    </div> -->
				</footer>

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
	<script
		src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
	
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
	<script type="text/javascript">
		let page_ = 1;
		let search_category = null;
		let search = null;
		const iframe = document.getElementById("iframe");
		let myCodeList = null;
		let innerDoc = null;
		
		const access = () => {
		    innerDoc = iframe.contentDocument || iframe.contentWindow.document;
		}

		access();

		function Request(valuename)
		  {
		      var rtnval;
		      var nowAddress = unescape(location.href);
		      var parameters = new Array();
		      parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");
		      for(var i = 0 ; i < parameters.length ; i++){
		          if(parameters[i].split("=")[0] == valuename){
		              rtnval = parameters[i].split("=")[1];
		              if(rtnval == undefined || rtnval == null){
		                  rtnval = "";
		              }
		              return rtnval;
		          }
		      }
		      return null;
		  }

		const chageCodeSelect = (id) =>{
			let codeList = myCodeList;/* 
			<c:forEach items="${codeList}" var="code">
			codeList.push({code: `${code.code_code}`,
				lang: '${code.code_language}' });
			</c:forEach>  */
			innerDoc.getElementById("lang").value = codeList[id].code_language;
			console.log(codeList[id].code_code);
		    innerDoc.getElementById("code").value = encodeURIComponent(codeList[id].code_code);
		    innerDoc.getElementById("getLangAndCode").click(); 
		}

		const historyClick = (event) => {
			console.log("click!!")
			let index = '#'+ event.target.parentNode.id;
			$(index).css('color', 'rgb(46, 173, 179)'); 	
			$(index).css('background-color', 'rgb(231, 251, 255)'); 
			$(index).css('border-bottom', '1px dashed rgb(184, 184, 184)');
			$('.history').not(index).css('color', 'black');
			$('.history').not(index).css('background', 'transparent'); 
			$('.history').not(index).css('border-bottom', '1px dashed rgb(184, 184, 184)');
			console.log("check code: " + event.target.parentNode.id);
			chageCodeSelect(event.target.parentNode.id);
		}

		const modal = document.querySelector(".modal");
		const openBtns = document.querySelectorAll(".open");
		const overlay = modal.querySelector(".modal_overlay");
		const closeBtn = modal.querySelector(".close");

		// js date fomat변경
		function getFormatDate(date){
		    var year = date.getFullYear();              
		    var month = (1 + date.getMonth());          
		    month = month >= 10 ? month : '0' + month;  
		    var day = date.getDate();                   
		    day = day >= 10 ? day : '0' + day;          
		    return  year + '.' + month + '.' + day;       
		}

		const openModal = (event) => {
			let node = event.target.parentNode;
			while(node.tagName != "TR") {
				node = node.parentNode;
			}
			let index = node.id;
			index = index.replace("tr","");
			console.log(index);
			
			if(innerDoc == null) {
				console.log("this is null");	
			} else {
				let get_code = innerDoc.getElementById("code");
				console.log("1. get_code: " + get_code);
				const getLangAndCode = innerDoc.getElementById("getLangAndCode");
				while(get_code == null) {
					get_code = innerDoc.getElementById("code");
				}
				console.log("2. get_code: " + get_code);
				get_code.value = encodeURIComponent("코드기록을 선택해주세요.");
				console.log(get_code.value);
				getLangAndCode.click(); 
			}
			
			$.ajax({ 
				 url: '/modal',  
				 type: 'POST',
				 data: {
					 	"index": index,
					 	"page": page_,
					 	"search_category": search_category,
					 	"search": search
					 },  
				 success: function(data) {
					 const result = data.codeBoard;
					 const problem_name = document.querySelector(".problem_name");
					 const problem_level = document.querySelector(".modal_level");
					 const table = document.getElementById("table");
					 myCodeList = result.codeList;
					 
					 problem_level.classList.remove('modal_level1');
					 problem_level.classList.remove('modal_level2');
					 problem_level.classList.remove('modal_level3');
					 problem_level.classList.remove('modal_level4');
					 problem_level.classList.remove('modal_level5');

					 problem_name.innerHTML = result.problem_id + ". "  + result.problem_title;
					 problem_level.classList.add('modal_level'+result.problem_level);
					 problem_level.innerHTML = "LEVEL " + result.problem_level;

					 let prevList = table.querySelectorAll('.history');
					 console.log("prevList: " + prevList);

					 if(prevList != null) {
						 for (let i = 0; i < prevList.length; i++) {
							 console.log("remove: " + prevList[i]);
							 table.removeChild(prevList[i]);
						 }
				     }
					 
					 let list = "";
					 
					 for(let i in result.codeList) {
						 let code_date = new Date(result.codeList[i].code_date);
						 code_date = getFormatDate(code_date)
						 let code_lang = result.codeList[i].code_language;
						 let code_success = result.codeList[i].code_success;
						 let code_open = result.codeList[i].code_open;
						 console.log(code_date + code_lang + code_success + code_open);
						 if(code_success == 1) {
							 code_success = 'check.png'
						 } else {
							 code_success = 'notCheck.png';
						 }
						 
						 if(code_open == 1) {
							 code_open = 'O'
						 } else {
							 code_open = 'X';
						 }
						 
						 list = `<div id=` + i + ` class="history row">
								<span class="cell col1">` + code_date + `</span>
								<span class="cell col2">` + code_lang + `</span>
								<span class="cell col3"><img style="cursor:default" src="<%=request.getContextPath()%>/resources/images/` + code_success + `" width="20em" height="20em" alt=""></span>
								<span class="cell col4">` + code_open + `</span>
							</div>`;
						 let nodes_ = new DOMParser().parseFromString(list, 'text/html');
						 let nodes = nodes_.firstChild.childNodes.item(1)
						 console.log(nodes.childNodes.item(0));
						 table.appendChild(nodes.childNodes.item(0));
					 }
					 const codeHistoryList = document.querySelectorAll('.history');
					 
					 for (let i = 0; i < codeHistoryList.length; i++) {
							codeHistoryList[i].addEventListener("click", historyClick);
					 }
					 
				 },
				 error: function() {
					 console.log("실패!");
				 }
			}); 
			modal.classList.remove("hidden");
		}

		const closeModal = () => {
			 modal.classList.add("hidden");
		}

		overlay.addEventListener("click", closeModal);
		closeBtn.addEventListener("click", closeModal);
		for(const btn of openBtns) {
			btn.addEventListener("click", openModal);
		}

		function getBoardList(page){
			page_ = page;	
			var level = document.getElementById("problem_level")
			var category = document.getElementById("category_name");

			var level_value = level.options[level.selectedIndex].value;
			var category_value = category.options[category.selectedIndex].value;
			
			$.ajax({
	            url: "/codeBoardPaging",
	            type: "POST",
	            data: {
			            "problem_level": level_value,
			            "category_name": category_value,
			            "page": page,
			            "search_category": search_category,
						"search": search
			        },
	            success: function(data){	           
		            const codeList = data.list;
		            const pageMaker = data.pageMaker;
		            console.log("page : " + page);
		        
		            for(var i=0; i< codeList.length; i++) {
			
			            const idx = i;
			            let tr = document.getElementById("tr"+idx);
			            console.log(tr);

			            console.log(tr.querySelector("#code_board_problem_id"));
			         	tr.querySelector("#code_board_problem_id").innerHTML = codeList[i].problem_id;
			         	
			         	tr.querySelector("#code_board_problem_title").innerHTML = codeList[i].problem_title;
			         	tr.querySelector("#code_board_problem_level").innerHTML = "LEVEL " + codeList[i].problem_level;
			         	const level_class = tr.querySelector("#code_board_problem_level").classList[0];
			         	if(level_class != ("problem_level"+ codeList[i].problem_level)) {
			         		tr.querySelector("#code_board_problem_level").classList.remove(level_class);
			         		tr.querySelector("#code_board_problem_level").classList.add("problem_level"+ codeList[i].problem_level);
				         	// 현재 클래스를 해당 problme_level 클래스로 변경!
				        }
				        let code_date = new Date(codeList[i].code_date);
				        tr.querySelector("#code_board_code_date").innerHTML = getFormatDate(code_date); 
				        
				        let code_success = (codeList[i].code_success == 1) ? 'check.png' : 'notCheck.png';
				        console.log("codeList[i].code_success: " + code_success);
				        tr.querySelector("#code_board_code_success").innerHTML = `<img src="<%=request.getContextPath()%>/resources/images/` + code_success + `" width="20em" height="20em" alt="">`
		            	
		            }
		            // 나머지 요소 숨기기 
		            console.log("codeList.length: " + codeList.length);
					if(codeList.length < 5){
						for(var i=codeList.length; i < 5; i++){
							$("#tr"+i).css("display","none");
						}
					} else {
						for(var i=0; i < codeList.length; i++){
							$("#tr"+i).css("display","");
						}
					}
		            var elem = '';
		            //var num = 0;
		            // start
		            /* if(pageMaker.prev){
			            elem = elem + '<li><a href="javascript:getBoardList(' + pageMaker.startPage - 1 + ') "> ◀  </a></li>';
			            } */
		          
		            $("#pagenav").empty();
		            
		            for(var i=pageMaker.startPage; i < pageMaker.endPage + 1; i++) {
			            if(page == i){
			            	$("#pagenav").append('<li class="page_num page_on" onclick="getBoardList(' + i + ')" value="' + i + '">' + '<a style="color:black !important;">' + i+ "</a>" + '</li>');
				        }
			            else{
			            	$("#pagenav").append('<li class="page_num" onclick="getBoardList(' + i + ')" value="' + i + '">' + "<a>" + i+ "</a>" +'</li>');
				        }       
		            }
		              
		            if(pageMaker.next && pageMaker.endPage > 0){
		            	elem = elem + '<li><a href="javascript:getBoardList(' + pageMaker.endPage - 1 + ') "> ▶ </a></li>';
			        }
	            },
	            error: function(){
	                console.log("paging error!");
	            }
	        });
		}

		const searchInput = document.getElementById("searchInput");
		const searchBtn = document.getElementById("searchBtn");
		//const searchCategory = document.getElementById("demo-category2");

		const searchMyCode = () => {
			var temp = $("#search_option").text();
			if(temp == "번호"){
				temp="problem_id";
			}
			else if(temp == "제목"){
				temp="problem_title";
				}
			else{
				temp="problem_title";
				}
			search_category = /*searchCategory.options[searchCategory.selectedIndex].value*/temp;
			search = searchInput.value;
			console.log("category: " + search_category);
			console.log("search: " + search);

			$.ajax({ 
				url: "/codeBoardPaging",
	            type: "POST",
	            data: {
			            "problem_level": 0,
			            "category_name": null,
			            "page": 1,
			            "search_category": search_category,
						"search": search
			        },
				 success: function(data) {
					 	page_ = 1;
					 	const codeList = data.list;
			            const pageMaker = data.pageMaker;
			        
			            for(var i=0; i< codeList.length; i++) {
				
				            const idx = i;
				            let tr = document.getElementById("tr"+idx);
				            console.log(tr);

				            console.log(tr.querySelector("#code_board_problem_id"));
				         	tr.querySelector("#code_board_problem_id").innerHTML = codeList[i].problem_id;
				         	
				         	tr.querySelector("#code_board_problem_title").innerHTML = codeList[i].problem_title;
				         	tr.querySelector("#code_board_problem_level").innerHTML = "LEVEL " + codeList[i].problem_level;
				         	const level_class = tr.querySelector("#code_board_problem_level").classList[0];
				         	if(level_class != ("problem_level"+ codeList[i].problem_level)) {
				         		tr.querySelector("#code_board_problem_level").classList.remove(level_class);
				         		tr.querySelector("#code_board_problem_level").classList.add("problem_level"+ codeList[i].problem_level);
					         	// 현재 클래스를 해당 problme_level 클래스로 변경!
					        }
					        let code_date = new Date(codeList[i].code_date);
					        tr.querySelector("#code_board_code_date").innerHTML = getFormatDate(code_date); 
					        
					        let code_success = (codeList[i].code_success == 1) ? 'check.png' : 'notCheck.png';
					        console.log("codeList[i].code_success: " + code_success);
					        tr.querySelector("#code_board_code_success").innerHTML = `<img src="<%=request.getContextPath()%>/resources/images/` + code_success + `" width="20em" height="20em" alt="">`
			            	
			            }
			            // 나머지 요소 숨기기
			            console.log("codeList.length: " + codeList.length);
			            for(var i=0; i < codeList.length; i++){
							$("#tr"+i).css("display","");
						}
						if(codeList.length < 5){
							for(var i=codeList.length; i < 5; i++){
								$("#tr"+i).css("display","none");
							}
						} else {
							for(var i=0; i < codeList.length; i++){
								$("#tr"+i).css("display","");
							}
						}
			            
						$("#pagenav").empty();
			            
			            for(var i=pageMaker.startPage; i < pageMaker.endPage + 1; i++) {
				            if(page_ == i){
				            	$("#pagenav").append('<li class="page_num page_on" onclick="getBoardList(' + i + ')" value="' + i + '">' + '<a style="color:black !important;">' + i+ "</a>" + '</li>');
					        }
				            else{
				            	$("#pagenav").append('<li class="page_num" onclick="getBoardList(' + i + ')" value="' + i + '">' + "<a>" + i+ "</a>" +'</li>');
					        }       
			            }
				 },
				 error: function() {
					 console.log("검색 테스트 실패!");
				 }
			}); 
		}

		searchBtn.addEventListener("click", searchMyCode);

		 
	</script>

</body>

</html>



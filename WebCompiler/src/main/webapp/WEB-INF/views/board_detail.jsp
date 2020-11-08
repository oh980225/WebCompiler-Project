<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
	href="<%=request.getContextPath()%>/resources/css/custom_main.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
<!--  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board.css" /> 우선 주석처리 해봄 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_board_detail.css" />

<script>
			function getCommentList(flag){
				
				var contextPath = $('#contextPathHolder').attr('data-contextPath') ? $('#contextPathHolder').attr('data-contextPath') : '';
				var user_id = "${user.user_id}";
				$.ajax({
					url: "/board/" + ${board.board_id}+"/comment.read",
					type: "GET",
					success:function(data){
						var comment = data.comment;
			            var comment_count = data.comment_count;
			            var count = 1;
			           
			            var str = comment_count + "개";
			            $("#comment_count").text(comment_count + "개");
			            
						for(var i=0; i< comment.length; i++) {
					        var idx = comment[i].comments_id;
					        var comment_id = "#comments_" + idx;

					        $("#list").append("<div class='comment_list' id=comments_" + idx + "></div>");
							if(count !=1){
								$(comment_id).append("<div class='comment_dashline'></div>");
							} 
							$(comment_id).append("<div class='comment_image'></div>");

							$(comment_id  + " .comment_image").append("<img src='/getByteImage/"+ comment[i].user_id+"' width='50px' height='50px'>");
							$("#comments_"+ idx).append("<div class='comment_content'></div>");
							$("#comments_"+ idx +  " .comment_content").append("<p class='comment_user'>"+ comment[i].user_id+"</p>");
							$("#comments_"+ idx +  " .comment_content").append("<p class='comment_content' >"+ comment[i].comments_content+"</p>");

							$("#comments_"+ idx).append("<div class='comment_info'></div>");
							$("#comments_"+ idx +  " .comment_info").append("<p class='comment_date'>"+ formatDate(comment[i].comments_upload) +"</p>");
							$("#comments_"+ idx +  " .comment_info").append("<div class='comment_edit'></div>");

							if(comment[i].user_id == user_id){
								$("#comments_"+ idx +  " .comment_edit").append("<a href='#' onclick='comment_edit(" + comment[i].comments_id +")'><img src='"+contextPath+"/resources/images/edit.png'/></a>");
								$("#comments_"+ idx +  " .comment_edit").append("<a href='#' onclick='comment_delete(" + comment[i].comments_id +")'><img src='"+contextPath+"/resources/images/delete.png'/></a>");
							}
							count++;
			
			            	
			            }
						/*var count = 1;
						var comment_id;
						$(data).each(function(){
							var idx = this.comments_id;
							comment_id = "#comments_" + this.comments_id;
							
							$("#list").append("<div class='comment_list' id=comments_" + idx + "></div>");
							if(count !=1){
								$(comment_id).append("<div class='comment_dashline'></div>");
							} 
							$(comment_id).append("<div class='comment_image'></div>");

							$(comment_id  + " .comment_image").append("<img src='/getByteImage/"+ this.user_id+"' width='50px' height='50px'>");
							$("#comments_"+ idx).append("<div class='comment_content'></div>");
							$("#comments_"+ idx +  " .comment_content").append("<p class='comment_user'>"+ this.user_id+"</p>");
							$("#comments_"+ idx +  " .comment_content").append("<p class='comment_content' >"+ this.comments_content+"</p>");

							$("#comments_"+ idx).append("<div class='comment_info'></div>");
							$("#comments_"+ idx +  " .comment_info").append("<p class='comment_date'>"+ formatDate(this.comments_upload) +"</p>");
							$("#comments_"+ idx +  " .comment_info").append("<div class='comment_edit'></div>");

							if(this.user_id == user_id){
								$("#comments_"+ idx +  " .comment_edit").append("<a href='#' onclick='comment_edit(" + this.comments_id +")'><img src='"+contextPath+"/resources/images/edit.png'/></a>");
								$("#comments_"+ idx +  " .comment_edit").append("<a href='#' onclick='comment_delete(" + this.comments_id +")'><img src='"+contextPath+"/resources/images/delete.png'/></a>");
							}
							count++;
							}
						);
							*/
						/*if(flag == 1){
							var offset=$(comment_id).offset();
							$("html body").animate({scrollTop:offset.bottom}, 0);
						}*/
					},
					error:function(){
						alert("error");
					}
				});
			}
			function comment_edit_finish(comments_id){
				var idx = this.comments_id;
				comment_id = "#comments_" + this.comments_id;

				$("#comments_"+ idx +  " .comment_content").append("<p class='comment_content'>"+ this.comments_content+"</p>");
				$("#comments_"+ idx +  " .comment_content").replaceWith(function(){
					 return $('<textarea>',{type : 'text', class: 'input-text'})
					});

				}
			function comment_edit(comments_id){
				var idx = this.comments_id;
				comment_id = "#comments_" + this.comments_id;

				$("#comments_"+ idx +  " .comment_content").append("<p class='comment_content'>"+ this.comments_content+"</p>");
				$('#abc').replaceWith(function(){
					 return $('<textarea>',{type : 'text', class: 'input-text'})
					});

				}
			function comment_delete(comments_id){
				$.ajax({
					url: "/board/" + ${board.board_id}+"/comment.delete/" + comments_id,
					type: "DELETE",
					success:function(data){
						$("#list").empty();
						getCommentList(1);
					},
					error:function(){

					}
				});
				alert("삭제완료")
			}
			
			function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
			function comment_register(){
				if($("#comments_content").val() == ""){
						alert("댓글을 작성해주세요");
						return false;
					}

				else{
					var comment = {
							board_id: $("#board_id").val(),
							user_id: $("#user_id").val(),
							comments_content: $("#comments_content").val(),
					}
					$.ajax({
						url: "/board/comment.insert",
						type: "POST",
						data : JSON.stringify(comment),
						contentType: "application/json; charset=utf-8;",

						success : function(result) {
							$("#list").empty();

							$("#comments_content").val('');
							getCommentList(1);
						},
						error : function() {
							alert("fail");
						}
					}
					);
				}
				return true;
			
				}

			function formatDate(date) {
				var d = new Date(date),
				month = '' + (d.getMonth() + 1),
				day = '' + d.getDate(),
				year = d.getFullYear();

				if (month.length < 2) month = '0' + month;
				if (day.length < 2) day = '0' + day;
				return [year, month, day].join('.');

			}
		</script>


</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="<%=imgURL%>" />
			</jsp:include> 
			<div class="inner">
				<section>
					<div class="title_header">
						<div class="header_problemid">
							<c:if test="${board.problem_id > 0}">
								<a href="/problem/${problem.problem_id}"><span
									id="problem_id">${problem.problem_id}.
										${problem.problem_title}</span></a>
							</c:if>

						</div>
						<div class="board_info">
							<a href="insert"><img
								src="<%=request.getContextPath()%>/resources/images/write.png">글쓰기</a>
							<a href="/board" style="vertical-align: middle"><img
								src="<%=request.getContextPath()%>/resources/images/board_list.png"
								style="vertical-align: middle">목록</a>
						</div>

					</div>
					<div class="title_box">
						<span>${board.board_title}</span> <span id="info_id">${board.user_id}</span>
					</div>
					<div></div>
					<div class="content">
						<p id="board_upload"><fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${board.board_upload}"/></p>

						<div class="content_box">
							<p>${board.board_content}<br>
						</div>

						<div class="info_box">
							<div class="comment_count">
								<img
									src="<%=request.getContextPath()%>/resources/images/comment.png"><span id="comment_count"></span>
							</div>
							<div class="board_info">

								<c:if test="${user.user_id == board.user_id}">
									<a href="edit?id=${board.board_id}" style="color: black"><img
										src="<%=request.getContextPath()%>/resources/images/edit.png"></a>
									<%-- <a href="delete" style="color: black"><img
										src="<%=request.getContextPath()%>/resources/images/delete.png"></a> --%>
									<a onclick="return alert('정말로 삭제하시겠습니까?')"
										href="delete?board_id=${board.board_id}" ><img
										src="<%=request.getContextPath()%>/resources/images/delete.png">삭제</a>
								</c:if>

							</div>

							<!-- <form method="post" action="delete">
												<a onclick="return alert('정말로 삭제하시겠습니까?')"
												href="delete?board_id=${board.board_id}" value="${board.board_id}">삭제</a>
											</form> -->
						</div>

					</div>



					<div id="list">
						<!--
									<%int i = 0; %>
									<c:forEach var="comments" items="${comments}">
										<div class="comment_list">
											<%if(i!=0){ %>
												<div class="comment_dashline"></div>
											<% } %>
											<div class="comment_image">
												<img src="/getByteImage/${comments.user_id}" width="50px" height="50px">
											</div>
											
											<div class="comment_content">
												<p class="comment_user">${comments.user_id}
												<p class="comment_content"> ${comments.comments_content}
											</div>
											
											<div class="comment_info">
												<p class="comment_date">${comments.comments_upload} <br>
												<div class="comment_edit">
													<c:if test="${user.user_id == comments.user_id}">
														<a href="#"><img src="<%=request.getContextPath()%>/resources/images/edit.png"></a>
														<a href="#"><img src="<%=request.getContextPath()%>/resources/images/delete.png"></a>
													</c:if>	
												</div>
											</div>
												<% i++; %>
										</div>
										

									</c:forEach>

									-->
					</div>
					<div class="comment_typing">
						<input type="hidden" id="board_id" value="${board.board_id}" /> <input
							type="hidden" id="user_id" value="${user.user_id}" />
						<textarea id="comments_content" name="comments_content"
							onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
						<div class="comment_typing_button">
							<input id="comment_typing_button" type="image"
								src="<%=request.getContextPath()%>/resources/images/submit.png"
								class="submit-button" onclick="comment_register()">
						</div>
					</div>
					
				</section>

			</div>
		</div>

		<!-- Sidebar -->

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
				/* 가장 먼저 실행되는 함수입니다*/
				$(function(){
				 	//alert("hello");
				 	getCommentList(0);
				});
				/*$('#comment_typing_button').on('click', function(){
			        var form = {
			                comments_content: "jamong",
			                user_id: ""
			        }
			        $.ajax({
			            url: "/board/comment.insert",
			            type: "POST",
			            data: JSON.stringify(form),
			            contentType: "application/json; charset=utf-8;",
			            dataType: "json",
			            success: function(data){
			            	alert("restController err");
			            },
			            error: function(){
			                alert("restController err");
			            }
			        });
			    });*/
			</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Solve Problem</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_solve.css" />
</head>

<body>
	<div id="wrap">
		<header>
			<a class="back_btn" href="#"><img src="<%=request.getContextPath()%>/resources/images/back_btn.png" alt="뒤로가기"></a>
			<div class="problem_title">
				[1516] 게임개발
			</div>
			<div class="problem_level">
				LEVEL 3
			</div>
			<div class="problem_lang">
				<select class="lang_list" name="language">
					<option value="1" selected>JAVA</option>
					<option value="2">C</option>
					<option value="3">C++</option>
					<option value="4">Python</option>
					<option value="5">Javascript</option>
				</select>
			</div>
		</header>
		<aside>
			<div class="problem">
					차세대 영농인 한나는 강원도 고랭지에서 유기농 배추를 재배하기로 하였다. 농약을 쓰지 않고 배추를 재배하려면 배추를 해충으로부터 보호하는 것이 중요하기 때문에, 한나는 해충 방지에 효과적인 배추흰지렁이를 구입하기로 결심한다. 이 지렁이는 배추근처에 서식하며 해충을 잡아 먹음으로써 배추를 보호한다. 특히, 어떤 배추에 배추흰지렁이가 한 마리라도 살고 있으면 이 지렁이는 인접한 다른 배추로 이동할 수 있어, 그 배추들 역시
					해충으로부터 보호받을 수 있다.<br><br>

					(한 배추의 상하좌우 네 방향에 다른 배추가 위치한 경우에 서로 인접해있다고 간주한다)<br><br>

					한나가 배추를 재배하는 땅은 고르지 못해서 배추를 군데군데 심어놓았다. 배추들이 모여있는 곳에는 배추흰지렁이가 한 마리만 있으면 되므로 서로 인접해있는 배추들이 몇 군데에 퍼져있는지 조사하면 총 몇 마리의 지렁이가 필요한지 알 수 있다.<br><br>

					예를 들어 배추밭이 아래와 같이 구성되어 있으면 최소 5마리의 배추흰지렁이가 필요하다.<br><br>

					(0은 배추가 심어져 있지 않은 땅이고, 1은 배추가 심어져 있는 땅을 나타낸다.)<br><br>

					1 1 0 0 0 0 0 0 0 0<br>
					0 1 0 0 0 0 0 0 0 0<br>
					0 0 0 0 1 0 0 0 0 0<br>
					0 0 0 0 1 0 0 0 0 0<br>
					0 0 1 1 0 0 0 1 1 1<br>
					0 0 0 0 1 0 0 1 1 1<br>
				<h2 class="input_title">
					입력
				</h2>
					입력의 첫 줄에는 테스트 케이스의 개수 T가 주어진다.
					<br>그 다음 줄부터 각각의 테스트 케이스에 대해 첫째 줄에는 배추를 심은 배추밭의 가로길이 M(1 ≤ M ≤ 50)과 세로길이 N(1 ≤ N ≤ 50),그리고 배추가 심어져 있는 위치의 개수 K(1 ≤ K ≤ 2500)이 주어진다.<br><br>
					 그 다음 K줄에는 배추의 위치 X(0 ≤ X ≤ M-1), Y(0 ≤ Y ≤ N-1)가 주어진다.
				<h2 class="output_title">
					출력
				</h2>
					각 테스트 케이스에 대해 필요한 최소의 배추흰지렁이 마리 수를 출력한다.
			</div>
		</aside>
		<section class="code">
			<iframe src="<%=request.getContextPath()%>/resources/html/solve_editor.html" width="100%" height="100%"></iframe>
		</section>
		<section class="result">
			<div class="result_header">
				<div class="result_title">
					실행 결과
				</div>
				<a href="#">
					<div class="result_help">
						도와주세요!
					</div>
				</a>
			</div>
			<div class="result_main">

			</div>
			<div class="result_footer">
				<button class="submit_btn" type="button" name="button">제출</button>
				<button class="execute_btn" type="button" name="button">실행</button>
			</div>
		</section>
	</div>
</body>

</html>

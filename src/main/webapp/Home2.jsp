<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.DiaryDAO"%>
<%@ page import="user.DiaryDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
// 이전화면에서 전달받은 데이터를 받습니다.
// 화면에 미리 보여지도록 처리를 하세요~
request.setCharacterEncoding("utf-8");

UserDAO dao = new UserDAO();

String email = request.getParameter("email");
if (session.getAttribute("email") != null) {
	email = (String) session.getAttribute("email");
	String name = (String) session.getAttribute("name");
	String w_intro = (String) session.getAttribute("w_intro");
	
} else if (session.getAttribute("email") == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href='login.html'");
	script.println("</script>");
}

UserDTO dto = new UserDAO().getUser(email);
%>
<%
//메인페이지로 이동했을 때 세션에 값이 담겨잇는지 체크
if (session.getAttribute("email") != null) {
	email = (String) session.getAttribute("email");
}
int pageNumber = 1; // 기본은 1페이지를 할당
//만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
//int 타입으로 캐스팅을 해주고 그 값을 'pageNumber' 변수에 저장한다.
if (request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

//해당 w_id에 대한 일기를 가져온 다음 세션을 통하여 작성자 본인이 맞는지 확인한다.
dao = new UserDAO();
dao.getUser(email);
if (!email.equals(dto.getEmail())) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다')");
	script.println("location.href='contents.jsp'");
	script.println("</script>");
}

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./static/font.css">
<link rel="stylesheet" href="./static/layout.css">
<link rel="stylesheet" href="./static/home.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
body {
	background-color: #F2E7DC;
	background-size: 100px;
	position: fixed;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
}

.bookcover {
	/*배경색 설정*/
	background-color: #F2E7DC;
	/*모서리 약간 둥글게 설정*/
	border-radius: 10px;
	/*윤곽선*/
	border: 1px solid white;
	width: 1274px;
	height: 640px;
	/** 좌우 마진을 auto(중앙에 배치), 상하 마진을 35px로 지정 */
	margin: 35px auto;
	/** .bookdot 요소에서 absolute 속성값을 이용하기 위해 position: relative 로 설정 */
	position: relative;
}

.bookdot {
	border-radius: 10px;
	border: 2px dashed white;
	width: 1250px;
	height: 620px;
	position: absolute;
	top: 10px;
	left: 10px;
}

.page {
	background-color: #F2E7DC;
	border-radius: 10px;
	border: 1px solid white;
	width: 1214px;
	height: 590px;
	position: absolute;
	top: 15px;
	left: 15px;
	display: flex;
}

/*왼쪽 박스*/
.left-container {
	flex: 0.2;
	flex-direction: column;
	margin: 20px 20px 20px 20px;
	display: flex;
}

.total_visitor {
	flex: 0.05;
	text-align: center;
	font-family: 'NeoDunggeunmo';
	font-size: 15px;
}

.visitor {
	color: red;
}

.profile_box {
	flex: 1;
	border: 2px solid rgb(173, 188, 202);
	background-color: white;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 250px;
}

.profile_img {
	flex: 0.3;
	margin: 15px 0 0 0;
}

.img { /*프로필 사진 설정*/
	border-radius: 10px;
}

.intro { /*소개 글*/
	flex: 0.5;
	margin: 0px 15px;
	font-family: 'KyoboHand';
	font-size: 14px;
}

.name { /*마지막줄 닉네임*/
	flex: 0.1;
	margin: 0px 15px;
	font-family: 'KyoboHand';
	font-size: 20px;
}

.dropdown {
	flex: 0.25;
}

#pado {
	width: 140px;
	background-color: white;
	color: black;
	font-weight: bold;
	font-family: 'KyoboHand';
	font-size: 17px;
}

.dropdown-item {
	font-family: 'KyoboHand';
	font-size: 17px;
}

/*가운데 박스*/
.mid-container {
	flex: 0.84;
	flex-direction: column;
	margin: 20px 0px 20px 0px;
	display: flex;
}

.home_top {
	flex: 0.05;
	display: flex;
}

.home_title { /*미니홈피 소개이름*/
	flex: 1;
	font-family: 'Noto Sans KR', sans-serif;
}

.home_url { /*url 주소*/
	flex: 1;
	text-align: right;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
}

.layout_box {
	width: 100%;
	flex: 1;
	border-radius: 20px;
	background-color: white;
	border: 2px solid #4092ac;
	display: flex;
	flex-direction: row;
}

/*오른쪽 박스(메뉴 표시 박스)*/
.right-container {
	flex: 0.1;
	margin: 20px 20px 20px 0px;
}

.plant_record {
	background-color: rgb(255, 186, 129);
	width: 90px;
	font-family: 'NeoDunggeunmo';
	margin: 13px 0 0 0;
	text-align: left;
	border: 1px solid #F61414;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}

.profile {
	background-color: rgb(255, 87, 87);
	width: 90px;
	font-family: 'NeoDunggeunmo';
	margin: 13px 0 0 0;
	text-align: left;
	border: 1px solid #F61414;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}

.calender {
	background-color: rgb(194, 238, 226);
	width: 90px;
	font-family: 'NeoDunggeunmo';
	margin: 13px 0 0 0;
	text-align: left;
	border: 1px solid #4092ac;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}

.diary {
	background-color: rgb(240, 238, 175);
	width: 90px;
	font-family: 'NeoDunggeunmo';
	margin: 13px 0 0 0;
	text-align: left;
	border: 1px solid #4092ac;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}

.home {
	background-color: rgb(231, 187, 232);
	width: 90px;
	font-family: 'NeoDunggeunmo';
	margin: 13px 0 0 0;
	text-align: left;
	border: 1px solid #4092ac;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}

.home {
	margin: 50px 0 0 0;
}

.menu a {
	text-decoration-line: none;
	color: white;
}

.menu div:hover {
	background-color: #b4d1da;
}

.update_font { /*Updated news 폰트*/
	flex: 0.1;
	border-bottom: 2px solid #4aaac7;
	font-family: 'KOTRA_BOLD-Bold';
	font-size: 20px;
	color: #4aaac7;
}

.update_box {
	width: 50%;
	margin: 20px;
	float: left;
	box-sizing: border-box;
}

.update_up {
	width: 50%;
	float: top;
	box-sizing: border-box;
	margin-bottom: 20px;
}

.update_down {
	width: 50%;
	float: bottom;
	box-sizing: border-box;
}

.plant_box { /*식물 박스*/
	width: 50%;
	margin: 20px;
	float: right;
	box-sizing: border-box;
}

.plant_font { /*식물 텍스트*/
	border-bottom: 2px solid #4aaac7;
	font-family: 'KOTRA_BOLD-Bold';
	font-size: 20px;
	color: #4aaac7;
}

.plant_img {
	border-radius: 5px;
	margin: 3px 0 0 0;
}

@font-face {
	font-family: 'KyoboHand';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NeoDunggeunmo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'KOTRA_BOLD-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/*-----------------------------------------------------------------*/
table {
	background-color: #F2E7DC;
	width: 200%;
	height: 185px;
	font-family: 'KyoboHand';
	font-size: 16px;
}

td {
	vertical-align: top;
	text-align: left;
	float: top;
	height: 35px;
}

.header {
	font-size: 15px;
	height: 50px;
	border-bottom: 1px solid black;
	display: flex;
	align-items: center;
	color: white;
	background-color: #F2E7DC;
}

.header-items {
	font-size: 10px;
	color: #4B4952;
	display: flex;
	margin-left: auto;
	margin-right: 10px;
}

.header-item {
	margin-left: 10px;
}

.header-item>a {
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: inherit; /* 링크의 색상 제거 */
	color: #4B4952;
}

.nav {
	background-color: #F2E7DC;
}

.right-container {
	flex: 0.1;
	margin: 20px 20px 20px 0px;
}

.change {
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: inherit; /* 링크의 색상 제거 */
	color: white;
	background-color: grey;
}

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap')
	;
</style>



</head>
<body>
	<div class="header">
		감정일기
		<div class="header-items">
			<div class="header-item">
				<a href="logoutAction.jsp">로그아웃</a>
			</div>
			&nbsp;&nbsp;|
			<div class="header-item">
				<a href="privacy.jsp">개인정보수정</a>
			</div>
		</div>
	</div>

	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="left-container">
					<div class="total_visitor">
						<script>
							date = new Date();
							year = date.getFullYear();
							month = date.getMonth() + 1;
							day = date.getDate();
							document.getElementById("current_date").innerHTML = month
									+ "/" + day + "/" + year;
						</script>
						<div>
							<script>
								date = new Date().toLocaleDateString();
								document.write(date);
							</script>
						</div>
					</div>
					<div class="profile_box">
						<div class="profile_img">
								<img src="img/<%=dto.getU_img()%>"
                                 alt="프로필 사진" class="img" width="180" height="180">
						</div>
						<br>
						<div class="intro">
							<h4>
								닉네임:<%=dto.getName()%></h4>
							<hr>
							<%=dto.getW_intro()%>
						</div>
						<div class="name">by me (O)</div>


						<div class="dropdown">
							<button class="btn btn-secondary btn-sm dropdown-toggle"
								type="button" id="pado" data-bs-toggle="dropdown"
								aria-expanded="false">프로필 수정하기</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="profile.jsp"
									target="_blanked">프로필 수정하기</a></li>
								<li><a class="dropdown-item" href="privacy.jsp"
									target="_blanked">개인정보 수정하기</a></li>
							</ul>
						</div>
					</div>
				</div>


				<div class="mid-container">
					<div class="home_top">
						<div class="home_title">나의 감정일기..★( ･ิᴥ･ิ)..(ง •̀_•́)ง</div>

					</div>


					<div class="layout_box">
						<div class="update_box">
							<div class="update_font">이달의 일기</div>
							<div class="update_up">
								가장 좋았던 날 <a class="change" href="contents.jsp">변경</a>
								<table>
									<th></th>
								</table>

							</div>

							<div class="update_down">
								가장 싫었던 날 <a class="change" href="contents.jsp">변경</a>
								<table>
									<th></th>
								</table>

							</div>
						</div>

						<div class="plant_box">
							<div class="plant_font">식물과 무엇을 넣을까??</div>
							<%
							
							int count = 0;
							DiaryDAO diaryDAO = new DiaryDAO();
							DiaryDTO diaryDTO = new DiaryDTO();
							UserDAO userDAO = new UserDAO();
							ArrayList<DiaryDTO> list = diaryDAO.getList(pageNumber);
							count = diaryDAO.getDiary_Email(email);
							%>
							<%
							// count가 0일 경우
							if (count == 0) {
								
							%>

							<div class="plant_img">
								<img src="img/해바라기 1단계.jpg" class="img" width="350" height="450">

							</div>
							<%
							// count가 1~3일 경우
							} else if (count > 0 && count <= 3) {
							
							%>

							<div class="plant_img">
								<img src="img/해바라기 2단계.jpg" class="img" width="350" height="450">

							</div>
							<%
							// count가 4이상일 경우
							} else if (count > 4) {
								
							%>
							<div class="plant_img">
								<img src="img/해바라기 3단계.jpg" class="img" width="350" height="450">

							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>


				<div class="right-container">
					<div class="menu">
						<a href="./Home2.jsp"><div class="home">&nbsp홈</div></a> <a
							href="profile.jsp">
							<div class="profile">&nbsp프로필</div>
						</a> <a href="diary.jsp"><div class="diary">&nbsp일기작성</div></a> <a
							href="./Plant_record.jsp"><div class="plant_record">&nbsp식물기록</div></a>
						<a href="./contents.jsp"><div class="calender">&nbsp일기목록</div></a>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
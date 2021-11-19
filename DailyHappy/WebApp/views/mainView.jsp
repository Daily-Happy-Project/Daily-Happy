<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		//response.sendRedirect("loginView.html");
		//insert into user(email,name,pw) values('d@d','이민진','1111');
		//test string: 
			uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	//ArrayList<UserObj> list = (new UserDAO()).getUserList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <!-- 실제 모바일에서 구동해보면.. viewport문제로 인해 글씨가 너무 작게 보임 -->
    <!-- why? 모바일의 웹브라우저는 viewport가 무조건 980으로 고정되어 있음. 실제 디바이스의 viewport와 상관없이 크기가 결정됨 -->
    <!-- viewport[웹 브라우저의 document영역의 가상의 사각형영역]는 해상도와는 다름. Nexus 5x의 해상도는 1080*1920이지만 viewport는 412*712임-->
    <!-- 넥서스 5x의 뷰포트 412에서 200px인 img의 width가 모바일 웹브라우저에서는 기본 뷰포트크기인 980에서는 대략 2배정도 작아진 100px정도의 크기임 -->
    <!-- 디바이스의 실제 뷰포트로 변경해주는 작업이 필요 -->
    <!-- <meta name="viewport" content="width=412, initial-scale=1.0"> -->
    <!-- <meta name="viewport" content="width=600, initial-scale=1.0"> -->
    <!-- <meta name="viewport" content="width=980, initial-scale=1.0"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>메인</title>

<style type="text/css">
body{
	margin: 0;
}

article{
	width: 100%;
}
.scr-wrap{
	position: fixed;
	top: 30px;
	z-index: 3;
}
.scr{
	
}
.main-wrap{
	position: absolute;
	top: 30%;
	width: 100%;
	z-index:2
}
#bottle-img-box{
	display: inline-block;
	width: 60%;
	max-width: 400px;
	height: 150px;
	background-color: #000000;

}
#left-bottle, #right-bottle{
	cursor: pointer;
    position: absolute;
    top: 40%;
    padding: 5%;
    font-size: 20pt;
    z-index: 4;
}
#left-bottle{
	left: 0;
}
#right-bottle {
	right: 0;
}
.bg-image-wrap{
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: 1;
}
.background-image{
	display: inline-block;
	background-image: 
  		url('https://c.tenor.com/NkAegm0IP8IAAAAC/popcat.gif');
  	background-color: #000000;
	-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-position: center;
    width: 100%;
	height: 100%;


}
#paper-wrap{
	position: fixed;
	bottom:0px;
	width: 100%;
	z-index: 2;
}
#paper-img-box{
 	display: inline-block;
	width: 60%;
	max-width: 400px;
	height: 40%;
	max-height: 120px;
	min-height: 80px;
	background-color: #ffffff;
}
.navi{
	position: fixed;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 35px;
	background-color: #00ffff;
	z-index: 3;
}
.menu{
	position: inline-block;
	text-align: center;
	float:left;
	width: 25%;
	height: 100%;
}
</style>
</head>
<body>
	<section align="center">

		<article class="scr-wrap">
			<div class="scr"><%//스크린샷 공유 %></div>
			
		</article>
		<article>
			<div><%//접은 학종이 카운트 %></div>
		</article>
		<article>
			<div class="main-wrap">
				<div id="bottle-img-box" onclick="#팝업 창 생성"><%//유리병 이미지 %></div>
			</div>
		</article>
		<article>
			<div id="left-bottle">◁</div>
			<div id="right-bottle">▷</div>
		</article>
		<article>
			<div id="paper-wrap">
				<div id="paper-img-box" onclick="GotoWrite();">
				<%//학종이: 소지 학종이 중 랜덤으로 보여진다 %>
				</div>
			</div>
		</article>
		<article class="bg-image-wrap">
			<div class="background-image">배경화면</div>
		</article>
	</section>

	<navi class="navi">
		<div class="menu">상점</div>
		<div class="menu"><a href="#유리병 관리 페이지">유</a></div>
		<div class="menu"><a href="myInfoView.jsp">내정보</a></div>
		<div class="menu"><a href="settingsView.html">환경설정</a></div>
	</navi>
	
	<script type="text/javascript">
		function GotoWrite(){
			<% 
			String str = "nowB";	//임시 값
			session.setAttribute("nowBottle", str);
			%>
			location.href="writingView.jsp";
		}
	</script>
</body>
</html>
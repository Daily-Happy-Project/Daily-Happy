<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
		//insert into user(email,name,pw) values('d@d','이민진','1111');
		//test string: 
		//uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	//ArrayList<JarObj> list = (new JarDAO()).getJarList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	top: 15%;
	left: 10px;
	z-index: 3;
	width: 40px;
	height: 40px;
	border-radius: 100px;
	background-color: #AAAAAA;
	display: flax;
}
.scr{
	position: absolute;
	width: 100%;
	margin: 0.5em auto;
}
.scr-icon{
	width: 60%;
	margin: 0 auto;
}
#cnt{
	position: absolute;
	top: 10%;
	font-size: 30pt;
	z-index: 5;
	width: 100%;
}
.main-wrap{
	position: absolute;
	bottom: 5.5em;
	width: 100%;
	z-index:3;
	display: flex;
	
}
#bottle-img-box{
	margin: 0 auto;
	padding-top: 2em;
	padding-bottom: 2em;
	width: 100%;
}
.jarimg{
	width: 60%;
	max-width: 250px;
	min-width: 200px;
}
#left-bottle, #right-bottle{
	cursor: pointer;
    position: absolute;
    bottom: 40%;
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
  		url('../resources/images/pink-round-theme.png');
  	background-color: #FFF2E2;
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
	z-index: 3;
	display: flex;
}
#paper-img-box{
	margin: 0 auto;
	width: 100%;
	max-width: 400px;
	height: 110px;
}
.paperimg{
	width: 100%;
	max-width: 250px;
	min-width: 200px;
	margin-bottom: -50%;
}


.table{
	position: fixed;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 10em;
	background-color: #FFC7C7;
	z-index: 2;
}
.navi{
	position: fixed;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 3em;
	background-color: #F6F6F6;
	z-index: 4;
}
.menu-wrap{
	float:left;
	text-align: center;
	width: 25%;
	height: 100%;
}
.menu{
	width: 100%;
	height: 100%;
	display: flex;

}
.menu-icon{
	margin: 0.5em auto;
	height: 60%;
}
</style>
<!-- count() -->
</head>
<body>
	<section align="center">

		<article class="scr-wrap">
			<div class="scr"><img class="scr-icon" src="../resources/images/camera.png" alt="스크린샷 공유"><%//스크린샷 공유 %></div>
			
		</article>
		<article>
			<div id="cnt">00<%//접은 학종이 카운트 %></div>
		</article>
		<article>
			<div class="main-wrap">
				<%
					String strJ = "<div id=\"bottle-img-box\" onclick=\"popup 생성\">";
					strJ += "<img src=\"../resources/images/normal-3.png\" class=\"jarimg\" alt=\"유리병 이미지\"/>";
					strJ +="</div>";
					out.print(strJ);
				%><%//유리병 이미지 %>
			</div>
		</article>
		<article>
			<div id="left-bottle">◁</div>
			<div id="right-bottle">▷</div>
		</article>
		<article>
			<div id="paper-wrap">
				<div id="paper-img-box" onclick="GotoWrite();">
				<%
					String strP = "<div id=\"paper-img-box\" onclick=\"GotoWrite();\">";
					strP += "<img src=\"../resources/images/gra-paper-r.png\" class=\"paperimg\" alt=\"새 글 작성\"/>";
					strP +="</div>";
					out.print(strP);
				%><%//학종이 이미지 %>
				</div>
			</div>
		</article>
		<article class="bg-image-wrap">
			<div class="background-image"></div>
		</article>
		<article>
			<div class="table"></div>
		</article>
	</section>

	<navi class="navi">
		<div class="menu-wrap"><a class="menu" href="#"><img class="menu-icon" src="../resources/images/shop.png" alt="상점"></a></div>
		<div class="menu-wrap"><a class="menu" href="#유리병 관리 페이지"><img class="menu-icon" src="../resources/images/jar.png" alt="유리병 관리"></a></div>
		<div class="menu-wrap"><a class="menu" href="myInfoView.jsp"><img class="menu-icon" src="../resources/images/user.png" alt="내 정보"></a></div>
		<div class="menu-wrap"><a class="menu" href="settingsView.html"><img class="menu-icon" src="../resources/images/settings.png" alt="환경설정"></a></div>
	</navi>
	
	<script type="text/javascript">
		function GotoWrite(){
			<% 
			String strtmp = "nowB";	//임시 값
			session.setAttribute("nowBottle", strtmp);
			%>
			location.href="writingView.jsp";
		}
	</script>
</body>
</html>
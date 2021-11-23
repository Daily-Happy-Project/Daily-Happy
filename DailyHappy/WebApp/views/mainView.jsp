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

<title>하루, 행복 - 메인화면</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	margin: 0;
}

article{
	width: 100%;
}
.scr-wrap{
	position: fixed;
	top: 10%;
	left: 10px;
	z-index: 6;
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
#cnt-wrap{
	position: absolute;
	top: 10%;
	z-index: 5;
	font-size: 30pt;
	width: 100%;
	display: flax;
	
}
#cnt{
	width: 30%;
	margin: 0 auto;
	font-size: 40pt;
	padding: 0.5em 0em 0.5em 0em;
	background-color: rgba(0,0,0,0.2);
	border-radius: 20px;
	color: #ffffff;
	-webkit-text-stroke: 2px #AAAAAA;
	font-family: 'GongGothicMedium';
	
}
.main-wrap{
	position: absolute;
	bottom: 5.5em;
	width: 100%;
	z-index:2;
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
    color: #AAAAAA;
    -webkit-text-stroke: 10px #AAAAAA;
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
  		url('#');
  	background-color: #FEFBF3;
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
	display: flex;
}
#paper-img-box{
	margin: 0 auto;
	width: 100%;
	max-width: 400px;
	height: 110px;
}
#paper-img-box:hover{
	cursor: pointer;
}
.paperimg{
	width: 100%;
	max-width: 250px;
	min-width: 200px;
	margin-bottom: -50%;
}

</style>
<!-- count() -->
</head>
<body>
	<section align="center">

		<article class="scr-wrap">
			<div class="scr"><img class="scr-icon" src="../resources/images/camera.png" alt="스크린샷 공유"><%//스크린샷 공유 %></div>
			
		</article>
		<article id="cnt-wrap">
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
			<div id="left-bottle">〈</div>
			<div id="right-bottle">〉</div>
		</article>
		<article>
			<div id="paper-wrap">
				<div id="paper-img-box" onclick="GotoWrite();">
				<%
					String strP = "<div id=\"paper-img-box\" onclick=\"GotoWrite();\">";
					strP += "<img src=\"../resources/images/gra-paper-r.png\" class=\"paperimg\" alt=\"새 글 작성\"/>";
					strP +="</div>";
					out.print(strP);
				%><%//유리병 이미지 %>
				</div>
			</div>
		</article>
		<article class="bg-image-wrap">
			<div class="background-image">배경화면</div>
		</article>
	</section>

	<nav><%@include file="bottomNavi.html"%></nav> 
	
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
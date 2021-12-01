<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<<<<<<< HEAD

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
		return;
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTO HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
=======
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
>>>>>>> main
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="http://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<title>하루, 행복 - 메인화면</title>


=======

<title>하루, 행복 - 메인화면</title>

>>>>>>> main
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
<<<<<<< HEAD
	bottom: 80%;
	left: 10px;
	z-index: 6;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	background-color: #ba7574;
	display: flax;
	cursor: pointer;
}
.scr{
	width: 100%;
	margin: 5px auto;
}
.scr-icon{
	width: 100%;
	margin: auto;
}
#edit{
	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	margin: 0px;
  	padding: 0px;
  	border: none;
  	background-color: rgba(0,0,0,0);
  	
}
#cnt-wrap{
	position: absolute;
	bottom: 75%;
=======
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
>>>>>>> main
	z-index: 5;
	font-size: 30pt;
	width: 100%;
	display: flax;
<<<<<<< HEAD

}
#cnt{
	width: 30%;
	min-width: 2em;
	margin: 0 auto;
	font-size: 45pt;
	padding: 0.1em 0em 0.1em 0em;
	background-color: rgba(195, 56, 55, 0.65);
	border-radius: 20px;
	color: #ffffff;
	/*-webkit-text-stroke: 2px #c33837;*/
=======
	
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
>>>>>>> main
	font-family: 'GongGothicMedium';
	
}
.main-wrap{
	position: absolute;
<<<<<<< HEAD
	bottom: 30vh;
	width: 100%;
	z-index:3;
=======
	bottom: 5.5em;
	width: 100%;
	z-index:2;
>>>>>>> main
	display: flex;
	
}
#bottle-img-box{
	margin: 0 auto;
<<<<<<< HEAD
	width: 60vw;
}
.jarimg{
	width: 60vw;
	max-width: 250px;
=======
	padding-top: 2em;
	padding-bottom: 2em;
	width: 100%;
}
.jarimg{
	width: 60%;
	max-width: 250px;
	min-width: 200px;
>>>>>>> main
}
#left-bottle, #right-bottle{
	cursor: pointer;
    position: absolute;
    bottom: 40%;
    padding: 5%;
<<<<<<< HEAD
    font-size: 30pt;
    z-index: 4;
    color: #c33837;
    -webkit-text-stroke: 3px #c33837;
=======
    font-size: 20pt;
   	
    z-index: 4;
    color: #AAAAAA;
    -webkit-text-stroke: 10px #AAAAAA;
>>>>>>> main
}
#left-bottle{
	left: 0;
}
#right-bottle {
	right: 0;
}
<<<<<<< HEAD


#paper-wrap{
	position: fixed;
	bottom:8vh;
	width: 100%;
	z-index: 3;
=======
.bg-image-wrap{
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: 1;
}
.background-image{
	display: inline-block;
  	background-image: url('../resources/images/pink-round-theme.png');
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
	z-index: 2;
>>>>>>> main
	display: flex;
}
#paper-img-box{
	margin: 0 auto;
	width: 100%;
	max-width: 400px;
	height: 110px;
}
.paperimg:hover{
	cursor: pointer;
}
.paperimg{
	width: 100%;
	max-width: 250px;
	min-width: 200px;
	margin-bottom: -50%;
<<<<<<< HEAD
	box-shadow: 8px -8px 0 0 rgba(94,96,115,0.3);
}
.table{
	position: fixed;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 35vh;
	background-color: #FFC7C7;
	z-index: 2;
}

=======
}
>>>>>>> main

</style>
<!-- count() -->
</head>
<body>
<<<<<<< HEAD
<%@ include file="soundOnOff.jsp" %>
<%@include file="bottomNavi.html"%>

<div id="screen-wrap">
<!-- <audio id="audio" src="../resources/media/bensound-memories.mp3"></audio> -->
<div class="container" id='container'>
<section align="center">
	<article class="scr-wrap" align="center">
		<div class="scr" style="width:80%;"><button type="button" id="edit" onclick=screenShot()><img class="scr-icon" src="../resources/images/cameraW.png" alt="스크린샷"></button></div>
		<a id="target" style="display:none"></a>
		
	</article>
	<article id="cnt-wrap" >
		<div id="cnt">01<%//접은 학종이 카운트 %></div>
	</article>
	<article>
		<div class="main-wrap">
			<%
				String strJ = "<div id=\"bottle-img-box\">";
				strJ += "<img src=\"../resources/images/normal-3.png\" class=\"jarimg\" alt=\"유리병 이미지\" onclick=\"GotoCheck();\"/>";
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
			<%
			ArrayList<UserItemObj> randP = (new UserItemDAO()).randomPaper(uemail);
				 for(UserItemObj uItem : randP){
					int pItemCode = uItem.getItemCode();
					String pImg = uItem.getImg();
					String strP = "<div id=\"paper-img-box\">";
					strP += "<img src=\""+ pImg +"\" class=\"paperimg\" alt=\"새 글 작성\" onclick=\"GotoWrite();\"/>";
					strP +="</div>";
					String local = "<script type=\"text/javascript\">localStorage.setItem('nowPCode',"+pItemCode+");";
					local += "localStorage.setItem(\'nowPImg\',\'"+pImg+"\');";
					local += "</script>";
					out.print(strP);
					out.print(local);
				} 
				
				
/* 				String strP = "<div id=\"paper-img-box\">";
				strP += "<img src=\""+ randP +"\" class=\"paperimg\" alt=\"새 글 작성\" onclick=\"GotoWrite();\"/>";
				strP +="</div>";
				out.print(strP); */
				
			%>
		</div>
	</article>
	
	<article>
		<div class="table"></div>
	</article>
</section>
</div>
<%@include file="bgStyle.jsp"%>
</div>
	
	
	<script type="text/javascript">
		function GotoCheck(){
			location.href="checkWritingView.jsp"
		}

		function GotoWrite(){
			location.href="writingView.jsp"	
		}
		

</script>
<script type="text/javascript">	

function screenShot() {
	html2canvas(document.body)
	.then(
	function (canvas) {
	drawImg(canvas.toDataURL('image/png'));
	saveAs(canvas.toDataURL(), 'daily-happy.png');
	}).catch(function (err) {
	console.log(err);
	});
}

function drawImg(imgData) {
	console.log(imgData);
	return new Promise(function reslove() {
	var canvas = document.getElementById('canvas');
	var ctx = canvas.getContext('2d');
	ctx.clearRect(0, 0, canvas.width, canvas.height);

	var imageObj = new Image();
	imageObj.onload = function () {
	ctx.drawImage(imageObj, 10, 10);
	};
	imageObj.src = imgData;

	}, function reject() { });

}

function saveAs(uri, filename) {
	var link = document.createElement('a');
	if (typeof link.download === 'string') {
	link.href = uri;
	link.download = filename;
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
	} else {
	window.open(uri);
	}
}
		
=======
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
					String strJ = "<div id=\"bottle-img-box\">";
					strJ += "<img src=\"../resources/images/normal-3.png\" class=\"jarimg\" alt=\"유리병 이미지\" onclick=\"GotoCheck();\"/>";
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
				<%
					String strP = "<div id=\"paper-img-box\">";
					strP += "<img src=\"../resources/images/gra-paper-r.png\" class=\"paperimg\" alt=\"새 글 작성\" onclick=\"GotoWrite();\"/>";
					strP +="</div>";
					out.print(strP);
				%><%//유리병 이미지 %>
			</div>
		</article>
		<article class="bg-image-wrap">
			<div class="background-image"></div>
		</article>
		<article>
			<div class="table"></div>
		</article>
	</section>

	<nav><%@include file="bottomNavi.html"%></nav> 
	
	<script type="text/javascript">
<%
	String nowJar = "nowJ"; //임시값. 화살표 누를때마다 nowJar이 가리키는 값이 바뀌도록.
	session.setAttribute("nowJar", nowJar);
%>
		function GotoCheck(){
			location.href="checkWritingView.jsp"
		}
		function GotoWrite(){
			location.href="writingView.jsp"
		}
>>>>>>> main
	</script>
</body>
</html>
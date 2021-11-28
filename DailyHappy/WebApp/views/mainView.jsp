<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<%@ include file="soundOnOff.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%

	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);
	//ArrayList<JarObj> list = (new JarDAO()).getJarList();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTO HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

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
	z-index: 3;
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

#screenshot_background {
	width:100%;
	height:100%;
	position:fixed;
	top:0px;
	left:0px;
	display:block;
	opacity:0.3;
	text-align:center;
	box-sizing:border-box;
	z-index:2147483647;
	border-color:black;
	border-style:solid;
}

#screenshot:before, #screenshot:after {
	border:none !important;
	content:"" !important;
	height:100% !important;
	position:absolute !important;
	width:100% !important;
}

#screenshot:before {
	border-right:1px solid white !important;
	border-bottom:1px solid white !important;
	left:-100% !important;
	top:-100% !important;
}

#screenshot:after {
	border-top:1px solid white !important;
	border-left:1px solid white !important;
	left:0 !important;
	top:0 !important;
}

#screenshot {
	height:100% !important;
	position:fixed !important;
	width:100% !important;
	z-index:2147483648 !important;
}

body.edit_cursor {
	cursor: crosshair;
}

</style>
<!-- count() -->
</head>
<body>
<div id="screenshot">
<!-- <audio id="audio" src="../resources/media/bensound-memories.mp3"></audio> -->
	<section align="center">

		<article class="scr-wrap">
			<div class="scr" style="width:80%;"><button type="button" id="edit"><img class="scr-icon" src="../resources/images/camera.png" alt="스크린샷 공유"></button></div>
			<a id="target" style="display:none"></a>
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
	
	</div>
	
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
		
		window.onload=function() {
			document.getElementById("edit").addEventListener("click", function(e) {
				document.querySelector("body").classList.add("edit_cursor");
				screenshot(e);
			});
		}
		
		function screenshot(e) {
			var startX, startY;
			var height=window.innerHeight;
			var width=window.innerWidth;
			
			var $screenBg=document.createElement("div");
			$screenBg.id="screenshot_background";
			$screenBg.style.borderWidth="0 0 "+height+"px 0";
			
			var $screenshot=document.createElement("div");
			$screenshot.id="screenshot";
			
			document.querySelector("body").appendChild($screenBg);
			document.querySelector("body").appendChild($screenshot);
			
			var selectArea=false;
			var body=document.querySelector('body');
			
			var mousedown=function(e) {
				e.preventDefault();
				selectArea=true;
				startX=e.clientX;
				startY=e.clientY;
				body.removeEventListener("mousedown", mousedown);
			}
			
			body.addEventListener("mousedown", mousedown);
			
			var mouseup=function(e) {
				selectArea=false;
				body.removeEventListener("mousemove", mousemove);
				$screenshot.parentNode.removeChild($screenshot);
				$screenBg.parentNode.removeChild($screenBg);
				var x=e.clientX;
				var y=e.clientY;
				var top=Math.min(y, startY);
				var left=Math.min(x, startX);
				var width=Math.max(x, startX)-left;
				var height=Math.max(y, startY)-top;
				html2canvas(document.body).then(
					function(canvas) {
						var img=canvas.getContext('2d').getImageData(left, top, width, height);
						var c=document.createElement("canvas");
						c.width=width;
						c.height=height;
						c.getContext('2d').putImageData(img, 0, 0);
						save(c);
					}		
				);
				body.removeEventListener("mouseup", mouseup);
				
				document.querySelector("body").classList.remove("edit_cursor");
			}
			body.addEventListener("mouseup", mouseup);
			
			function mousemove(e) {
				var x=e.clientX;
				var y=e.clientY;
				$screenshot.style.left=x;
				$screenshot.style.top=y;
				if(selectArea) {
					var top=Math.min(y, startY);
					var right=width-Math.max(x, startX);
					var bottom=height-Math.max(y, startY);
					var left=Math.min(x, startX);
					$screenBg.style.borderWidth=top+'px'+right+'px'+bottom+'px'+left+'px';
				}
			}
			body.addEventListener("mousemove", mousemove);
			
			function save(canvas) {
				if(navigator.msSaveBlob) {
					var blob=canvas.msToBlob();
					return navigator.msSaveBlob(blob, '파일명.jpg');
				}
				else {
					var el=document.getElementById("target");
					el.href=canvas.toDataURL("image/jpeg");
					el.download='파일명.jpg';
					el.click();
				}
			}
			
		}
		
	</script>
</body>
</html>
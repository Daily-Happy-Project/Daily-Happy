<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
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
	z-index: 5;
	font-size: 30pt;
	width: 100%;
	display: flax;

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
	font-family: 'GongGothicMedium';
	
}
.main-wrap{
	position: absolute;
	bottom: 30vh;
	width: 100%;
	z-index:3;
	display: flex;
	
}
#bottle-img-box{
	margin: 0 auto;
	width: 60vw;
}
.jarimg{
	width: 60vw;
	max-width: 250px;
}
#left-bottle, #right-bottle{
	cursor: pointer;
    position: absolute;
    bottom: 40%;
    padding: 5%;
    font-size: 30pt;
    z-index: 4;
    color: #c33837;
    -webkit-text-stroke: 3px #c33837;
}
#left-bottle{
	left: 0;
}
#right-bottle {
	right: 0;
}


#paper-wrap{
	position: fixed;
	bottom:8vh;
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


</style>
<!-- count() -->
</head>
<body>
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
		
	</script>
</body>
</html>
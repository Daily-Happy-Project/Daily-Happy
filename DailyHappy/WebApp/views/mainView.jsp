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
<%	//소지 유리병의 목록을 배열에 저장
	ArrayList<JarObj> myJar = (new JarDAO()).getJarList(uemail);

	ArrayList<FriendObj> myFr= (new FriendDAO()).getFriendList(uemail);
	for (FriendObj fri : myFr){
		String fremail = fri.getFriendEmail();
		ArrayList<JarObj> frJar = (new FriendDAO()).getFriendJarList(uemail);
		for(JarObj jar : frJar){
			myJar.add(jar);
		}
	}
	
	JarDAO jDao = new JarDAO();
	int listSize = myJar.size();
	
	String jName = "";
	String jImgName = "";
	int cnt = 0;
	int goalNum = 0;
	String jImg = "";
	int jarcnt = jDao.countJar(uemail);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTO HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="http://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>하루, 행복 - 메인화면</title>


<style type="text/css">
@font-face {
    font-family: 'Uiyeun';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
	margin: 0;
}
.container{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 91vh;
}
.scr-wrap{
	position: fixed;
	bottom: 80%;
	left: 15px;
	z-index: 6;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	background-color: #ba7574;
	cursor: pointer;
}
.scr{
	width: 80%;
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
.cnt-wrap{
	position: fixed;
	bottom: 88vh;
	z-index: 5;
	font-size: 30pt;
	width: 100%;
}
.cnt{
	width: 30%;
	min-width: 2em;
	margin: 0 auto;
	font-size: 45pt;
	padding: 0.1em 0em;
	background-color: rgba(195, 56, 55, 0.65);
	border-radius: 0px 0px 20px 20px;
	color: #ffffff;
	/*-webkit-text-stroke: 2px #c33837;*/
	font-family: 'GongGothicMedium';
}

#bottle-img-box{
	width: 60vw;
}

#left-bottle, #right-bottle{
	cursor: pointer;
    padding: 5%;
    font-size: 30pt;
    color: #c33837;
    -webkit-text-stroke: 3px #c33837;
}
#paper-wrap{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 78vh;
	width: 100%;
	z-index: 3;
}
#paper-img-box{
	width: 70vw;
	max-width: 400px;
	min-width: 200px;
}
.paperimg{
	width: 100%;
	box-shadow: 8px -8px 0 0 rgba(94,96,115,0.3);
	cursor: pointer;
}
.jar-name{
	font-family: 'Uiyeun';
	font-size: 8vh;
	color: #000;
	text-align: center;
}
.jar-arrow-wrap{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 100px;
	width: 100vw;
	height: 450px;

}
.jar-img-box{
	width: 70vw;
	max-width: 280px;
	min-width: 100px;
	z-index: 4;
	margin: auto;
}
.jar-box-form{
	width: 70vw;
	max-width: 280px;
	min-width: 100px;
	z-index: 4;
	margin: auto;
}
.jarimg{
	width: 100%;
	cursor: pointer;
}
#no0{
	margin: auto;
	cursor: pointer;
	opacity: 0.3;
}
#no0 .jarimg{
	width: 20vw;
	max-width: 100px;
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
.hide{
	display: none;
}


</style>
<!-- count() -->
</head>
<body>
<%@ include file="soundOnOff.jsp" %>
<%@include file="bottomNavi.html"%>

<div id="screen-wrap" id='container'>
<!-- <audio id="audio" src="../resources/media/bensound-memories.mp3"></audio> -->

<section align="center" class="container">
	<article class="scr-wrap" align="center">
		<div class="scr"><button type="button" id="edit" onclick=screenShot()><img class="scr-icon" src="../resources/images/cameraW.png" alt="스크린샷"></button></div>
		<a id="target" style="display:none"></a>
	</article>
	<article class="cnt-wrap">
		<div class="cnt">00</div>
		<%
		if(jarcnt!=0){
			 for(JarObj uJar : myJar){
				cnt = uJar.getCnt();
				String cntStr = "";
				if(cnt < 10){
					cntStr = "0"+cnt;
				}
				else{
					cntStr = ""+cnt;
				}
				String nowcnt = "<div class=\"cnt\">";
				nowcnt += cntStr;
				nowcnt += "</div>";
				out.print(nowcnt);
			}
		}
		%>
	</article>
	<article class="jar-name-wrap">
		<div class="jar-name"></div>
		
		<%
		if(jarcnt!=0){
			 for(JarObj uJar : myJar){
				jName = uJar.getJarName();
				String nowname = "<div class=\"jar-name\">";
				nowname += jName;
				nowname += "</div>";

				out.print(nowname);
			}
		}
		%>

	</article>
	<article class="jar-arrow-wrap">
		<div id="left-bottle" onclick="plusSlides(-1)">〈</div>
		<form class="jar-box-form" method="get" action="checkWritingView.jsp">
			<div class="jar-img-box" id="no0">
				<a href="makeJarView.jsp"><img class="jarimg "src="../resources/images/add.png"/></a>
			</div>
			
			<%
				if(jarcnt!=0){
					 for(JarObj uJar : myJar){
						jName = uJar.getJarName();
						jImgName = uJar.getJarImgName();
						cnt = uJar.getCnt();
						goalNum = uJar.getGoalNum();
						jImg = jDao.mainJarImg(jImgName, goalNum, cnt);
						String imgBox = "<div class=\"jar-img-box\">";

						imgBox += "<input type=\"image\" src=\""+jImg+"\" class=\"jarimg\" name=\"Submit\" value=\"Submit\" alt=\"학종이 꺼내기\">";
						imgBox += "<br><input type=\"text\" name=\"nowjar\" value=\""+jName+"\" hidden>";						

						imgBox += "</div>";

						out.print(imgBox);
					}
				}
			%>
		</form>
		 <div id="right-bottle" onclick="plusSlides(1)">〉</div>
	</article>
	<article id="paper-wrap">
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
			%>
	</article>
	
	<article>
		<div class="table"></div>
	</article>
</section>

<%@include file="bgStyle.jsp"%>
</div>
	
<script type="text/javascript">
	var slideIndex = 1;
	var jarName = localStorage.nowJar;
	var nowjName = "";

	
	$(function(){
		showSlides(slideIndex);
		if(jarName != null){
			while(jarName != nowjName){
				plusSlides(1);
			}
		}
	})
	function plusSlides(n){
	    showSlides(slideIndex += n);
	};
            
	function showSlides(n){
	    var cnts = document.getElementsByClassName("cnt");
	    var jarNames = document.getElementsByClassName("jar-name");
	    var imgs = document.getElementsByClassName("jar-img-box");
	    
	    if (n > imgs.length) {slideIndex = 1}
	    if (n < 1) {slideIndex = imgs.length}
	    for (i = 0; i < imgs.length; i++) {
	        cnts[i].style.display = "none";
	        jarNames[i].style.display = "none";
	        imgs[i].style.display = "none";
	    }
	    cnts[slideIndex-1].style.display = "block";
	    jarNames[slideIndex-1].style.display = "block";
	    imgs[slideIndex-1].style.display = "block";
	    nowjName = jarNames[slideIndex-1].innerText;
	    localStorage.setItem('nowJar', nowjName); 
	};

	function GotoCheck(){
		location.href="checkWritingView.jsp"
	};

	function GotoWrite(){
		var zeroCheck = document.getElementById("no0").style.display
		if(zeroCheck == "block"){
			alert("앗! 아직 유리병이 없네요. 유리병을 먼저 추가해 주세요!");
		}
		else{
			location.href="writingView.jsp";	
		}
	};
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
};

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

};
	
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
};
		
	</script>
</body>
</html>
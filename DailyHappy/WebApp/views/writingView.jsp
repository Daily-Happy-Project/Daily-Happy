<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>

<%

	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<title>하루, 행복 - 행복을 적어보세요</title>


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

	#p-form-wrap{
		width: 60vw;
		max-width: 300px;
		margin: 0 auto;
		padding-bottom: 4em;
		z-index: 5;
		margin-top: 10vh;
		margin-bottom: 10vh;
	}
	#p-text-wrap{
		height: 60vw;
		max-height: 300px;
		margin: 0 auto;
    	word-break:break-all;
    	background-image: url('../resources/images/gra-paper-y.png');
    	-webkit-background-size: contain;
	   	-moz-background-size: contain;
	   	-o-background-size: contain;
		background-size: 100%;
		background-position: contain;
		background-repeat: no-repeat;
		box-shadow: 8px -8px 0 0 rgba(94,96,115,0.3);
    	
	}
	#p-text{
		font-family: 'Uiyeun';
		font-size: 5vh;
		resize: none;
		border: none;
	 	background-color: transparent;
		width: 80%;
		
	}
	#p-submit{
		font-family: 'Uiyeun';
		font-size: 5vh;
		color: #000;
		text-align: center;
		border: none;
		background-color:#FFC7C7; 
		border-radius: 8px;
	    padding-top: 10px;
		padding-bottom: 10px;
		margin-top: 5vh; 
		width: 150px;
		box-shadow: 6px -7px 0 0 rgba(94,96,115,0.3);
	}
	#p-submit:hover{
		background-color:#c33837;
		color: #fff;
		
	}
	
/*sidebar css*/
	#s-container{
		height: 91vh;
		position: absolute;
		top: 0;
		right: 0;
		display: flex;
		flex-direction: row;
	}
	#sidebar-toggle{
		height: 100%;
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
	}
	
	#s-arrow{
		width: 7vh;
		font-family: 'Uiyeun';
		font-size: 5vh;
		text-align: center;
		color: #fff;
		-webkit-text-stroke: 3px #fff;
		background-color: #FFC7C7;
		border-radius: 12px;
		margin: 0 auto;
		position: absolute;
		right: 5px;	
		z-index:9;
	}
	#s-line{
		width: 15px;
		height: 100%;
		background-color: #FFC7C7;
		margin: 0 auto;
		position: absolute;
		right: 0;
		z-index:8;
	}
	#s-list-wrap{
		background-color: #AAAAAA;
		margin: 0 auto;
		overflow: auto;
	}
	.s-list{
		margin: 0 auto;
		padding-left: 15px;
		padding-right: 15px;
	}
	.p-list{
		list-style:none;
		padding-top: 15px;
	}
	.p-list, .p-img{
		width: 20vw;
		height: 20vw;
		max-width: 100px;
		max-height: 100px;
		
	}
html.open #s-list-wrap {
-webkit-transform: translate3d(100px,0,0);
-moz-transform: translate3d(100px,0,0);
transform: translate3d(100px,0,0);
-webkit-transition: all 0.2s;
-moz-transition: all 0.2s;
-ms-transition: all 0.2s;
-o-transition: all 0.2s;
transition: all 0.2s;
}

</style>
<script type="text/javascript">
	$("#sidebar-toggle").click(function(){
		$("html").toggleClass("open");
	});
</script>
</head>
<body>

<!-- 글 내용, 학종이 이미지 코드, 유리병 이름 넘겨줘야 함!-->

	<%@include file="bottomNavi.html"%>
<div class="container">
	<article align="center">
	<div id="p-form-wrap">
		<form method="post" action="../jsp/writing.jsp">
			<div id="p-text-wrap">
				<textarea id="p-text" name="content" rows="7" placeholder="오늘은 어떤 행복이 당신을 찾아왔나요?"></textarea>
			</div>
			<div id="p-name">
				<input type="text" name="pname" value="" disabled/>
			</div>
			<input id="p-submit" type="submit" value="접어보자!">				
		</form>
	</div> 
		<!-- 토글바 만들어서 토글바에서 선택한 것이 disabled 값을 바꾸도록 자바스크립트 -->
	</article>

	<%--<%@include file="bgStyle.jsp"%>  --%>
</div>
<div id="s-container">
<article id="sidebar-toggle">
	<div id="s-arrow">〈&nbsp;</div>
	<div id="s-line"></div>
</article>
<article id="s-list-wrap">
	<div>
	<ul class="s-list">
<%
	ArrayList<UserItemObj> pList = (new UserItemDAO()).getUserItemList(uemail, "paper");
	String pstr = "";

	int cnt = 0;
	for(UserItemObj uItem : pList ){
		cnt++;
		String name = uItem.getItemName();
		String img = uItem.getImg();
		pstr += "<li class=\"p-list\">";
		pstr += "<img class=\"p-img\" src=\""+img+"\">";
	}
	out.print(pstr);
%>
	</ul>
	</div>
</article>

</div>

</body>
</html>
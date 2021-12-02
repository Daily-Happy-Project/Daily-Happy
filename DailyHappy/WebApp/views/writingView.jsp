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
		return;
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	.dis-sub{
		font-family: 'Uiyeun';
		font-size: 5vh;
		color: #000;
		text-align: center;
		border: none;
		background-color:#AAAAAA; 
		border-radius: 8px;
	    padding-top: 10px;
		padding-bottom: 10px;
		margin-top: 5vh; 
		width: 150px;
		box-shadow: 6px -7px 0 0 rgba(94,96,115,0.3);
	}
	.sub{
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
	.sub:hover{
		background-color:#c33837;
		color: #fff;
		
	}
	
/*sidebar css*/
	#s-container{
		height: 91vh;
		position: fixed;
		top: 0;
		right: -18vh;
		display: flex;
		flex-direction: row;
	
	}
	#sidebar-toggle{
		height: 100%;
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;

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
		cursor: pointer;
	}
	#s-line{
		width: 2vh;
		height: 100%;
		background-color: #FFC7C7;
		margin: 0 auto;
		position: absolute;
		right: 0;
		z-index:8;
	}
	#s-list-wrap{
		background-color: rgba(0,0,0,0.3);
		margin: 0 auto;
		overflow: auto;
	}
	.s-list{
		margin: 0 auto;
		padding-left: 2vh;
		padding-right: 2vh;
	}
	.p-list{
		list-style:none;
		padding-top: 15px;
	}
	.p-list, .p-img{
		width: 30vw;
		height: 30vw;
		max-width: 100px;
		max-height: 100px;
		
	}
.open{
-webkit-transform: translateX(-18vh);
-moz-transform: translateX(-18vh);
transform: translateX(-18vh);
-webkit-transition: all 0.4s;
-moz-transition: all 0.4s;
-ms-transition: all 0.4s;
-o-transition: all 0.4s;
transition: all 0.4s;
}

</style>

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
			<div id="j-name-wrap">
				<input type="text" id="j-name" name="jarName" value="nowJar"/>
			</div>
			<div id="paper-code-wrap">
				<input type="text" id="paper-code" name="paperCode" value=""/>
			</div>
			<input id="p-sub" class="dis-sub" type="submit" value="접어보자!" disabled>				
		</form>
	</div> 
		<!-- 토글바 만들어서 토글바에서 선택한 것이 disabled 값을 바꾸도록 자바스크립트 -->
	</article>

	<%@include file="bgStyle.jsp"%>
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
		int code = uItem.getItemCode();
		String name = uItem.getItemName();
		String img = uItem.getImg();
		pstr += "<li class=\"p-list\">";
		pstr += "<img class=\"p-img\" id=\""+code+"\" onclick=\"pChoice("+ code +", "+ cnt +")\" src=\""+img+"\">";
	}
	out.print(pstr);
%>
	</ul>
	</div>
</article>

</div>
<script type="text/javascript">
	$('#s-arrow').click(function() {
	    $('#s-container').toggleClass('open');
	 })
	 
	 $(function(){ 
		 var code = localStorage.nowPCode;
		 var img = localStorage.nowPImg;
		 var jarName = localStorage.nowJar;
		$('#p-text-wrap').css({"background-image": "url("+img+")"});
		$('#paper-code').attr('value', code);
		$('#j-name').attr('value', jarName);
		
	 });
	
	function pChoice(code, cnt){
		var id = '#'+code;
		var img = $(id).attr('src');
		$("#p-text-wrap").css({"background-image": "url("+img+")"});
		$('#paper-code').attr('value',code);
	}
    $('#p-text').focusout(function(){
        var str = $('p-text').value;
    	if(str!=""){
            $('#p-sub').addClass("sub");
            $('#p-sub').removeClass("dis-sub");
            $('#p-sub').removeAttr("disabled");
        }
        else{
            $('#p-sub').removeClass("sub");
            $('#p-sub').addClass("dis-sub");
            $('#p-sub').attr("disabled", "true");
        }
    })
</script>
</body>
</html>
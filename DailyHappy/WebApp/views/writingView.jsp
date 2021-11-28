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
<title>하루, 행복 - 행복을 적어보세요</title>

<style type="text/css">
	article{
		position: absolute;
		top: 8em;
		width: 100%;
		display: flex;
		
	}
	#p-form-wrap{
		width: 90%;
		max-width: 300px;
		min-width: 200px; 
		margin: 0 auto;
		padding-bottom: 4em;
		z-index: 2;
	}
	#p-text-wrap{
		width: 100%;
		margin: 50px auto;
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
		font-size: 16pt;
		resize: none;
		border: none;
	 	background-color: transparent;
		width: 90%;
		height: 90%;
		
	}
</style>
</head>
<body>

<!-- 글 내용, 학종이 이미지 코드, 유리병 이름 넘겨줘야 함!-->

	<%@include file="bottomNavi.html"%>
	<%@include file="bgStyle.jsp"%>
<div class="container">
	<article align="center">
	<div id="p-form-wrap">
		<form method="post" action="../jsp/writing.jsp">
			<div id="p-text-wrap">
				<textarea id="p-text" name="content" rows="12" cols="12" placeholder="오늘은 어떤 행복이 당신을 찾아왔나요?"></textarea>
			</div>
			<div id="p-name">
				<input type="text" name="pname" value="" disabled/>
			</div>
			<input type="submit" value="접어보자!">				
		</form>
	</div> 
		<!-- 토글바 만들어서 토글바에서 선택한 것이 disabled 값을 바꾸도록 자바스크립트 -->
	</article>
	
</div>
</body>
</html>
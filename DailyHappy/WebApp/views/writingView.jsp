<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>하루, 행복 - 행복을 적어보세요</title>

<style type="text/css">
	article{
		width: 100%;
		display: flex;
	}
	#p-form-wrap{
		width: 90%;
		max-width: 300px;
		min-width: 200px; 
		margin: 50px auto;
		
	}
	#p-text-wrap{
		width: 100%;
    	word-break:break-all;
    	background-image: url('../resources/images/gra-paper-y.png');
    	-webkit-background-size: contain;
	   	-moz-background-size: contain;
	   	-o-background-size: contain;
		background-size: 100%;
		background-position: contain;
		background-repeat: no-repeat;
		
    	
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
	<header>
	    <h2 class="title">학종이에 글 적기</h2>
		<%@include file="topNavi.html"%>
	</header>
	<article align="center">
	<div id="p-form-wrap">
		<form method="post" action="../jsp/writing.jsp">
		<div id="p-text-wrap">
			<textarea id="p-text" name="content" rows="12" cols="12" placeholder="오늘은 어떤 행복이 당신을 찾아왔나요?"></textarea>
		</div>
			
			<!-- 하단은 임시로 넣어둔 예제이다. -->
			<input type="radio" name="paperCode" value="1" checked/>학종이 코드1
			<input type="radio" name="paperCode" value="2"/>학종이 코드2
			<input type="text" name="jarName" value="이름입니다" style="visibility:hidden;"/><br>
			<input type="submit">
				
		</form>
	</div> 
		
	</article>
	
</body>
</html>
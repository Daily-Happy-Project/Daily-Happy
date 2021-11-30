<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
    
<%

/* 	String email = (String)session.getAttribute("email");
	email = new UserDAO().splitemail(email);
	String paperimg = new UserItemDAO().randomPaper(email);  */

%>

<!DOCTYPE html>
<html>
<style>
	.skip {
		position : fixed;
		top : 20px;
		right: 0%;
		bottom : 800px;		
		width : 80px;
		height: 30px;
		background-color: #FAAEAE;
	}
	
	#id {
		position : 
		width : 400px;
		height: 400px;
	}

</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<section align="center">
		<div class="skip">건너뛰기</div>
		<div class="paper">
		<img id="paperImg" src="paperImg">
		</div>
		<div>학종이를 터치!</div>	
	</section>
	
	글 작성이 완료되었습니다.
	
	
</body>
</html>


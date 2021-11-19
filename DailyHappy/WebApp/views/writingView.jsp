<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		//response.sendRedirect("loginView.html");
		//insert into user(email,name,pw) values('d@d','이민진','1111');
		//test string: 
			uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	//ArrayList<UserObj> list = (new UserDAO()).getUserList();
	
	/* String uname = 
	String uid = 
	String ucoin =  */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>행복을 적어보세요</title>
</head>
<body>
<!-- 글 내용, 학종이 이미지 코드, 유리병 이름 넘겨줘야 함!-->
	<form method="post" action="../jsp/writing.jsp">
		<textarea name="content" rows="12" cols="12">당신의 행복은 무엇인가요?</textarea>
		<!-- 하단은 임시로 넣어둔 예제이다. -->
		<input type="radio" name="paperCode" value="1" checked/>
		<input type="radio" name="paperCode" value="2"/>
		<input type="text" name="jarName" value="djar" style="visibility:hidden;"/>
		<input type="submit">
		
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
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
<title>메인</title>

<style type="text/css">

</style>
</head>
<body>
	<section>
		<article>
			<div class="">배경화면</div>
		</article>
		<article>
			<div>스크린샷 공유</div>
			<div>유리병 공유</div>
		</article>
		<article>
			<div><%//접은 학종이 카운트 %></div>
		</article>
		<article>
			<div onclick="#팝업 창 생성"><%//유리병 이미지 %></div>
		</article>
		<article>
			<div>◀</div>
			<div>▶</div>
		</article>
		<article>
			<div><%//학종이: 소지 학종이 중 랜덤으로 보여진다 %></div>
		</article>
	</section>

	<navi>
		<div>상점</div>
		<div><a href="myInfoView.jsp">내정보</a></div>
		<div><a href="settingsView.html">환경설정</a></div>
	</navi>
</body>
</html>
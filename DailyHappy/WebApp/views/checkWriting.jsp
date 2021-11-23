<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail=request.getParameter("email");
	String ujarName=request.getParameter("jarName");
//	int paperCode = Integer.parseInt(request.getParameter("paperCode").trim());

	WritingDAO dao=new WritingDAO();
	if(dao.content(uemail, ujarName)) {
	uemail=new UserDAO().splitemail(uemail);
	new WritingDAO().content(uemail, ujarName);
	}
 
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>작성글 랜덤 확인</title>
	<style>
		a:link {color: black; text-decoration: none;}
	</style>
</head>
<body>
	<header>
		<div class="x-button" style="float:right">
			<a href="javascript:history.back()">x</a>
		</div>
	</header>
	<article>
		<div class="checkWriting" style="text-align:center">
			<img src="#이미지" />
			<% 
				out.print((new WritingDAO().content(uemail, ujarName)));
			%>
		</div>
	</article>
	<!-- 공유 이미지 -->
	<article>
		<input type="submit" value="글 삭제하기" onclick="del" />
		<%
//			out.print((new WritingDAO().delete(paperCode, ujarName, uemail)));
		%>
	</article>
</body>
</html>
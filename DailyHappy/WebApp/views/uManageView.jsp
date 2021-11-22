<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>
</head>
<body>
<script type="text/javascript">
 
</script>
<%
/* 	String umember = (String)session.getAttribute("memberType");
	if (umember != "K") {
		%>
		<script type="text/javascript">
			alert("접근 권한이 없습니다!");
			history.back();
		</script>
		<%
		return;
		//test string: 
		//uemail = "d@d";
	}
	session.setAttribute("memberType", umember); */
	ArrayList<UserObj> list = (new UserDAO()).getUserList();
%>
	<header>
		<h2 class="title">회원 관리</h2>
		<div class="x-button">x</div>
		<hr class = "dotted-line1">
	</header>
	<article>
		<%
			String str = "<form method=\"get\" action=\"../jsp/userDel.jsp\">";
			str += "<table align=center>";
			str += "<tr><th>이름</th><th>이메일</th><th>보유코인</th><th>회원유형</th><th>삭제<th>";
			str += "<tr colspan=5><hr></tr>";
			for (UserObj user : list) {
			str += "<tr>";
			str += "<td>" + user.getName() + "</td>";
			str += "<td>" + user.getEmail() + "</td>";
			str += "<td>" + user.getCoin() + "</td>";
			str += "<td>" + user.getMemberType() + "</td>";
			str += "<td><input type=\"checkbox\" name=\"delUser\" value=\""+ user.getEmail() +"\"></td>";
			str += "</tr>";
			}
			str += "<tr><td colspan=5><input type=\"submit\" value=\"선택한 계정 삭제\"></td></tr>";
			str += "</table>";
			str += "</form>";
		out.print(str);
		%>
	</article>
</body>
</html>
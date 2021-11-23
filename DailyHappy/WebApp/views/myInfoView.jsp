<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
		//test string: 
		//uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	ArrayList<UserObj> list = (new UserDAO()).myInfo(uemail);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보</title>

<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>

<style>
	table{
		margin-top: 30px;
		margin-bottom: 30px;
	}
	.info-table-line1{
		text-align: right;
	}
	.info-table-line2{
		width: 150px;
		text-align: center;
		
	}
	.info-box{
		width: 100%;
		padding-top: 5px;
		padding-bottom: 4px;
		outline: 2.5px solid #000;
  		border-radius: 5px;
	}
	.info-empty{
		height: 20px;
	}
	#logout-button{
		display: inline-block;
		font-size: 1.0em;
		
	    padding-top: 10px;
	    padding-bottom: 10px;
		width: 150px;
		text-decoration: none;
	    text-align: center;
		border-radius: 8px;
	    border: 2.5px solid #000;
	    color: #fff;
	    background-color: #000; 
	}
	.container{
		display: flax;
		width: 100%;
	}

	#delete-user{
		
	}
</style>
</head>
<body>

	<header>
		<h2 class="title">내 정보</h2>
		<%@include file="topNavi.html"%>
	</header>
	<section >
		<div align="center" class="container">
			<table align="center">
				<tr>
					<td class = "info-table-line1">별명</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">
					<%
						for (UserObj user : list) {
							out.print(user.getName()); 
					%>
					</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>					
					<td class = "info-table-line1">아이디</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">
					<% out.print(user.getEmail()); %>
					</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>
					<td class = "info-table-line1">보유 코인</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">
					<% 	
						out.print(user.getCoin());
						}
					%>
					</div></td>
				</tr>
			</table>
			
			<a id="logout-button" href="../jsp/logout.jsp">로그아웃</a><br>
			<a id="delete-user" href="selfDel.jsp">계정 삭제</a>
		</div>
	</section>
	<footer align="center"><%@include file="footer.html"%></footer>
</body>
</html>
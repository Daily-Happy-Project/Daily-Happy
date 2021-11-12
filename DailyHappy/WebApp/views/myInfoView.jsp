<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="main.UserDAO"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String uname = 
	String uid = 
	String ucoin = 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 정보</title>

<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>

<style>
	table{
		margin-top: 30px;
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
	#info-logo{
		display: inline-block;
	    margin-top: 40px;
	    margin-bottom: 20px;
	    width:80px;
	    height:80px;
	    background-color: aqua;
	}
</style>
</head>
<body>

	<header>
		<h2 class="title">내 정보</h2>
		<div class="x-button">x</div>
		<hr class = "dotted-line1">
	</header>
	<section>
		<article align="center">
			<table align="center">
				<tr>
					<td class = "info-table-line1">별명</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">#별명 db</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>					
					<td class = "info-table-line1">아이디</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">#아이디 db</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>
					<td class = "info-table-line1">보유 코인</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">#보유 코인 db</div></td>
				</tr>
			</table>
			<div id="info-logo">로고</div><br>
			<div id="logout-button">로그아웃</div>
		</article>
	</section>
</body>
</html>
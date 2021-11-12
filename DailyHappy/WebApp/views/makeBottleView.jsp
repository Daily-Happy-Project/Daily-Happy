<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dao.UserDAO"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	/* String uname = 
	String uid = 
	String ucoin =  */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>새 유리병 만들기</title>

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
		<h2 class="title">새 유리병 만들기</h2>
		<div class="x-button">x</div>
		<hr class = "dotted-line1">
	</header>
	<section>
		<article align="center">
			<form>
			<table align="center">
				<tr>
					<td class = "info-table-line1">이름</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box"><input type="text" name="bname"/></div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>					
					<td class = "info-table-line1">병 모양</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">#유리병 이미지 선택</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>
					<td class = "info-table-line1">도안</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box">#보유 코인 db</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
				<tr>
					<td class = "info-table-line1">목표치</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "info-table-line2"><div class = "info-box"><input type="number" min="1" max="365"></div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "info-empty"></div></td>
				</tr>
			</table>
			<div id="logout-button">로그아웃</div>
			</form>
		</article>
	</section>
</body>
</html>
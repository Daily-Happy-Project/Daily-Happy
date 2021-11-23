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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 유리병 만들기</title>

<style>
	table{
		margin-top: 30px;
		color: #9D9D9D;
	}
	.table-line1{
		text-align: right;
	}
	.table-line2{
		width: 150px;
		text-align: center;
		
	}
	.box{
		width: 100%;
		padding-top: 5px;
		padding-bottom: 4px;
		outline: 2.5px solid #9D9D9D;
  		border-radius: 5px;
  		overflow: scroll;
  		white-space:nowrap;
	}
	.empty{
		height: 20px;
	}
	#submit-button{
	font-size: 1.0em;
    display: inline-block;
	margin: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
	width: 150px;
	text-decoration: none;
    text-align: center;
	border-radius: 4px;
    border: 0px;
    color: #ffffff;
    background-color: #9D9D9D;
	}

</style>
</head>
<body>
	<header>
	    <h2 class="title">새 유리병 만들기</h2>
		<%@include file="topNavi.html"%>
	</header>
	<section>
		<article align="center">
			<form>
			<table align="center">
				<tr>
					<td class = "table-line1">병 이름</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "table-line2"><div class = "box"><input type="text" name="Jname"/></div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "empty"></div></td>
				</tr>
				<tr>					
					<td class = "table-line1">모양</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "table-line2">
						<div class = "box">
							#유리병 이미지 선택
<%
						String jarstr = "";
						for( : ){
							
						}
%>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3"><div class = "empty"></div></td>
				</tr>
				<tr>
					<td class = "table-line1">도안</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "table-line2"><div class = "box">#보유 코인 db</div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "empty"></div></td>
				</tr>
				<tr>
					<td class = "table-line1">목표치</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "table-line2"><div class = "box"><input type="number" min="1" max="365"></div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "empty"></div></td>
				</tr>
			</table>
			<input type="submit" value="만들자!" id="submit-button"></div>
			</form>
		</article>
	</section>
</body>
</html>
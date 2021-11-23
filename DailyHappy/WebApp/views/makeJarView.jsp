<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}
	session.setAttribute("email", uemail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 유리병 만들기</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
  		overflow: auto;
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

	input[type=checkbox] {
    display:none;
	}

label
{
    height: 100%;
    width: 50px;
    display:inline-block;
    padding: 0 0 0 0px;
}
label img{
	width: 100%;
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
			<form method="post" action="test.jsp">
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
<%
						ArrayList<UserItemObj> list = (new UserItemDAO()).getUserItemList(uemail, "jar");
						String jarstr = "";
						String script = "<script type=\"text/javascript\">";
						for(UserItemObj uItem : list ){
							int code = uItem.getItemCode();
							String name = uItem.getItemName();
							String img = uItem.getImg();
							jarstr += "<label id=\"l"+ code +"\" for=\"no"+code+"\">";
							jarstr += "<input type=\"checkbox\" class=\"chkImg\" id=\"no"+ code +"\" name=\"Jshape\" value=\""+ name + "\">";
							jarstr += "<img src=\""+ img +"\"</label>";
							//script += "$(function(){$(\".no"+uItem.getItemCode()+"\").css({"+"\"background\": \"url(\'" + uItem.getImg() + "\') no-repeat\"}); });";
						}
						out.print(jarstr);
						script += "</script>";
						out.print(script);
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
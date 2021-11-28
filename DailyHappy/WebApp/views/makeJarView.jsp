
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

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

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
		padding: 5px 5px 5px 5px;
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


	input[type=radio] {
    display:none;
	}
	
	:checked + label:before{
	 border: 5px solid #bcbcbc;
	 width: 100%;
	 height: 100%;
	 background-color: #9D9D9D;
	}

label
{
    height: 100%;
    width: 50px;
    padding: 0 0 0 0;
    display: inline-block;
	cursor: pointer;
}
.l1{
	float: left;
}

label img{
	width: 100%;
}

</style>

</head>
<body>
	<header>
	    <h2 class="title">새 유리병 만들기</h2>
		<%@include file="header.html"%>
	</header>
	<section>
		<article align="center">

			<form method="post" action="../jsp/newJar.jsp">
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
						ArrayList<UserItemObj> jList = (new UserItemDAO()).getUserItemList(uemail, "jar");
						String jarstr = "";
						String script = "<script type=\"text/javascript\">";
						int cnt = 0;
						for(UserItemObj uItem : jList ){
							cnt++;
							int jarCode = uItem.getItemCode();
							String name = uItem.getItemName();
							String img = uItem.getImg();
							jarstr += "<label class=\"l"+ cnt +"\" for=\"no"+ cnt +"\">";
							jarstr += "<input type=\"radio\" class=\"chkImg\" id=\"no"+ cnt +"\" name=\"jarCode\" value=\""+ jarCode + "\">";
							jarstr += "<img src=\""+ img +"\"</label>";
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
					<td class = "table-line2">
						<div class = "box">
<%
						ArrayList<UserItemObj> pList = (new UserItemDAO()).getUserItemList(uemail, "foldMethod");
						String pstr = "";
						script = "<script type=\"text/javascript\">";
						cnt = 0;
						for(UserItemObj uItem : pList ){
							cnt++;
							String name = uItem.getItemName();
							String img = uItem.getImg();
							pstr += "<label class=\"l"+ cnt +"\" for=\"no-"+cnt +"\">";
							pstr += "<input type=\"radio\" class=\"chkImg\" id=\"no-"+ cnt +"\" name=\"Pshape\" value=\""+ name + "\">";
							pstr += "<img src=\""+ img +"\"</label>";
							//script += "$(function(){$(\".no"+uItem.getItemCode()+"\").css({"+"\"background\": \"url(\'" + uItem.getImg() + "\') no-repeat\"}); });";
						}
						out.print(pstr);
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
					<td class = "table-line1">목표치</td>
					<td>&nbsp;&nbsp;</td>
					<td class = "table-line2"><div class = "box"><input type="number" name="GoalNum" min="1" max="365"></div></td>
				</tr>
				<tr>
					<td colspan="3"><div class = "empty"></div></td>
				</tr>
			</table>
			<input type="submit" value="만들자!" id="submit-button"></div>
			</form>
		</article>
	</section>
	
	<script type="text/javascript">
	$(function(){
		$('#no1').prop('checked',true);
		$('#no-1').prop('checked',true);
	});
	</script>
</body>
</html>
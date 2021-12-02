<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>

<%

	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상점</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
@font-face {
    font-family: 'Uiyeun';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{
		background-color: #FFC7C7;
		margin-bottom: 90px;
	}
	p{
		font-family: 'Uiyeun';
		font-size: 4vh;
		outline: 2.5px solid #ffffff;
  		border-radius: 15px;
  		padding: 5px 0px 5px 0px;
  		margin-left: 15px;
  		width: 40%;
  		background-color: #ffffff;
  		text-align: center;
	}
	form{
		font-family: 'Uiyeun';
		font-size: 4vh;
	}
	table{
		margin-top: 1px;
		width: 100%;
		padding: 10px 10px 10px 10px;
		outline: 2.5px solid #9D9D9D;
  		border-radius: 5px;
  		overflow: auto;
  		white-space:nowrap;
  		display: inline-block;
  		background-color:#ffffff;
	}
	.itemImg{
	    width: 30%;
	    height: 100%
	    border: 5px 5px 5px 5px;
	    padding: 5px 5px 5px 5px;
	}
	.itmImg{
		width:100%;
		height:100%;
	}
	.name {
		height: 70%;
	    width: 40px;
	    padding: 5px 5px 5px 5px;
	    text-align:left;
	}
	.price {
		height: 15px;
	    width: 80px;
	    color: #9D9D9D;
	    text-align:center;
	    outline: 2.5px solid #9D9D9D;
  		border-radius: 10px;
  		background-
	}
	.info {
		height: 70%;
	    width: 50px;
	    padding: 5px 5px 5px 5px;
	    text-align:left;
	    color: #9b9b9b;
	}

</style>

</head>
<body>
	<header>
	    <h2 class="title">상점</h2>
		<%@include file="header.html"%>
		<%
			String email = (String)session.getAttribute("email");
			int coin = new UserItemDAO().userCoin(email);
			String st = "<p>보유 코인 :  " + coin + " 코인</p>";
			out.print(st);
		%>
		
	</header>
	<section>
		<article align="center">
			<form method="post" action="../jsp/newJar.jsp">
			<%
			
				ArrayList<ItemObj> paperList = (new ItemDAO()).getItemList("paper");
				String str = "";
				String script = "<script type=\"text/javascript\">";
				for(ItemObj item : paperList ){
					int itemCode = item.getItemCode();
					String itemName = item.getItemName();
					int price = item.getPrice();
					String info = item.getInfo();
					String img1 = item.getImg1();
					
					str += "<table align=\"center\">";
					str += "<tr><td class=\"itemImg\" rowspan=3 width=\"40%\">";
					str += "<img class=\"itmImg\" src=\"" + img1 + "\"></td>";
					str += "<td><div class=\"name\">" + itemName + "</div></td>";
					str += "<td class=\"price\">" + price + " 코인</td></tr>";
					str += "<td colspan=2><hr></td>";
					str += "<tr><td class=\"info\" colspan=2>" + info + "</td></tr>";
					str += "</tr></table>";
					out.print(str);
					}
				script += "</script>";
				out.print(script);
			%>
			</form>
		</article>
	</section>
	
<!-- 	<script type="text/javascript">
	$(function(){
		$('#no1').prop('checked',true);
		$('#no-1').prop('checked',true);
	});
	</script> -->
    <footer align="center"><%@include file="footer.html"%></footer>
    <nav><%@include file="bottomNavi.html"%></nav>
</body>
</html>
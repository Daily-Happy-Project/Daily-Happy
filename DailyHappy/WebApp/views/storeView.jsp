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
		return;
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);

%>
<%
	String email = (String)session.getAttribute("email");
	int coin = new UserItemDAO().userCoin(email);
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
	margin: 0;
}
header{
	display: flex;
	flex-direction: column;
	height: 25vh;
	width: 100vw;
	font-family: 'Uiyeun';
	font-size: 4vh;
}
section{
	height: 66vh;
	width: 100vw;
	font-family: 'Uiyeun';
	font-size: 4vh;
}
hr{
	margin: 0;
	padding: 0;
	padding-bottom: 5px;
	border: none;
	border-top: 1.5px solid #000;
}

.blank{
	height: 10px;
}
.container{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 0px;
	height: 91vh;
	width: 100vw;
}
.item-section{
	margin: 0 auto;
	width: 100vw;
	height: 100%;
	max-width: 500px;
	overflow: auto;
}
.item-table{
	width: 95%;
	height: 100%;
	margin: 10px 0;
	padding: 10px 5px;
	white-space:nowrap;
	display: inline-block;
	border-collapse:collapse;
}
.item-wrap{
	width: 100%;
	margin: 0px;
	outline: 2.5px solid #000;
	border-radius: 5px;
	background-color: #fff;

}
.itemImg{
    width: 30%;
    padding-left: 5px;
    vertical-align: middle;
}
.itmImg{
	width:100%;
	height:100%;
}
.item-info-wrap{
	display: flex;
	width: 90%;
	height: 100%;
	flex-direction: column;
	position: relative;
	vertical-align: top;
	text-align:left;
	padding: 10px;
}
.item-name {
    vertical-align: top;
}
.info {
	height: 70%;
    width: 50px;
    text-align:left;
    color: #9b9b9b;
}

#mycoin{
	border-radius: 15px;
	padding: 3px 0px;
	width: 40vw;
	max-width: 200px;
	background-color: #ffffff;
	text-align: center;
	margin-top:auto;
	margin-left: 10px;
}



.price{
    width: 10vw;
    min-width: 100px;
    color: #000;
    text-align:center;
    outline: 2.5px solid #000;
    background-color: ;
 	border-radius: 5px;
	margin: auto 0 0 auto;
}
#select-section{
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	font-family: 'Uiyeun';
	font-size: 4vh;
	margin-top:10px;

}
#select-section div{
	width:25vw;
	height: 5vh;
	border-radius: 0px 10px 0px 0px;
	cursor: pointer;
}

	

.t-bgcolor{
	background-color: #FFAAA7;
}
.p-bgcolor{
	background-color: #FFD3B4;
}
.j-bgcolor{
	background-color: #D5ECC2;
}
.f-bgcolor{
	background-color: #98DDCA;
}
.hide{
	display: none;
}
</style>

</head>
<body>
	<div class="container" align = "center">
	<header>

		<div id="mycoin">보유 코인 : <%= coin %></div>

		<div id="select-section">
			<div class="t-bgcolor" onclick="Select(this)">테마</div>
			<div class="p-bgcolor" onclick="Select(this)">학종이</div>
			<div class="j-bgcolor" onclick="Select(this)">유리병</div>
			<div class="f-bgcolor" onclick="Select(this)">도안</div>
		</div>
	</header>
	<nav>
		<%@include file="bottomNavi.html"%>
	</nav>
	<section class="p-bgcolor">
	
		<article class = "item-section p-bgcolor" align="center">
			<%
			
				ArrayList<ItemObj> paperList = (new ItemDAO()).getItemList("paper");
				String str = "";
				str += "<table class=\"item-table\" align=\"center\">";
				for(ItemObj item : paperList ){
					int itemCode = item.getItemCode();
					String itemName = item.getItemName();
					int price = item.getPrice();
					String info = item.getInfo();
					String img1 = item.getImg1();
					str += "<tr class=\"item-wrap\"><td class=\"itemImg\">";
					str += "<img class=\"itmImg\" src=\"" + img1 + "\"></td>";
					str += "<td class=\"item-info-wrap\"><div class=\"item-name\">" + itemName + "</div>";
					str += "<hr>";
					str += "<div class=\"item-info\">"+info+"</div>";
					str += "<div class=\"price\">" + price + " 코인</div>";

					str += "</td></tr>";
					str += "<tr><td><div class=\"blank\"></div></td></tr>";
					//str += "<tr><td class=\"info\" colspan=2>" + info + "</td></tr>";
					}
				str += "</table>";
				out.print(str);
			%>
		</article>
		<article class = "item-section j-bgcolor" align="center">
			<%
				ArrayList<ItemObj> jarList = (new ItemDAO()).getItemList("jar");
				str = "";
				str += "<table class=\"item-table\" align=\"center\">";
				for(ItemObj item : jarList ){
					int itemCode = item.getItemCode();
					String itemName = item.getItemName();
					int price = item.getPrice();
					String info = item.getInfo();
					String img1 = item.getImg1();
					str += "<tr class=\"item-wrap\"><td class=\"itemImg\">";
					str += "<img class=\"itmImg\" src=\"" + img1 + "\"></td>";
					str += "<td class=\"item-info-wrap\"><div class=\"item-name\">" + itemName + "</div>";
					str += "<hr>";
					str += "<div class=\"item-info\">"+info+"</div>";
					str += "<div class=\"price\">" + price + " 코인</div>";

					str += "</td></tr>";
					str += "<tr><td><div class=\"blank\"></div></td></tr>";
					//str += "<tr><td class=\"info\" colspan=2>" + info + "</td></tr>";
					}
				str += "</table>";
				out.print(str);
			%>
		</article>
		<article class = "item-section f-bgcolor" align="center">
			<%
				ArrayList<ItemObj> foldList = (new ItemDAO()).getItemList("foldMethod");
				str = "";
				str += "<table class=\"item-table\" align=\"center\">";
				for(ItemObj item : foldList ){
					int itemCode = item.getItemCode();
					String itemName = item.getItemName();
					int price = item.getPrice();
					String info = item.getInfo();
					String img1 = item.getImg1();
					str += "<tr class=\"item-wrap\"><td class=\"itemImg\">";
					str += "<img class=\"itmImg\" src=\"" + img1 + "\"></td>";
					str += "<td class=\"item-info-wrap\"><div class=\"item-name\">" + itemName + "</div>";
					str += "<hr>";
					str += "<div class=\"item-info\">"+info+"</div>";
					str += "<div class=\"price\">" + price + " 코인</div>";

					str += "</td></tr>";
					str += "<tr><td><div class=\"blank\"></div></td></tr>";
					//str += "<tr><td class=\"info\" colspan=2>" + info + "</td></tr>";
					}
				str += "</table>";
				out.print(str);
			%>
		</article>
	</section>
    <footer align="center"></footer>
    <%@include file="bgStyle.jsp"%>
	</div>
	
	<script type="text/javascript">
		function Select(gap){
			var select = '.'+$(gap).attr('class');
			$('.item-section').addClass('hide');
			$(select).removeClass('hide');
		}
	</script>
</body>
</html>
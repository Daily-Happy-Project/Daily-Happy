<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>작성글 확인</title>
<style type="text/css">
	article{
		position: absolute;
		top: 8em;
		width: 100%;
		display: flex;
	}
	#wrap{
		width: 90%;
		max-width: 300px;
		min-width: 200px; 
		margin: 0 auto;
		padding-bottom: 4em;
		z-index: 2;
	}	
	#p-text-wrap{
		width: 100%;
		margin: 50px auto;
    	word-break:break-all;
    	background-image: url('../resources/images/gra-paper-y.png');
    	-webkit-background-size: contain;
	   	-moz-background-size: contain;
	   	-o-background-size: contain;
		background-size: 100%;
		background-position: contain;
		background-repeat: no-repeat;
		box-shadow: 8px -8px 0 0 rgba(94,96,115,0.3);
    }
	.text{
		font-size: 16pt;
		resize: none;
		border: none;
	 	background-color: transparent;
		width: 90%;
		height: 90%;
	}
	
</style>
</head>




<body>
	<%@include file="bottomNavi.html"%>
	<%
    String email=(String)session.getAttribute("email");
	email = new UserDAO().splitemail(email);
	String jarName=(String)session.getAttribute("nowJar");
	WritingDAO dao = new WritingDAO();    	
	%>
	
	
	<header>
	    <h2 class="title">작성 글 확인</h2>    
		<%@include file="header.html"%>
	</header>
		
	
	<article align="center">
	<div id="wrap">
		<div id="p-text-wrap">	
		<%
			ArrayList<WritingObj> wObj = dao.content(email, jarName);
			String str="";
			for(WritingObj obj : wObj){
				String content = obj.getContent();
				Timestamp stamp = obj.getTs();
				int paperCode = obj.getPaperCode();
				String name = new UserDAO().getName((String)session.getAttribute("email"));
				str+="<div class=\"writing\">";
				/* str+="<p class=\"text\">" + content + "</p>";
				str+="<div class=\"text\" </div>" + "작성자 : " + email;
				str+="<div class=\"text\" </div>" + "작성시간 : " + stamp; */
				
				str+="<textarea class=\"text\" rows=\"8\" cols=\"12\" placeholder=\"" + content + "\" disabled></textarea>";
				str+="<textarea class=\"text\" rows=\"1\" cols=\"12\" placeholder=\"작성자 : " + name + "\" disabled></textarea>";
				str+="<textarea class=\"text\" rows=\"1\" cols=\"12\" placeholder=\"작성시간 : " + stamp + "\" disabled></textarea>";

				str+="</div>";
				out.print(str); }
		%>
		</div>	
	</div>
	</article>
	
	
	</div>
</body>
</html>
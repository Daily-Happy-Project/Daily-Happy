<<<<<<< HEAD
<%@page import="java.sql.Timestamp"%>
=======
>>>>>>> main
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<<<<<<< HEAD
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
	#submit{
		font-family: 'Uiyeun';
		font-size: 2.5vh;
		color: #000;
		text-align: center;
		border: none;
		background-color:#FFC7C7; 
		border-radius: 8px;
		margin-top: 5vh;
		margin-left: 1vh;
		width: 100px;
		height: 50px;
		box-shadow: 6px -7px 0 0 rgba(94,96,115,0.3);
	}
	#delete{
		font-family: 'Uiyeun';
		font-size: 2.5vh;
		color: #000;
		text-align: center;
		border: none;
		background-color:#D8D8D8; 
		border-radius: 8px;
		margin-top: 5vh; 
		width: 100px;
		height: 50px;
		box-shadow: 6px -7px 0 0 rgba(94,96,115,0.3);
	}
	/* #p-submit:hover{
		background-color:#c33837;
		color: #fff;
		
	} */
	
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
		<form method="post" action="../jsp/writingDel.jsp">	
			<div id="p-text-wrap">
				<%
					ArrayList<WritingObj> wObj = dao.content(email, jarName);
					String str="";
					for(WritingObj obj : wObj){
						String content = obj.getContent();
						Timestamp stamp = obj.getTs();
						int paperCode = obj.getPaperCode();
						int no = obj.getNo();
						session.setAttribute("no", no);
						String name = new UserDAO().getName((String)session.getAttribute("email"));
						str+="<div class=\"writing\">";
						
						str+="<textarea class=\"text\" rows=\"8\" cols=\"12\" placeholder=\"" + content + "\" disabled></textarea>";
						str+="<textarea class=\"text\" name=\"no\" rows=\"1\" cols=\"12\" placeholder=\"글번호 : " + no + "\" disabled></textarea>";
						str+="<textarea class=\"text\" rows=\"1\" cols=\"12\" placeholder=\"작성자 : " + name + "\" disabled></textarea>";
						str+="<textarea class=\"text\" rows=\"1\" cols=\"12\" placeholder=\"작성시간 : " + stamp + "\" disabled></textarea>";
		
						str+="</div>";
						out.print(str); }
				%>
			</div>
		<input id="submit" type="button" value="공유">
			<a id="btnTwitter" href="javascript:shareTwitter();">트위터</a> <!-- 이미지 추가해야됨(인스타, 카카오톡, 페이스북) -->
		<input id="delete" type="submit" value="글 삭제">;
	</form>
	</div>
	</article>
	</div>
	
	<script>
	function shareTwitter() {
	    var sendText = "하루, 행복 공유";
	    var sendUrl = "dailyhappy.kro.kr"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	</script>
		
</body>
</html>
=======

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail=request.getParameter("email");
	String ujarName=(String)session.getAttribute("nowJar");
	
	ResultSet rs = new WritingDAO().content(uemail, ujarName);
	
	String str="";
	while(rs.next()){
		str+="<div class=\"writing\">";
		str+="<div class=\"contnet" + rs.getString("content") + "</div>";
		str+="<div class=\"name" + rs.getString("name") + "</div>";
		str+="<div class=\"ts" + rs.getString("ts") + "</div>";
				
		str+="</div>";
		
	}	
	
%>

<%-- <%

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
		%> --%>

>>>>>>> main

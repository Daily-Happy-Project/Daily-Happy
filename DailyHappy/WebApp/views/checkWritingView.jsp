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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>작성글 확인</title>
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

.container{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 91vh;

}
	#wrap{
		width: 60vw;
		max-width: 300px;
		margin: 0 auto;
		z-index: 5;
		margin-top: 10vh;
		margin-bottom: 10vh;
	}	
	#p-text-wrap{
		height: 60vw;
		max-height: 300px;
		margin: 0 auto;
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
		font-family: 'Uiyeun';
		color: #000;
		text-align: center;
		resize: none;
		border: none;
	 	background-color: transparent;
		width: 90%;
		height: 90%;
	}
	.other-t{
		font-size: 4vh;
	}
	#content{
		font-size: 6vh;
	}
	#submit, #delete{
		font-family: 'Uiyeun';
		font-size: 5vh;
		color: #000;
		text-align: center;
		border: none;
		border-radius: 8px;
		margin-top: 5vh;
		margin-right: 5vh;
		margin-left: 5vh;
		width: 100px;
		height: 50px;
		box-shadow: 6px -7px 0 0 rgba(94,96,115,0.3);
	}
	#submit{
		background-color:#FFC7C7; 
	}
	#delete{
		background-color:#D8D8D8; 
	}
	#buttons{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	/* #p-submit:hover{
		background-color:#c33837;
		color: #fff;
		
	} */
	
</style>
</head>




<body>
<div class="container">
	<%@include file="bottomNavi.html"%>
	<%
    String email=(String)session.getAttribute("email");
	email = new UserDAO().splitemail(email);
	String jarName=request.getParameter("nowjar");
	WritingDAO dao = new WritingDAO();    	
	%>
		
	
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
						
						str+="<textarea class=\"text\" id=\"content\" rows=\"4\" cols=\"12\">"+content+"</textarea>";
						str+="<textarea class=\"text other-t\" name=\"no\" rows=\"1\" cols=\"12\"  hidden>글번호: "+no+"</textarea>";
						str+="<textarea class=\"text other-t\" rows=\"1\" cols=\"12\">작성자: " + name + "</textarea>";
						str+="<textarea class=\"text other-t\" rows=\"1\" cols=\"12\">작성일: " + stamp + "</textarea>";
		
						str+="</div>";
						out.print(str); 
						
						ItemDAO iDao = new ItemDAO();
						String imgurl = iDao.getItemImg(paperCode);
						str = "<script type=\"text/javascript\">";
						str += "$(function(){";
						str += "$('#p-text-wrap').css({\"background-image\": \"url("+imgurl+")\"});";
						str += "})";
						str += "</script>";
						out.print(str);
					}
					
					
					
				%>
			</div>
			<div id="buttons">
			<input id="submit" type="button" value="공유">
			<!-- <a id="btnTwitter" href="javascript:shareTwitter();">트위터</a> 이미지 추가해야됨(인스타, 카카오톡, 페이스북)
		 --><input id="delete" type="submit" value="글 삭제">;
			</div>
		
	</form>
	</div>
	</article>
	</div>
	</div>
	<%@include file="bgStyle.jsp"%>
	<script>
	function shareTwitter() {
	    var sendText = "하루, 행복 공유";
	    var sendUrl = "dailyhappy.kro.kr"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	</script>
		
</body>
</html>
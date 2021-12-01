<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
    
<%

/* 	String email = (String)session.getAttribute("email");
	email = new UserDAO().splitemail(email);
	String paperimg = new UserItemDAO().randomPaper(email);  */

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>종이 접기</title>

<style>
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
		height: 100vh;
		background-color: #FFC7C7;
	}
	.skip {
		position : fixed;
		top : 20px;
		right: 0%;	
		width : 80px;
		height: 30px;
		background-color: #FAAEAE;
	}
	
	.foldImg{
		width : 80vw;
		max-width: 300px;
	}
	.foldImg img{
		width: 100%;
		height: 100%;
	}
	.hideImg{
		display: none;
	}

</style>
</head>
<body>
	<section class = "container" align="center">
		<div class="skip"><a href="mainView.jsp">건너뛰기</a></div>
		<div class="foldImg">
		<img id="fold-Img1" src="../resources/images/folding1.png">
		</div>
		<div class="foldImg">
		<img id="fold-Img2" class="hideImg" src="../resources/images/folding2.png">
		</div>
		<div class="foldImg">
		<img id="fold-Img3" class="hideImg" src="../resources/images/folding3.png">
		</div>
		<div class="foldImg">
		<img id="fold-Img4" class="hideImg" src="../resources/images/folding4.png">
		</div>
		<div class="f-text">학종이를 터치!</div>	
	</section>
	<script type="text/javascript">
		var cnt = 1;
		
		
		
	</script>
	
	
	
</body>
</html>


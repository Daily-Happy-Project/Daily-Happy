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
	#skip {
		position : fixed;
		top : 10vh;
		right: 0%;	
		width : 80px;
		height: 5vh;
		background-color: #AAAAAA;
		text-align: center;
		font-family: 'Uiyeun';
		font-size: 5vh;
	}
	a{
		text-decoration: none;
		color: inherit;
	}
	.foldImg{
		width : 80vw;
		max-width: 300px;
		cursor: pointer;
	}
	.foldImg img{
		width: 100%;
		height: 100%;
	}
	.hideImg{
		display: none;
	}
	#f-text{
		margin-top: 6vh;
		font-family: 'Uiyeun';
		font-size: 6vh;
		color: #fff;
		-webkit-text-stroke: 1px #000;
	}

</style>
</head>
<body>
	<section class = "container" align="center">
		<div id="skip"><a href="mainView.jsp">건너뛰기</a></div>
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
		<div id="f-text">학종이를 터치!</div>	
	</section>
	<script type="text/javascript">
		var cnt = 1;
		$('.foldImg').click(function() {
			if(cnt==4){
				location.href = "mainView.jsp";
			}
			var id = "#fold-Img"+cnt;
			$(id).fadeOut(500, function(){
			    $(id).addClass('hideImg');
			    cnt++;
			    if(cnt==4){
			    	$('#f-text').text('완성!');
			    }
			    id = "#fold-Img"+cnt;
			    $(id).removeClass('hideImg');
			    $(id).fadeOut(0);
			    $(id).fadeIn(500)
			});

		 })
		
	</script>
	
	
	
</body>
</html>


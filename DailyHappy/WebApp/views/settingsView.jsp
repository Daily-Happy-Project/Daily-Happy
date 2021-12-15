<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}

	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);
%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>환경설정</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        
       <!-- <script src="soundOnOff.js"></script> -->
        <link rel="stylesheet" href="css/headerStyle.css"/>
        <style type="text/css">
        	@font-face {
			    font-family: 'Uiyeun';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			body{
			background-color: #FFf;
			margin: 0;
			width: 100vw;
			height: 100vh;
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
			.wrap {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				font-family: 'Uiyeun';
				font-size: 4vh;
				overflow: auto;

			}
        	.box:visited{
        		color: #000000;
        	}
            .button-container{
                display: inline-block;
                width: 100%;
                max-width: 500px;
                margin-top: 30vh;
                text-align: center;
            }
            .box{
            	display: inline-block;
                width: 60vw;
                max-width: 400px;
                padding-top: 10px;
                padding-bottom: 10px;
                margin-bottom: 25px;
                outline: 2.5px solid #000;
                border-radius: 8px;
                font-family: 'Uiyeun';
				font-size: 4vh;
				color: #000;
				text-align: center;
            }
            .hide{
            	display: none;
            }
            a:link {color: black; text-decoration: none;}
            #on, #off{
            	cursor: pointer;
            }
        </style>
    </head>
    <body>
    <div class="container">
        <%@ include file="soundOnOff.jsp" %>
        <header>
            <h2 class="title">환경설정</h2>
		<%@include file="header.html"%>
        </header>
        <nav><%@include file="bottomNavi.html"%></nav>
        <div class="wrap">
        <section align="center">
           <div class="button-container">
                <article class="box">
                    <span>♫소리♫</span>
                    <!--<audio loop id="audio" src="../resources/media/bensound-memories.mp3"></audio> -->
                   	<span id="on" onclick="on()">◀</span><span>on/off</span><span id="off" type="button" onclick="off()">▶</span>
                </article>            
                <article class="box">
                    <span>글자크기</span>
                    <a>◀</a><span>보통</span><a>▶</a>    <!--작게 보통 크게 아주크게-->
                </article>
                <article>
                    <a class="box" href="helpView.jsp">도움말</a>
                </article>
                <article>
                    <a class="box" href="dInfoView.jsp">개발자 정보</a>
                </article>
                <article>
                    <a class="box" href="copyrightView.jsp">라이선스</a>
                </article>
                <article>
                    <a class="box" id="uM" href="uManageView.jsp">회원 관리</a>
                </article>
            </div>
        </section>
        <footer align="center"><%@include file="footer.html"%></footer>
        </div>
    </div>

        <script>
            //소리 켜기/끄기
			//soundOnOff.jsp
			//var audio=document.getElementById("audio");
            //폰트 크기
            $(function(){
            	var member = '<%=umember%>';
            	if(member=='M'){
            		$('#uM').addClass('hide');
            	}
            });
            
        </script>
    </body>
</html>
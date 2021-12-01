<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<<<<<<< HEAD

=======
>>>>>>> main
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>환경설정</title>
        
<<<<<<< HEAD
       <!-- <script src="soundOnOff.js"></script> -->
=======
>>>>>>> main
        <link rel="stylesheet" href="css/headerStyle.css"/>
        <style type="text/css">
        	.box:visited{
        		color: #000000;
        	}
            .button-container{
                display: inline-block;
                width: 200px;
                margin-top: 30px;
                text-align: center;
            }
            .box{
            	display: inline-block;
                width: 100%;
                padding-top: 10px;
                padding-bottom: 10px;
                margin-bottom: 25px;
 
                outline: 2.5px solid #000;
                border-radius: 8px;
                
            }
            
            a:link {color: black; text-decoration: none;}
            
        </style>
    </head>
    <body>
<<<<<<< HEAD
    <%@ include file="soundOnOff.jsp" %>
        <header>
            <h2 class="title">환경설정</h2>
		<%@include file="header.html"%>
        </header>
        <nav><%@include file="bottomNavi.html"%></nav>
=======
        <header>
            <h2 class="title">환경설정</h2>
		<%@include file="topNavi.html"%>
        </header>
>>>>>>> main
        <section align="center">
           <div class="button-container">
                <article class="box">
                    <span>♫소리♫</span>
<<<<<<< HEAD
                    <!--<audio loop id="audio" src="../resources/media/bensound-memories.mp3"></audio> -->
                   	<button id="on" type="button" onclick="on()">◀</button><span>on/off</span><button id="off" type="button" onclick="off()">▶</button>
=======
                    <a>◀</a><span>켜기</span><a>▶</a>
>>>>>>> main
                </article>            
                <article class="box">
                    <span>글자크기</span>
                    <a>◀</a><span>보통</span><a>▶</a>    <!--작게 보통 크게 아주크게-->
                </article>
                <article>
<<<<<<< HEAD
                    <a class="box" href="helpView.jsp">도움말</a>
                </article>
                <article>
                    <a class="box" href="dInfoView.jsp">개발자 정보</a>
                </article>
                <article>
                    <a class="box" href="copyrightView.jsp">저작권 정보</a>
                </article>
                <article>
                    <a class="box" href="uManageView.jsp">회원 관리</a>
=======
                    <a class="box" href="helpView.html"><div>도움말</div></a>
                </article>
                <article>
                    <a class="box" href="dInfoView.html"><div>개발자 정보</div></a>
                </article>
                <article>
                    <a class="box" href="copyrightView.html"><div>저작권 정보</div></a>
                </article>
                <article>
                    <a class="box" href="uManageView.jsp"><div>회원 관리</div></a>
>>>>>>> main
                </article>
            </div>
        </section>
        <footer align="center"><%@include file="footer.html"%></footer>
        <script>
            //소리 켜기/끄기
<<<<<<< HEAD
			//soundOnOff.jsp
			//var audio=document.getElementById("audio");
=======
>>>>>>> main
            //폰트 크기
        </script>
    </body>
</html>
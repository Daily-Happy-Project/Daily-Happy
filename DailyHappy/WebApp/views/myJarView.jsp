<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>하루, 행복 - 내 유리병 관리</title>
        
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
        <header>
            <h2 class="title">내 유리병 관리</h2>
		<%@include file="header.html"%>
        </header>
        <nav><%@include file="bottomNavi.html"%></nav>
        <section align="center">
           <div class="button-container">
                <article>
                    <a class="box" href="makeJarView.jsp"><div>새로 만들기</div></a>
                </article>
                <!-- 유저 유리병 이름 목록 토글 바 형태로 출력. 선택 시 각 유리병 세부 내역 확인 및 수정, 삭제 가능 페이지로 이동 -->
                <article>

                </article>
            </div>
        </section>
        <footer align="center"><%@include file="footer.html"%></footer>
        <script>
            //소리 켜기/끄기
            //폰트 크기
        </script>
    </body>
</html>
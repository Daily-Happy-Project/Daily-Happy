<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>도움말</title>
        
        <!--<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>  -->
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
				position: absolute;
				top: 0px;
				right: 0px;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				height: 91vh;
				width: 100vw;
				background-color: #FFC7C7;
			}
			#padding-wrap{
				margin: 0;
				padding-bottom: 2vh;
			}

			.wrap {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				font-family: 'Uiyeun';
				font-size: 4vh;
			}
            #slide-container{
				width: 60vw;
				height: 100%;
				max-width: 300px;
            }
            
            #prev, #next{
            	font-size: 5vh;
            	cursor: pointer;
            }
            #prev{
            	margin-right:2vw;
            }
            #next{
            	margin-left:2vw;
            }
            #h-arrow-wrap{
            	width: 100vw;
            	display: flex;
				flex-direction: row;
				justify-content: center;
				align-items: center;
				z-index: 9;
				padding-top: 2vh;
				padding-bottom: 2vh;
            }
            .help-titles{
                display: none;
                margin: 0 auto;
            }
            /*image default hide*/
            .help-slides{
                display: none;
                width: 100%;
                
            }
            .help-slides img{
            	width: 100%;
            }
            /*text default hide*/
            .help-texts{
                display: none;
                text-align: left;
            }

            .help-container{
                display: inline-block;
                outline: 2.5px solid #000;
                border-radius: 8px;
                width: 80vw;
                height: 20vh;
                overflow: auto;
                padding: 2vh;
            }

            
            @media screen and (min-width: 400px) {
				.help-container{
	                display: inline-block;
	                outline: 2.5px solid #000;
	                border-radius: 8px;
	                width: 80vw;
	                height: 10vh;
	                overflow: auto;
	                padding: 2vh;
	            }
			}

            a:link {color: black; text-decoration: none;}
            
        </style>
    </head>
    <body>
		<div class="container">
		<header>
			<h2 class="title">도움말</h2>
			<%@include file="header.html"%>
		</header>

			<%@include file="bottomNavi.html"%>

        <section class="wrap" align="center">
            <article>
                <div id="help-title-container">
                    <div class="help-titles">
                        1. 메인화면
                    </div>
                    <div class="help-titles">
                        2. 유리병 생성 화면
                    </div>
                    <div class="help-titles">
                        3. 글 작성 화면
                    </div>
                    <div class="help-titles">
                        4. 내 정보 화면
                    </div>
                </div>
            </article>

            <article id="padding-wrap">
            	<div id = "h-arrow-wrap" align="center">
            	<span id="prev" onclick="plusSlides(-1)">◀</span>
                <div id="slide-container">
                    <div class="help-slides">
                        <img src="../resources/images/helpView_main.png"  alt="도움말1"/>
                    </div>
                    <div class="help-slides">
                        <img src="../resources/images/helpView_makeJar.png"  alt="도움말2"/>
                    </div>                    
                    <div class="help-slides">
                        <img src="../resources/images/helpView_writing.png"  alt="도움말3"/>
                    </div>
                   <div class="help-slides">
                        <img src="../resources/images/helpView_myinfo.png" alt="도움말4"/>
                    </div>
                </div>
                <span id="next" onclick="plusSlides(1)">▶</span>
                </div>

                <!--도움말 설명-->
                <div class="help-container">
                    <div class="help-texts">
                    ① 클릭 시 해당 유리병에 작성된 글을 랜덤으로 확인 <br>
                    ② 현재 보이는 유리병에 작성된 글 갯수 <br>
                    ③ 클릭하여 글을 작성할 수 있음. <br>
                    ④ 스크린샷 캡쳐 버튼 <br>
                    ⑤ 상점 버튼 (준비중) <br>
                    ⑥ 새 유리병 생성 버튼 <br>
                    ⑦ 메인화면으로 갈 수 있는 홈 버튼 <br>
                    ⑧ 내 정보 확인 버튼 <br>
                    ⑨ 환경설정 버튼 <br>
                    </div>              
                    <div class="help-texts">
                    ① 생성할 유리병의 이름 입력 <br>
                    ② 원하는 유리병 선택 <br>
                    ③ 원하는 도안 선택 <br>
                    ④ 작성 글 갯수 목표치 입력 <br>
                    ⑤ 클릭 시 생성 완료 <br>
                    </div>
                    <div class="help-texts">
                    ① 클릭하여 행복했던 일을 작성 <br>
                    ② 클릭 시 보유한 색종이를 볼 수 있고, 색종이를 클릭하여 선택 가능 <br>
                    ③ 현재 글이 저장되는 유리병 <br>
                    ④ 클릭하여 글 작성 완료 <br>
                    </div>
                    <div class="help-texts">
                    ① 가입 시 입력한 별명. <br>
                    ② 가입 시 입력한 아이디 <br>
                    ③ 보유 코인. 글 작성 시 1코인 증가 <br>
                    ④ 클릭 시 로그아웃. 로그인화면으로 넘어감 <br>
                    ⑤ 클릭 시 계정이 삭제되고, 로그인화면으로 넘어감. <br>
                    </div>
                </div>
            </article>
        </section>
		</div>
		
        
        <script type="text/javascript">
            var slideIndex = 1;
            showSlides(slideIndex);

            
            function plusSlides(n){
                showSlides(slideIndex += n);
            }
            
            function showSlides(n){
                var titles = document.getElementsByClassName("help-titles");
                var slides = document.getElementsByClassName("help-slides");
                var texts = document.getElementsByClassName("help-texts");
                
                if (n > slides.length) {slideIndex = 1}
                if (n < 1) {slideIndex = slides.length}
                for (i = 0; i < slides.length; i++) {
                    titles[i].style.display = "none";
                    slides[i].style.display = "none";
                    texts[i].style.display = "none";
                }
                titles[slideIndex-1].style.display = "block";
                slides[slideIndex-1].style.display = "block";
                texts[slideIndex-1].style.display = "block";
            }
        </script>
    </body>
</html>
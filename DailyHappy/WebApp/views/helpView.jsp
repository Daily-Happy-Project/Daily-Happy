<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>도움말</title>
        
        <link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>
        <style type="text/css">
            #slide-container{
                display: inline-block;
                position: relative;
            }
            
            .help-titles{
                display: none;
            }
            /*image default hide*/
            .help-slides{
                display: none;
                width: 100%;
                background-color: aqua;
            }
            /*text default hide*/
            .help-texts{
                display: none;

            }
            
            #prev, #next{
                cursor: pointer;
                position: absolute;
                top: 250px;
                padding: 16px;
                font-size: 20pt;
            }
            #prev{
                left: 0;
            }
            #next {
                right: 0;
            }
            
            .help-container{
                display: inline-block;
                outline: 2.5px solid #000;
                border-radius: 8px;
                width: 80%;
                margin-top: 20px;
            }

            a:link {color: black; text-decoration: none;}
            
        </style>
    </head>
    <body>
		<header>
			<h2 class="title">도움말</h2>
			<%@include file="topNavi.html"%>
		</header>
        <nav align="center">
            <span id="prev" onclick="plusSlides(-1)">◀</span>
            <span id="next" onclick="plusSlides(1)">▶</span>
        </nav>
        <section class="wrap" align="center">
            <article>
                <div id="help-title-container">
                    <div class="help-titles">
                        도움말 제목1
                    </div>
                    <div class="help-titles">
                        도움말 제목2
                    </div>
                    <div class="help-titles">
                        도움말 제목3
                    </div>
                </div>
            </article>
            <article>
                <div id="slide-container">
                    <div class="help-slides">
                        <img src="#이미지1" alt="도움말1"/>
                    </div>
                    <div class="help-slides">
                        <img src="#이미지1" alt="도움말2"/>
                    </div>                    
                    <div class="help-slides">
                        <img src="#이미지1" alt="도움말3"/>
                    </div>
                </div>
            </article>
            <article>
                <!--도움말 설명-->
                <div class="help-container">
                    <div class="help-texts">
                        도움말 설명1
                    </div>              
                    <div class="help-texts">
                        도움말 설명2
                    </div>

                    <div class="help-texts">
                        도움말 설명3
                    </div>
                </div>
            </article>
        </section>
        
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
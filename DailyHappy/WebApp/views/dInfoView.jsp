<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>개발자 정보</title>
        
        <link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/headerStyle.css"/>
        <style type="text/css">
            #d-info-container{
                display: inline-block;
                text-align: center;
                width: 60%;
                padding: 20px; 
                margin-bottom: 25px;
                
                outline: 2.5px solid #000;
                border-radius: 8px;
            }
            a:link {color: black; text-decoration: none;}
        </style>
    </head>
    <body>
		<header>
		<h2 class="title">개발자 정보</h2>
		<%@include file="header.html"%>
		</header>
		<%@include file="bottomNavi.html"%>
       <article align="center">
           <div class="wrap">
            	<div id="d-info-container">
	               	삼육대학교 컴퓨터·메카트로닉스 공학부<br>
	               	팀 ZIZIZU<br><br>
	                &#60;Zi존간Zi공주 명단&#62;<br>
					콩 공주<br>
					맛 공주<br>
					쥑 공주<br>
	                <br>
					문의는 princesszizonganzi@gmail.com으로 연락 바랍니다.<br>
	                <br><br>
					Copyright 2021. princesszizonganzi(ZIZIZU) all rights reserved.   
           		</div>
           </div>
        </article>
    </body>
</html>
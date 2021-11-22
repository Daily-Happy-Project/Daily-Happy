<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>로그인</title>  
<!--
<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/allStyle.css"/>
<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/loginStyle.css"/>
<link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/formStyle.css"/>
-->
<link rel="stylesheet" href="../resources/css/allStyle.css"/>
<link rel="stylesheet" href="../resources/css/loginStyle.css"/>
<link rel="stylesheet" href="../resources/css/formStyle.css"/>
</head>
<%
//쿠키가져오기
	String str = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
	    for(Cookie tempCookie : cookies){
	        if(tempCookie.getName().equals("email")){
	            str = tempCookie.getValue();
	        }
	        else{
	        	//쿠키 없으면 로그인뷰 그대로
	        }
	    }
	}
%>
<body>
   <div class="container" align="center">
        <div class="login-logo">로고<br></div>
        <!--<div class="login-page-line1"></div>-->
        <h2 class="form-header">로그인</h2>
        <!--<div class="login-page-line2"></div>-->
    
        <form class="form-style" name="loginform" method="post" action="../jsp/login.jsp">

            <% out.print("<input type=\"email\" class=\"input-text\" name=\"email\" placeholder=\"E-mail\" value=\""+str+"\"/>"); %><br>
            <input type="password" class="input-text" name="pw" placeholder="비밀번호"/><br>
            자동 로그인<input type = "checkbox" class="input-text" name="loginChk" value = "true" checked><br>
            <input type="submit" class="button" value="로그인"/>
            
        </form>
        아직 계정이 없으신가요?
        <a href="signupView.html" class="button">회원가입</a>
        <!--계정 찾기 기능 추가?-->
   </div>

</body>
</html>
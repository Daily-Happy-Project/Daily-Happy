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

<style type="text/css">
<<<<<<< HEAD
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
}

.logo-wrap{
    height: 12vh;
    max-width: 200px;
=======

.container{
	display: flax;
	width: 100%;
}
.logo-wrap{
    display: flax;
    width: 5em;
    top: 2em;
>>>>>>> main
}
.logo{
	margin: 0 auto;
	over-fit: cover;
<<<<<<< HEAD
	width: auto;
	height: 100%;
}

.form-header{
    margin : 0 auto;
    padding: 0;
    color: #9d9d9d;
    font-family: 'Uiyeun';
    font-size: 10vw;
    text-align: center;
}
@media screen and (min-width: 500px) {
  .form-header{
  	font-size: 50px;
  }
}
.form-style{
	width: 60vw;
	margin-bottom: 8vh;
}
.input-text{
    width: 100%;
    height: 2em;
    padding: 1.0em 0.125em 0em 0.125em;
    font-size: 1em;
    background-color: rgba(0,0,0,0);
    border-top: 0px; 
    border-bottom: 2px solid #9d9d9d;
    border-left: 0px;
    border-right: 0px;
=======
	width: 100%;
	height: auto;
}
.form-header{
    margin : 0 auto;
    padding-bottom: 20px;
    color: #9d9d9d;
}
.form-style{
    width: 50%;
    max-width: 18em;
    min-width: 12em;
>>>>>>> main
}
</style>
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
   <div class="container" align= "center">
        <div class="logo-wrap"><img class="logo" src="../resources/images/color-logo2.png"/><br></div>
        
        <h2 class="form-header">로그인</h2>
<<<<<<< HEAD

=======
        <div class="login-page-line1"></div>
        <!--<div class="login-page-line2"></div>-->
>>>>>>> main
    
        <form class="form-style" name="loginform" method="post" action="../jsp/login.jsp">

            <% out.print("<input type=\"email\" class=\"input-text\" name=\"email\" placeholder=\"E-mail\" value=\""+str+"\"/>"); %><br>
<<<<<<< HEAD
            <input type="password" class="input-text" name="pw" placeholder="비밀번호"/><br><br>
            
            <input type="submit" class="button" value="로그인"/>
            아이디 저장<input type = "checkbox" name="loginChk" value = "true" checked><br>
            <br>아직 계정이 없으신가요?
            <a href="signupView.jsp" class="button">회원가입</a>
        </form>
	    
	    <!--계정 찾기 기능 추가?-->

=======
            <input type="password" class="input-text" name="pw" placeholder="비밀번호"/><br>
            자동 로그인<input type = "checkbox" name="loginChk" value = "true" checked><br>
            <input type="submit" class="button" value="로그인"/>
            
        </form><br>
	        아직 계정이 없으신가요?
	    <a href="signupView.html" class="button">회원가입</a>
	    <!--계정 찾기 기능 추가?-->
>>>>>>> main
   </div>

</body>
</html>
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
}
.logo{
	margin: 0 auto;
	over-fit: cover;
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

    
        <form class="form-style" name="loginform" method="post" action="../jsp/login.jsp">

            <% out.print("<input type=\"email\" class=\"input-text\" name=\"email\" placeholder=\"E-mail\" value=\""+str+"\"/>"); %><br>
            <input type="password" class="input-text" name="pw" placeholder="비밀번호"/><br><br>
            
            <input type="submit" class="button" value="로그인"/>
            아이디 저장<input type = "checkbox" name="loginChk" value = "true" checked><br>
            <br>아직 계정이 없으신가요?
            <a href="signupView.jsp" class="button">회원가입</a>
            
            <!-- 카카오 로그인 -->
            <a onclick="kakaoLogin();" href="javascript:void(0)">
				<button type="button"><img src="../resources/images/kakao_login_medium.png"/></button>
			</a>
			
			<!-- 네이버 로그인 -->
			<div id="naver_id_login"></div>
					
        </form>
	    
	    <!--계정 찾기 기능 추가?-->

   </div>

<!-- 카카오 로그인 자바스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('965f16dea7d025318b70ff765ca81441');
console.log(Kakao.isInitialized());

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("NAX_UJKJEGd7IGwfJSQC", "http://localhost:8005/views/mainView.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("/mainView.jsp");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>

<script type="text/javascript">
	function naverSignInCallback() {
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
	}
	
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
</body>
</html>
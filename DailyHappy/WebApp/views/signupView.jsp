<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        
        <link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/allStyle.css"/>
        <link rel="stylesheet" href="../resources/css/signupStyle.css"/>
        <link rel="stylesheet" href="/DailyHappy/WebApp/resources/css/formStyle.css"/>
		
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
/*signupStyle.css*/
			#alert-correct{
			    font-size: 8pt;
			}
			
			#alert-incorrect{
			    color: #d92742; 
			    font-weight: bold;
			    font-size: 8pt;
			}
			
			#pw-char{
			    color: #d92742;
			    font-weight: bold;
			    font-size: 8pt;
			}
			#signup{
				margin-top: 5vh;
			}
/*formStyle.css*/
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
			    
			.button {
			    font-size: 1.0em;
			    display: block;
				margin: 10px;
			    padding-top: 10px;
			    padding-bottom: 10px;
				width: 150px;
				text-decoration: none;
			    text-align: center;
				border-radius: 4px;
			    border: 0px;
			    color: #9d9d9d;
			    background-color: rgba(0,0,0,0);
			    box-shadow: #9D9D9D 0 0px 0px 2px inset;
			}
			
			.button:hover {
			    color: rgba(255, 255, 255, 0.85);
			    box-shadow: #9D9D9D 0 0px 0px 40px inset;
			    cursor: pointer;
			}
			
			.disabled-button {
			    font-size: 1.0em;
			    display: block;
				margin: 10px;
			    padding-top: 10px;
			    padding-bottom: 10px;
				width: 150px;
				text-decoration: none;
			    text-align: center;
				border-radius: 4px;
			    border: 0px;
			    color: rgba(0,0,0,0.2);
			    background-color: rgba(157,157,157,0.8);
			}						
		</style>
    </head>
    <body>
      <div class="container" align="center">
           <div class="logo-wrap"><img class="logo" src="../resources/images/color-logo2.png"/><br></div>
           <h2 class="form-header">회원가입</h2>
           
            <form class="form-style" name="signupform" method="post" action="../jsp/signup.jsp">

                <input type="text" class="input-text" name="username" placeholder="별명 (7자 이내)" maxlength="7" minlength="1"/><br>
                <input type="email" class="input-text" name="email" placeholder="이메일 주소를 입력해 주세요."/><br>
                <input type="password" class="input-text pwcheck" id="pw" name="pw" placeholder="비밀번호 (4~15자 이내의 영문,숫자 조합)" maxlength="15" minlength="4" onkeyup="pwCharCheck(this)" onkeydown="pwCharCheck(this)"/><br>
                <input type="password" class="input-text pwcheck" id="pwcorrect" name="pwcorrect" placeholder="비밀번호 확인"/><br>
                <span id="alert-correct" style="display: none;">비밀번호가 일치합니다.</span>
                <span id="alert-incorrect" style="display: none;">비밀번호가 일치하지 않습니다.<br>다시 확인해주세요.</span>
                <span id="pw-char" style="display: none;">비밀번호는 특수문자를 제외한 15자 이내의 영문, 숫자만 가능합니다.</span>
                <br>

                <input id="signup" type="submit" class="disabled-button" value="가입하기" disabled/>
<!--이메일 중복 확인, 비밀번호 일치 확인(OK), x버튼, 다 입력해야 가입하기 활성화(OK), 글자수 제한(OK)-->
            </form>
        </div>
        
        <script type="text/javascript">
            var pwok = false;
            var pwcharok = false;
            var nullok = false;
            
            //패스워드 입력제한
            function pwCharCheck(obj){
                
                var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
                var regExp2 = /[ㄱ-ㅎ가-힣]/gi;
                var regExp3 = /[\s]/gi;
                
                if(regExp.test(obj.value)||regExp2.test(obj.value)||regExp3.test(obj.value)){
                    document.getElementById('pw-char').style.display = 'inline-block';
                    pwcharok = false;
                }
                else{
                    document.getElementById('pw-char').style.display = 'none';
                    pwcharok = true;
                }
            }
            //비밀번호 일치 확인 함수
            function PwCheck(){   
                
                var pw1 = document.getElementById('pw').value;
                var pw2 = document.getElementById('pwcorrect').value;
                if(!pw1.length && !pw2.length){
                   document.getElementById('alert-correct').style.display = 'none';
                   document.getElementById('alert-incorrect').style.display = 'none';
                    pwok=false;
                } 
                else if(pw1!=pw2){
                    document.getElementById('alert-correct').style.display = 'none';
                    document.getElementById('alert-incorrect').style.display = 'inline-block';
                    pwok=false;
                    
                }    
                else if(pw1==pw2){
                    document.getElementById('alert-incorrect').style.display = 'none';
                    document.getElementById('alert-correct').style.display = 'inline-block';
                    pwok = true;
                    
                }                
            }
            //form 빈값 체크
            function ChkNull(){
                
                var a = document.signupform.username.value;
                var b = document.signupform.id.value;
                var c = document.signupform.pw.value;
                var d = document.signupform.pwcorrect.value;
                
                if(a!="" && b!="" && c!="" && d!=""){
                    nullok = true;
                }
                else{
                    nullok = false;
                }

            }
            
            //form 모두 입력(OK), 비밀번호 일치(OK), 이메일 중복 확인 시 버튼 활성화
            $('.input-text').focusout(function(){
                
                PwCheck();
                ChkNull();
                
                if(pwok == true && pwcharok == true && nullok == true){
                    $('#signup').addClass("button");
                    $('#signup').removeClass("disabled-button");
                    $('#signup').removeAttr("disabled");
                }
                else{
                    $('#signup').removeClass("button");
                    $('#signup').addClass("disabled-button");
                    $('#signup').attr("disabled", "true");
                }
            })
        </script>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 웰컴 파일 입니다.
	1. 로그인 했는지, 안했는지 검사 후 했다면 mainView로, 안했다면 loginView로
	2. 유리병 목록 세션에 저장
-->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>하루, 행복</title>
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
	width: 100%;
}
#index-wrap{
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
#index{
	padding-bottom: 10vh;
}
#appname{
	font-family: 'Uiyeun';
	font-size: 2em;
=======
#index-wrap{
	margin-top: 13em;
>>>>>>> main
}
</style>
</head>
<body>
<div id="index-wrap"align="center">
<<<<<<< HEAD
<div id="index">
<footer align="center"><%@include file="footer.html"%></footer>
<div id="appname">하루, 행복</div>
</div>
</div>
=======
<footer align="center"><%@include file="footer.html"%></footer>
<div id="appname">하루, 행복</div>
</div>
>>>>>>> main
<script type="text/javascript">
	setTimeout(function() {
		  location.href="../views/loginView.jsp";
		}, 2000);

</script>
</body>
</html>

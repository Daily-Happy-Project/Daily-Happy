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
#index-wrap{
	margin-top: 13em;
}
</style>
</head>
<body>
<div id="index-wrap"align="center">
<footer align="center"><%@include file="footer.html"%></footer>
<div id="appname">하루, 행복</div>
</div>
<script type="text/javascript">
	setTimeout(function() {
		  location.href="../views/loginView.jsp";
		}, 2000);

</script>
</body>
</html>

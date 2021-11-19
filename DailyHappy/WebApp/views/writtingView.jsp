<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행복을 적어보세요</title>
</head>
<body>
<!-- 글 내용, 학종이 이미지 코드, 유리병 이름 넘겨줘야 함!-->
	<form method="post" action="../jsp/writting.jsp">
		<textarea name="paperText" rows="12" cols="12">당신의 행복은 무엇인가요?</textarea>
		<!-- 하단은 임시로 넣어둔 예제이다. -->
		<input type="radio" id="paperCode" name="img1" value="img1" checked/>
		<input type="radio" id="paperCode" name="img2" value="img2"/>
		<input type="text" name="bottleName" value="bottle1" style="visibility:hidden;"/>
	</form>
</body>
</html>
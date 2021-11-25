<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환경설정</title>
</head>
<body>
<audio loop id="audio" src="../resources/media/bensound-memories.mp3"></audio>

<script>
var audio=document.getElementById("audio");
function on() {
	audio.play();
}

function off() {
	audio.pause();
}
</script>
</body>
</html>
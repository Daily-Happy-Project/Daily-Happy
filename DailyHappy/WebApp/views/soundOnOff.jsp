<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>soundOnOff</title>
</head>
<body>
<script>
	//소리 켜기/끄기
	var audio=document.getElementById("audio");
	function control(e) {
		var id=e.target.id;
		if(id=="on") {
			audio.play();
		}
		else if(id=="off") {
			audio.pause();
		}
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
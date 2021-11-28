<style type="text/css">
body {
	margin: 0;
}
/*bg css: 이후 외부 css 참조 가능 시 이전 예정. */
.bg-image-wrap{
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
}
.background-image{
	display: inline-block;
  	background-image: url('../resources/images/pink-round-theme.png');
  	background-color: #FFF2E2;
	-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-position: center;
    width: 100%;
	height: 100%;
}
</style>


<article class="bg-image-wrap">
	<div class="background-image"></div>
</article>
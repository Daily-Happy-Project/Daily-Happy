<style type="text/css">
/*외부 css 가능해지면 옮길 것 */
body {
	margin: 0;
}

.container {
  width: 100%;
  height: 100%;
  text-align: center;
  position: absolute;
  top: 0;
  z-index: 1;
  background-color: #fff;
}
.container::after {
	content: "";
      background-image: url('../resources/images/pink-round-theme.png');
      background-size: cover;
      opacity: 0.5;
      position: absolute;
      top: 0px;
      left: 0px;
      right: 0px;
      bottom: 0px;

}
</style>
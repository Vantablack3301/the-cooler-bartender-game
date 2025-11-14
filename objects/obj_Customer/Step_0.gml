if room == BarBack {
	x = 9999
	y = 9999
}
else {
	x = 512
	y = 224
}
fadeTimer++
image_alpha = 0 + (fadeTimer / fadeIn);

if (delta_alarm > 0) {
  delta_alarm -= delta_time / 1000000;
  if (delta_alarm <= 30) {
    boxSprite = spr_Order_Box_Yellow
	tipReturn = tipStart / 2
  }
  if (delta_alarm <= 10) {
    boxSprite = spr_Order_Box_Red
	tipReturn = 0
  }
}

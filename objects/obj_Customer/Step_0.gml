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


if room != Shop {
delta_alarm -= delta_time / 1000000;

}

if (delta_alarm <= startAlarm/2) {
    boxSprite = spr_Order_Box_Yellow
	tipReturn = tipStart / 2
}

if (delta_alarm <= 0) {
    boxSprite = spr_Order_Box_Red
	tipReturn = 0
}


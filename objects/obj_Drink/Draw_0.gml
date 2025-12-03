draw_self()

if room == BarBack && global.pouredYet == false{
	draw_set_alpha(0.3);
	draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
	draw_set_alpha(0.1);
	draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, false)
	draw_set_alpha(1.0);
}

if global.gameDifficulty == "new"{
	draw_sprite(spr_Glass_Rocks_Ticks, 0, x,y)
}
else if global.gameDifficulty == "novice" or global.gameDifficulty == "expert"{
	draw_sprite(spr_Glass_Rocks_Ticks_Gray, 0, x,y)
}

if currentlyStirring == true
{
	midpoint = bbox_left + ((bbox_right - bbox_left) / 2)
	part_particles_burst(part_sys, midpoint, y + 100, LiquidStir)
}
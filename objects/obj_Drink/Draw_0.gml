draw_self()

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
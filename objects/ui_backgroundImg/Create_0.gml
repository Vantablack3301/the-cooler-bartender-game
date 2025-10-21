changeSprite = function() {
	show_debug_message(room)
	if room == BarFront {
		sprite_index = spr_Bar_Background_Customer_POV_Empty;
	}
	else {
		sprite_index = spr_Bar_Background_Bartender_POV_Empty;
	}
}
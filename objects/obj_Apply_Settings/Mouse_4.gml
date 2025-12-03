if (window_get_fullscreen()) {
		window_set_fullscreen(false)
		sprite_index = spr_Maximize_Button
}
else {
		window_set_fullscreen(true)
		sprite_index = spr_Minimize_Button
}
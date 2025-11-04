if keyboard_check_pressed(vk_space){
	if visible {
		nextPage()
		audio_play_sound(BookNextPage, 1, false);
	}
}
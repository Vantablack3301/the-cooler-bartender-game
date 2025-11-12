if keyboard_check_pressed(vk_space){
	if visible {
		nextPage()
		audio_play_sound(BookNextPage, 1, false);
		audio_sound_pitch(BookNextPage, random_range(0.95, 1.2));
	}
}
if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")){
	if visible {
		currentPage++
		var snd = audio_play_sound(BookNextPage, 1, false);
		audio_sound_pitch(snd, random_range(0.8, 1.2));
		if currentPage == array_length(bookPages)
			currentPage = 0
		show_debug_message(bookPages[currentPage])
	}
}
if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")){
	if visible {
		currentPage--
		var snd = audio_play_sound(BookNextPage, 1, false);
		audio_sound_pitch(snd, random_range(0.8, 1.2));
		if currentPage < 0
			currentPage = array_length(bookPages) - 1
		show_debug_message(bookPages[currentPage])
	}
}
if keyboard_check_pressed(vk_space){
	if visible {
		currentPage++
		audio_play_sound(BookNextPage, 1, false);
		if currentPage == array_length(bookPages)
			currentPage = 0
		show_debug_message(bookPages[currentPage])
	}
}
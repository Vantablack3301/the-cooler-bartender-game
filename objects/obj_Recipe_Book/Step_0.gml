if keyboard_check_pressed(vk_space){
	if visible {
		currentPage++
		if currentPage == array_length(bookPages)
			currentPage = 0
	}
}
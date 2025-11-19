// toggling between the front and the back of the bar when an arrow key is hit
if room != Shop {
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) ||
		keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right))
	{
		if (currRoom == BarFront){
			currRoom = BarBack;
		}
		else {
        currRoom = BarFront;
		}

		changeSprite();
		room_goto(currRoom);
	}
}
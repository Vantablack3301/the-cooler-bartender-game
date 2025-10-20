// toggling between the front and the back of the bar when an arrow key is hit
if (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) or 
keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right))
{
	currRoom = (currRoom+1) % 2
	room_goto(currRoom)
}
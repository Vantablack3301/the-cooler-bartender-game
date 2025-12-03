// Inherit the parent event
event_inherited();

if(obj_Home_Prompt.visible)
{
	audio_play_sound(ComputerOpen, 1, false);
	room_goto(HomeScreen)
	audio_stop_sound(JazzMusic)
}
// Inherit the parent event
event_inherited();

if(obj_Home_Prompt.visible)
{
	audio_play_sound(ComputerOpen, 1, false);
	with (obj_Home_Prompt)
	{
	    visible = false;
		instance_deactivate_object(obj_PromptBG);
	}

	with (obj_button_home)
	{
	    isOpen = false;
	}
}
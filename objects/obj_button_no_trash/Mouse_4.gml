// Inherit the parent event
event_inherited();

if(obj_Trash_Prompt.visible)
{
	audio_play_sound(ComputerOpen, 1, false);
	with (obj_Trash_Prompt)
	{
	    visible = false;
		instance_deactivate_object(obj_PromptBG);
	}

	with (obj_Trashcan)
	{
	    isOpen = false;
	}
}
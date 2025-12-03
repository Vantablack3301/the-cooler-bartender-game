isOpen = false
onClick = function()
{
	if (instance_exists(obj_Trash_Prompt))
	{
	    if (isOpen)
	    {
	        with (obj_Trash_Prompt)
	        {
	            visible = false;
				instance_deactivate_object(obj_PromptBG);
	        }
	        isOpen = false;
	    }
	    else
	    {
	        with (obj_Trash_Prompt)
	        {
	            visible = true;
	            depth = -100000;
				instance_activate_object(obj_PromptBG);
	        }
	        isOpen = true;
	    }
		audio_play_sound(ComputerOpen, 1, false);
	}
}
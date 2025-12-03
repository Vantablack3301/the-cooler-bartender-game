// Inherit the parent event
event_inherited();

if (instance_exists(obj_Home_Prompt))
{
    if (isOpen)
    {
        with (obj_Home_Prompt)
        {
			instance_deactivate_object(obj_Home_Prompt);
            visible = false;
			instance_deactivate_object(obj_PromptBG);
        }
        isOpen = false;
    }
    else
    {
        with (obj_Home_Prompt)
        {
			instance_activate_object(obj_Home_Prompt);
            visible = true;
            depth = -100000;
			instance_activate_object(obj_PromptBG);
        }
        isOpen = true;
    }
	audio_play_sound(ComputerOpen, 1, false);
}

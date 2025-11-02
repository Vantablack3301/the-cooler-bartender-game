var selected = obj_Manager.selected	
	
	if (selected == "ice")
	{
		if (mouse_check_button_pressed(mb_left))
		{
			obj_Manager.drink.add_ice()
			obj_Manager.selected = ""
			obj_Manager.selectedSprite = noone
		}
			
		return
	}
	
	else if (selected == "Stirrer")
		stir()
	
	else if (selected == "Shaker")
		shake()
		
	else
	{
		add_liquid(selected, delta_time/1000000)
		obj_Manager.isPouring = true
		show_debug_message("currently selected: " + selected + "	current amount: " + string(get_liquid(selected)))
	}
		
var selected = obj_Manager.selected	
	
	if (selected == "Stirrer")
		stir()
	
	else if (selected == "Shaker")
		shake()
		
	else
		add_liquid(selected, delta_time)


show_debug_message(selected)
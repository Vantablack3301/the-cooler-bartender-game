var selected = obj_Manager.selected	
	
	if (selected == "ice")
	{
		if (mouse_check_button_pressed(mb_left))
		{
			
			// yup this is god-awful... we need this to load each sprite
			var _forceLoad = spr_Glass_Flute_Ice
			_forceLoad = spr_Glass_Highball_Ice
			_forceLoad = spr_Glass_Margarita_Ice
			_forceLoad = spr_Glass_Martini_Ice
			_forceLoad = spr_Glass_Red_Wine_Ice
			_forceLoad = spr_Glass_Rocks_Ice
			_forceLoad = spr_Glass_White_Wine_Ice
			
			obj_Manager.drink.add_ice()
			obj_Manager.selected = ""
			obj_Manager.selectedSprite = noone
			
			// updating the cup sprite
			var spriteName = sprite_get_name(sprite_index)
			
			// making sure we can't double add ice
			var substring = string_copy(spriteName,string_length(spriteName)-3 , 4)
			if (substring != "_Ice")
				spriteName += "_Ice"
			// at this point, spriteName contains the name for the cup with ice
			sprite_index = asset_get_index(spriteName)

		}
			
		return
	}
	
	else if (selected == "Stirrer") {
		if ds_map_size(liquids) > 0 {
			stir()
		}
	}
	
	else if (selected == "Shaker")
		shake()
		
	else
	{
		add_liquid(selected, delta_time/1000000)
		obj_Manager.isPouring = true
		show_debug_message("currently selected: " + selected + "	current amount: " + string(get_liquid(selected)))
		liqText = (selected +" " + string(get_liquid(selected)))
	}
		
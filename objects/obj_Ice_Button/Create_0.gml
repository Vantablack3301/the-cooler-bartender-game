onClick = function() 
{
	if (obj_Manager.selected == "ice")
	{
		obj_Manager.selected = ""
		obj_Manager.selectedSprite = noone
	}
	else
	{
		obj_Manager.selected = "ice"
		obj_Manager.selectedSprite = spr_Ice_Cubes
		
		obj_Stirrer.visible = true
		audio_play_sound(DrinkPutDown, 1, false);
		
		var iceCheck = false
	
		for (var i = 0; i < array_length(global.shop_cosmetics); i++)
		{
			var item = global.shop_cosmetics[i];
			if(item.name = "Premium Ice") {
				 iceCheck = item.bought
			} 
		}
		if(iceCheck)
		{
			part_sys = part_system_create();
			part_system_depth(part_sys,-2000)
	        part_particles_burst(part_sys, obj_PremiumIcespot.x, obj_PremiumIcespot.y, Sparkles)
		}
	}
}
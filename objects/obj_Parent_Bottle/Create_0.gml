visible = obj_Manager.selected != bottleName

onClick = function()
{
	if (visible)
	{
		// make every bottle visible before selecting/deselecting to allow swapping on fly.
		with(obj_Parent_Bottle)
		{
			self.visible = true
		}
		
		visible = false
		obj_Manager.selected = bottleName
		obj_Manager.selectedSprite = sprite_index
		
		obj_Manager.selectedSpriteScale_x = image_xscale
		obj_Manager.selectedSpriteScale_y = image_yscale
		
	}
	else 
	{
		visible = true
		obj_Manager.selected = ""
		obj_Manager.selectedSprite = noone
	}
}
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
	}
	else 
	{
		visible = true
		obj_Manager.selected = ""
		obj_Manager.selectedSprite = noone
	}
}
onClick = function()
{
	if (visible)
	{
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
onClick = function()
{
	if (visible)
	{
		visible = false
		obj_Manager.selected = bottleName
	}
	else 
	{
		visible = true
		obj_Manager.selected = ""
	}
}
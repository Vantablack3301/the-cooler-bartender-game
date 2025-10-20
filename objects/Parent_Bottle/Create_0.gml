onClick = function()
{
	if (visible)
	{
		visible = false
		Manager.selected = bottleName
	}
	else 
	{
		visible = true
		Manager.selected = ""
	}
}
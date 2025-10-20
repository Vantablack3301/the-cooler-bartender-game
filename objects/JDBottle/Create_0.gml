onClick = function()
{
	if (visible)
	{
		visible = false
		Manager.selectedBottle = "JD"
	}
	else 
	{
		visible = true
		Manager.selectedBottle = ""
	}
}
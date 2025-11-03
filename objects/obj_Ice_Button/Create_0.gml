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
	}
}
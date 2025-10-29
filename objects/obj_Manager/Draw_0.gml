draw_self()

if (obj_Manager.selectedSprite != noone)
{
	var rotation = 0
	
	if (isPouring)
		rotation = 225
	
	draw_sprite_ext(obj_Manager.selectedSprite, 0, mouse_x, mouse_y, selectedSpriteScale_x, selectedSpriteScale_y, rotation, c_white, 1)
}
	
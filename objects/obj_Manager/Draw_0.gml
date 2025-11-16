draw_self()

if (obj_Manager.selectedSprite != noone)
{
	var rotation = 0
	
	if (isPouring)
		rotation = 225
	
	draw_sprite_ext(obj_Manager.selectedSprite, 0, mouse_x, mouse_y, selectedSpriteScale_x, selectedSpriteScale_y, rotation, c_white, 1)
}
	
if (isPouring && selected != "")
{
	//show_debug_message(selectedBottle)
	part_system_depth(part_sys, obj_Drink.depth + 1)
	part_type_colour3(part_type, selectedBottle.color1, selectedBottle.color2, selectedBottle.color3)
	//part_particles_burst(part_sys, mouse_x, mouse_y, PouringEffect)
	//part_particles_create(part_sys, mouse_x, mouse_y, part_type, 1)
	part_emitter_region(part_sys, part_emitter, mouse_x - 41, mouse_x - 20, mouse_y + 34,  mouse_y + 54, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(part_sys, part_emitter, part_type, 512)
	
	
}
else {
	part_emitter_clear(part_sys, part_emitter)
}
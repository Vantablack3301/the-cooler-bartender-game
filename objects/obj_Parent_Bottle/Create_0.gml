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
		
		if obj_Manager.selectedSprite == spr_Stirrer
			obj_Manager.selectedSpriteScale_y *= -0.8
		audio_play_sound(DrinkPickUp, 1, false);
			
	}
	else 
	{
		visible = true
		obj_Manager.selected = ""
		obj_Manager.selectedSprite = noone
		audio_play_sound(DrinkPutDown, 1, false);
	}
}

drawOutline = function() {
	var _w = 1;
	draw_sprite_ext(sprite_index, image_index, x + _w, y + _w, image_xscale, image_yscale, image_angle, c_yellow, 0.5)
	if global.gameDifficulty == "new" {
		draw_text(x, y, object_index.bottleName)
	}
	//draw_sprite(sprite_index, image_index, x, y);
}


part_sys = part_system_create();
part_emitter = part_emitter_create(part_sys);
part_emitter_region(part_sys, part_emitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);
part_type = part_type_create();
part_type_shape(part_type, pt_shape_disk);


function CleanupParticleSystem ()
{
	part_system_destroy(part_sys); //shoutout gamemaker documentation
	part_type_destroy(part_type);
}
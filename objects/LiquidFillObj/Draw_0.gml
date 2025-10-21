var _left = bbox_left
var _top = bbox_top
var _appscale = surface_get_height(application_surface) / 360
var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

waterSurface = surface_create(sprite_width, sprite_height+transparencyBufferHeight)
surface_set_target(waterSurface)

	draw_clear_alpha(drinkColor, 0)
	draw_surface_part_ext(
		application_surface,			//surface ID
		(_left - _camX) * _appscale,    //left
		(_top - _camY) *_appscale,		//top
		sprite_width * _appscale,		//width
		sprite_height * _appscale,		//height
		x,								//xpos
		y,								//ypos
		1,								//xscale 
		1,								//yscale
		drinkColor,						//color
		.5								//alpha
	)  //following an artists breakdown of how a similar effect was done, im not too sure what this line was supposed to look like as it was cut off, so placeholders were implemented
	gpu_set_colorwriteenable(true, true, true, false) //diables modification of the alpha channel
	draw_set_alpha(0.5)
	draw_set_color(drinkColor)
	draw_rectangle(0, transparencyBufferHeight, sprite_width, sprite_height + transparencyBufferHeight, false)
	draw_set_color(drinkHighlightColor)
	draw_line(0, transparencyBufferHeight + 1, sprite_width, transparencyBufferHeight + 1)
	
	draw_set_color(c_white)
	draw_line(0, transparencyBufferHeight, sprite_width, transparencyBufferHeight)
	draw_set_alpha(1)
	gpu_set_colorwriteenable(true, true, true, true) //re-enabling the alpha channel
	
surface_reset_target()
pW = texture_get_texel_width(surface_get_texture(waterSurface))
pH = texture_get_texel_height(surface_get_texture(waterSurface))

resize_surface = surface_create(sprite_width, sprite_height + transparencyBufferHeight)
surface_set_target(resize_surface)
	draw_clear_alpha(c_white, 0)
	shader_set(liquidWaves)
		shader_set_uniform_f(global.u_pixelH_Wave, pH)
		shader_set_uniform_f(global.u_pixelW_Wave, pW)
		shader_set_uniform_f(global.u_springCount, springCount)  //both of these two will be implemented once i figure out what springs are
		shader_set_uniform_f_array(global.u_springs, springs)
		shader_set_uniform_f(global.u_time, get_timer()*waveSpeed)
	shader_reset()
surface_reset_target()

draw_surface(resize_surface, _left, _top - transparencyBufferHeight)

surface_free(waterSurface)
surface_free(resize_surface)
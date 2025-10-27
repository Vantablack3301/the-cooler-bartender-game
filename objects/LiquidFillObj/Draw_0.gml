var _left = bbox_left
var _right = bbox_right
var _top = bbox_top
var _bottom = bbox_bottom
var _appscale = surface_get_height(application_surface) / 360
var _appscale_inverse = 1 / _appscale
var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

//glass_refract = surface_create(window_get_width(), window_get_height())

fillVolume = lerp(_bottom, _top, (fillPercentage / 100))
show_debug_message("top: " + string(_top) + "\n" + "left: " +string( _left) + "\n" + "fill volume: " + string(fillVolume))


surface_resize(application_surface, display_get_width(), display_get_height()); //we need to resize the surface for some fucking reason, i guess gamemaker doesnt care about proper application scaling

//draw a buffer with the parts of the screen that ar underneath the liquid
draw_surface_part_ext(
	application_surface, 
	(_left -  150) * _appscale_inverse,
	(_top - 150) * _appscale_inverse, 
	sprite_width, 
	sprite_height,
	x,
	y,
	1, 
	1, 
	drinkColor,
	1)/**/

//draws the glass outline
draw_set_colour(c_white);
draw_set_alpha(1)
draw_rectangle(_left, _top, _right, _bottom, true)

//draws the drink colored rect

draw_set_colour(drinkColor);
draw_set_alpha(.5)
draw_rectangle(_left, fillVolume, _right, _bottom, false)/**/
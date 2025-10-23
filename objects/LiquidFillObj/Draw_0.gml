var _left = bbox_left
var _right = bbox_right
var _top = bbox_top
var _bottom = bbox_bottom
var _appscale = surface_get_height(application_surface) / 360
var _appscale_inverse = 1 / _appscale
var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

fillVolume = lerp(_bottom, _top, (fillPercentage / 100))
show_debug_message("top: " + string(_top) + "\n" + "left: " +string( _left) + "\n" + "fill volume: " + string(fillVolume))

//draw a buffer with the parts of the screen that ar underneath the liquid
draw_surface_part_ext(
	application_surface, 
	(_left - _camX) * _appscale, 
	(_top  - _camY) * _appscale, 
	(_bottom - _top) * _appscale, 
	(_right - _left) * _appscale,
	x,
	y,
	1, 
	1, 
	drinkColor, 
	1)

//draws the glass outline
draw_set_colour(c_white);
draw_set_alpha(1)
draw_rectangle(_left, _top, _right, _bottom, true)

//draws the drink colored rect
/*
draw_set_colour(drinkColor);
draw_set_alpha(.5)
draw_rectangle(_left, fillVolume, _right, _bottom, false)/**/
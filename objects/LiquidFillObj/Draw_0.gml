var _left = bbox_left
var _right = bbox_right
var _top = bbox_top
var _bottom = bbox_bottom
var _appscale = surface_get_height(application_surface) / 360
var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

fillVolume = lerp(_bottom, _top, (fillPercentage / 100))
show_debug_message("top: " + string(_top) + "\n" + "bottom: " +string( _bottom) + "\n" + "fill volume: " + string(fillVolume))

draw_set_colour(c_white);
draw_rectangle(_left, _top, _right, _bottom, true)
draw_set_colour(drinkColor);
draw_rectangle(_left, fillVolume, _right, _bottom, true)
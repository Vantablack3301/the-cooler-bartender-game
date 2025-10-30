 //window_set_fullscreen(true)
depth = -256

var aspect_ratio = display_get_width() / display_get_height()

if(aspect_ratio > 1.7) //16:9 (16/9 is 1.77777...)
{
    view_wview[0] = 1280;
    view_hview[0] = 720;
}
else if(aspect_ratio > 1.5) //16:10 (16/10 is 1.6 exactly)
{
    view_wview[0] = 1280;
    view_hview[0] = 800;
}
else //4:3
{
    view_wview[0] = 1024;
    view_hview[0] = 768;
}


toggleVisibility = function() {
	if visible {
		visible = false
	}
	else {
		visible = true
	}
}
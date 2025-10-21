drink = instance_create_layer(960,448, "Instances", obj_Drink)

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

//window_set_size(1920, 1200)

currRoom = 0

// stores which bottle/liquid item you have 'picked up'; serves as argyment 
// to pass into add_liquid 
selected = ""

changeSprite = function() {
	if room == BarFront {
		sprite_index = spr_Bar_Background_Customer_POV_Empty;
	}
	else {
		sprite_index = spr_Bar_Background_Bartender_POV_Empty;
	}
}

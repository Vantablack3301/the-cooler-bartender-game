drink = instance_create_layer(960,448, "Instances", obj_Drink)

window_set_size(1920, 1200)

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

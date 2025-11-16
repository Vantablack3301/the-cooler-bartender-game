max_amount = 10
current_amount = 0
liqColors = ds_map_create()
color = noone


add_stuff = function(amount) {
	if current_amount < max_amount
		current_amount += amount
		
	ds_map_add(liqColors, obj_Manager.selectedBottle.bottleName, obj_Manager.selectedBottle.color3)
	if color == noone {
		color = obj_Manager.selectedBottle.color3
	}
	else {
		color = merge_colour(color, obj_Manager.selectedBottle.color3, 0.02 / ds_map_size(liqColors))
		show_debug_message(1 / ds_map_size(liqColors))
	}

}
recipeReq = noone

onClick = function()
{
	if recipeReq != noone {
		obj_Manager.gradeDrink(obj_Manager.drink, ds_map_find_value(obj_Intitialize.drinks, recipeReq))
		obj_Manager.drink.reset()
		instance_destroy(obj_Customer)
		recipeReq = noone
		instance_create_layer(576, 64, "Instances", obj_Customer);
	}
}
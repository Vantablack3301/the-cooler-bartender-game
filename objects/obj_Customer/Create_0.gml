image_xscale = 1.383234
image_yscale = 1.357542

boxSprite = spr_Order_Box_Green
ordered = false


generateRecipe = function()
{
	randomize()
	var rand = random_range(0, ds_map_size(obj_Intitialize.drinks));
	var toReturn = ds_map_find_first(obj_Intitialize.drinks);
	repeat(rand){
		toReturn = ds_map_find_next(obj_Intitialize.drinks, toReturn);
	}

	//show_debug_message(toReturn)
	//wantedDrink = toReturn
	return toReturn;
}

wantedDrink = generateRecipe()


onClick = function() 
{
	obj_Submit_Drink.recipeReq = wantedDrink
	ordered = true
}

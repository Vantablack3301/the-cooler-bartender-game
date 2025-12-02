image_xscale = .6
image_yscale = .6
image_alpha = 0
var _forceload = spr_Customer_1 // Holy ass
_forceload =(spr_Customer_2)
_forceload =(spr_Customer_3)
_forceload =(spr_Customer_4)
sprite_index = asset_get_index("spr_Customer_"+ string(round(random_range(1,4.4))))

boxSprite = spr_Order_Box_Green
ordered = false

fadeTimer = 0
fadeIn = 80

startAlarm = 120;

if global.gameDifficulty = "novice"
	startAlarm = 90
if global.gameDifficulty = "expert"
	startAlarm = 60

delta_alarm = startAlarm

tipStart = random_range(3,10)
tipReturn = tipStart

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
	if image_alpha >= 1 {
		// potentially return early here if customer is 'walking in'
	
		show_debug_message(tipReturn)
		obj_Manager.gradeDrink(obj_Manager.drink, ds_map_find_value(obj_Intitialize.drinks, wantedDrink), tipReturn)
	
		// emptying the drink since it was given to this customer
		obj_Manager.drink.reset()
	
		// REPLACE WITH CUSTOMER_LEAVE ONCE THAT EXISTS
		instance_destroy(obj_Customer)

		// for now we just make a new customer immediately
		instance_create_layer(512, 224, "Instances", obj_Customer);
	}
}

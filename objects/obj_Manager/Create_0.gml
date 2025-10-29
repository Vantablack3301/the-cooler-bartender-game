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
selectedSprite = noone
selectedSpriteScale_x = 1
selectedSpriteScale_y = 1

// rn this is just to determine if the sprite should be rotated
isPouring = false

changeSprite = function() {
	if room == BarFront {
		sprite_index = spr_Bar_Background_Customer_POV_Empty;
	}
	else {
		sprite_index = spr_Bar_Background_Bartender_POV_Empty;
	}
}



/// @function myFunction(param1, param2, param3)
/// @arg {Id.Instance} drinkMade
/// @param {Id.DsMap} drinkGoal
// Grading System
gradeDrink = function(drinkMade, drinkGoal) {
	var totalScore = 0
	// Ice
	var iceScore = 0
	if drinkMade.hasIce == ds_map_find_value(drinkGoal,"ice"){
		iceScore = 100
	}
	// Stirred
	// Shaken
	
	// Number of Liquids
	var drinkScore = 100
	var reqLiquids = ds_map_find_value(drinkGoal, "numLiquids")
	drinkScore = ds_map_size(drinkMade.liquids) / reqLiquids
	if drinkScore > 1{
		drinkScore = 1 / drinkScore
	}
	drinkScore = round(drinkScore * 100) //Max score depending on number of correct liquids
	// Amount of Liquids	
	var tempLiquidScores = []
	var tempLiquidScore = 0
	var liquidName = ds_map_find_first(drinkMade.liquids); // Get the first key in the map
	while (!is_undefined(liquidName)) {
		var value = drinkMade.liquids[? liquidName]; // Get the value associated with the current key
		
		if (!is_undefined(ds_map_find_value(drinkGoal, string(liquidName)))) { //Check to see if you have required liquid
			tempLiquidScore = value / ds_map_find_value(drinkGoal, string(liquidName))
			if tempLiquidScore > 1{
				tempLiquidScore = 1 / tempLiquidScore
			}
			tempLiquidScore = tempLiquidScore //Percentage based off the amount of liquid
			
			array_push(tempLiquidScores, tempLiquidScore)
		}
		else {
			array_push(tempLiquidScores, 0) // Adds 0 if its a wrong liquid
		}
		liquidName = ds_map_find_next(drinkMade.liquids, liquidName); // Get the next key in the map
	}
	tempLiquidScore = 0
	for (var i = 0; i < array_length(tempLiquidScores); i++) {
		tempLiquidScore += tempLiquidScores[i]
	}
	if (array_length(tempLiquidScores) != 0)
		tempLiquidScore = tempLiquidScore / array_length(tempLiquidScores) // Average of all liquid amts, with 0s for wrong liquids


	drinkScore = round(drinkScore * tempLiquidScore) //Final Drinkscore
	
	// update denominator as more scores are added
	totalScore = floor(drinkScore + iceScore)/2
	
	var inst = instance_create_layer(100, 100, "Instances", obj_ticket);
	with (inst) {
		ticketScore = totalScore
    }
	
	//show_debug_message(totalScore)
	return (totalScore)
	
}
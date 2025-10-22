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




// Grading System
gradeDrink = function(drinkMade, drinkGoal) {
	drinkGoal = ds_map_find_value(obj_Intitialize.drinks, drinkGoal)
	totalScore = 0
	// Ice
	iceScore = 0
	if drinkMade.hasIce == ds_map_find_value(drinkGoal,"ice"){
		iceScore = 100
	}
	// Stirred
	// Shaken
	
	// Number of Liquids
	drinkScore = 100
	reqLiquids = ds_map_find_value(drinkGoal, "numLiquids")
	drinkScore = ds_map_size(drinkMade.liquids) / reqLiquids
	if drinkScore > 1{
		drinkScore = 1 / drinkScore
	}
	drinkScore = int(drinkScore * 100)
	// Amount of Liquids	
	tempLiquidScores = []
	tempLiquidScore = 0
	var key = ds_map_find_first(drinkMade.liquids); // Get the first key in the map
	while (!is_undefined(key)) {
		var value = drinkMade.liquids[? key]; // Get the value associated with the current key
		
		if (!is_undefined(ds_map_find_value(drinkGoal, string(key)))) { //Check to see if you have required liquid
			tempLiquidScore = value / ds_map_find_value(drinkGoal, string(key))
			if tempLiquidScore > 1{
				tempLiquidScore = 1 / tempLiquidScore
			}
			tempLiquidScore = tempLiquidScore
			array_push(tempLiquidScores, tempLiquidScore)
		}

		key = ds_map_find_next(drinkMade.liquids, key); // Get the next key in the map
	}
	tempLiquidScore = 0
	for (var i = 0; i < array_length(tempLiquidScores); i++) {
		tempLiquidScore += tempLiquidScores[i]
	}
	tempLiquidScore = tempLiquidScore / array_length(tempLiquidScores) // Average of valid liquid amts
	drinkScore = int(drinkScore * tempLiquidScore) //Final Drinkscore
	
	totalScore = int(drinkScore + iceScore)
	return (totalScore)
	
}
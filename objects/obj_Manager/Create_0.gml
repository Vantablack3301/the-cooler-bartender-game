drink = instance_create_layer(960, 448, "Instances", obj_Drink);

money = 0
global.obj_manager = id;

//window_set_size(1920, 1200)

currRoom = BarFront

// stores which bottle/liquid item you have 'picked up'; serves as argument 
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
	var ticketString = string(obj_Customer.wantedDrink) + "\n"
	
	var totalScore = 0
	// Ice
	var iceScore = 0
	if drinkMade.hasIce == ds_map_find_value(drinkGoal,"ice"){
		iceScore = 100
	}
	ticketString += "Ice:" + string(drinkMade.hasIce) + " -> " + string(ds_map_find_value(drinkGoal,"ice")) + "\n"
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
			
			//update ticket text
			ticketString += liquidName + ": " + string(value) + " -> " + string(ds_map_find_value(drinkGoal, string(liquidName))) + "\n"
			
			if tempLiquidScore > 1{
				tempLiquidScore = 1 / tempLiquidScore
			}
			tempLiquidScore = tempLiquidScore //Percentage based off the amount of liquid
			
			array_push(tempLiquidScores, tempLiquidScore)
		}
		else {
			ticketString += liquidName + ": " + string(value) + " -> 0\n"
			array_push(tempLiquidScores, 0) // Adds 0 if its a wrong liquid
		}		
		liquidName = ds_map_find_next(drinkMade.liquids, liquidName); // Get the next key in the map
	}


	var reqLiqName = ds_map_find_first(drinkGoal)
	while(!is_undefined(reqLiqName)){
		if reqLiqName != "ice" && reqLiqName != "stirred" && reqLiqName != "shaken" && reqLiqName != "numLiquids" && reqLiqName != "garnishes" {
			if (is_undefined(ds_map_find_value(drinkMade.liquids, reqLiqName))) {
				ticketString += string(reqLiqName) + ": 0 ->" + string(ds_map_find_value(drinkGoal, reqLiqName)) + "\n"
			}
		}
		reqLiqName = ds_map_find_next(drinkGoal, reqLiqName)
	}
	
	tempLiquidScore = 0
	for (var i = 0; i < array_length(tempLiquidScores); i++) {
		tempLiquidScore += tempLiquidScores[i]
	}
	if (array_length(tempLiquidScores) != 0)
		tempLiquidScore = tempLiquidScore / array_length(tempLiquidScores) // Average of all liquid amts, with 0s for wrong liquids


	drinkScore = round(drinkScore * tempLiquidScore) //Final Drinkscore
	
	
	
	//Stirring
	var stirScore = 0
	if ds_map_find_value(drinkGoal,"stirred") > 0 {
		stirScore = drinkMade.stirAmount / ds_map_find_value(drinkGoal,"stirred")
		if stirScore > 1 {
			stirScore = 1 / stirScore
		}
	}
	else {
		if drinkMade.stirAmount == 0{
			stirScore = 1
		}
	}
	
	ticketString += "Stirred:" + string(drinkMade.stirAmount) + " -> " + string(ds_map_find_value(drinkGoal,"stirred")) + "\n"
	stirScore = round(stirScore * 100)
	
	
	
	
	
	// update denominator as more scores are added
	show_debug_message(drinkScore)
	show_debug_message(iceScore)
	show_debug_message(stirScore)
	
	totalScore = floor((drinkScore * 0.6) + (iceScore * 0.2) + (stirScore * 0.2)) // weighting
	ticketString += "Drink Grade: " + string(totalScore)
	show_debug_message(drinkScore * 0.6)
	show_debug_message(iceScore * 0.2)
	show_debug_message(stirScore * 0.2)
	
	instance_destroy(obj_ticket)
	var inst = instance_create_layer(100, 100, "Instances", obj_ticket);
	with (inst) {
		ticketScore = ticketString
    }
	
	
	var tipStartValue = 8.00
	var tipReturnValue = tipStartValue * (totalScore/100)
	if totalScore < 50{
		tipReturnValue = 0
	}
	obj_Manager.money += tipReturnValue
	
	
	
	//show_debug_message(totalScore)
	return (totalScore)
	
}
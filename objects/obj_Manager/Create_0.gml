drink = instance_create_layer(960, 448, "Instances", obj_Drink);
instance_create_layer(512, 224, "Instances", obj_Customer);
lifeList = ds_list_create()
var numLives = 0
// adding the first two lives for all difficulties
if global.gameDifficulty == "new"
	numLives = 5
else if global.gameDifficulty = "novice"
	numLives = 3
else 
	numLives = 2
	
for (i = 0; i < numLives; i++)
{
	var life = instance_create_layer(64*i, 60, "Instances", obj_Life)
	ds_list_insert(lifeList, 0, life)
	life.image_xscale = 0.5
	life.image_yscale = 0.5
}
	

money = 0
global.obj_manager = id;

//window_set_size(1920, 1200)

currRoom = BarFront

// stores which bottle/liquid item you have 'picked up'; serves as argument 
// to pass into add_liquid 
selected = ""
selectedBottle = noone
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
gradeDrink = function(drinkMade, drinkGoal, tipStart) {
	
	var canTip = false
	
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
	//show_debug_message(drinkScore)
	//show_debug_message(iceScore)
	//show_debug_message(stirScore)
	
	totalScore = floor((drinkScore * 0.7) + (iceScore * 0.2) + (stirScore * 0.1)) // weighting
	ticketString += "Drink Grade: " + string(totalScore)
	//show_debug_message(drinkScore * 0.6)
	//show_debug_message(iceScore * 0.2)
	//show_debug_message(stirScore * 0.2)
	
	instance_destroy(obj_ticket)
	var inst = instance_create_layer(16, 144, "Instances", obj_ticket);
	with (inst) {
		ticketScore = ticketString
    }
	
	
	var tipReturnValue = tipStart * (totalScore/100)
	
	if totalScore < 50 {
		tipReturnValue = 0
		audio_play_sound(DrinkWrong, 1, false);
		ticketEffect = LoseEffect
		
		// killing a life
		var lifeToKill = ds_list_find_value(lifeList,0);
		ds_list_delete(lifeList, 0);
		instance_destroy(lifeToKill)
		
		if (ds_list_empty(lifeList)) {
			audio_stop_sound(JazzMusic)
			room_goto(HomeScreen)
		}
	}
	else if totalScore >= 50 && totalScore < 90{
		audio_play_sound(DrinkCorrect, 1, false);
		ticketEffect = WinEffect
		if totalScore >= 80
		{
			canTip = true
			show_debug_message("customer decided to tip")
		}
	}
	else {
		audio_play_sound(DrinkPerfect, 1, false);
		ticketEffect = WinEffect
		canTip = true
	}
	
	var tipCheck = false
	var iceCheck = false
	
	for (var i = 0; i < array_length(global.shop_cosmetics); i++)
	{
		var item = global.shop_cosmetics[i];
		var item1 = global.shop_cosmetics[i];
		if (item.name == "Tip Jar") {
			 tipCheck = item.bought
		} 
		if(item.name = "Premium Ice") {
			 iceCheck = item.bought
		} 
	}
	
	if(tipCheck == true && canTip == true)
	{
		odds = floor(random_range(0, 100))
		if odds <= 67
		{
			tipReturnValue = tipReturnValue + 2.0
			part_particles_burst(part_sys, global.TipSpawnPoint[0], global.TipSpawnPoint[1], CoinParticle)
			audio_play_sound(CoinStack, 1, false);
		}
	}
	
	if(iceCheck)
	{
		tipReturnValue = tipReturnValue + 2.0
	}
	obj_Manager.money += tipReturnValue
	
	part_particles_burst(part_sys, inst.midX, inst.midY, ticketEffect)
	odds = floor(random_range(1, 100))
	show_debug_message(odds)
	if (odds == 67 or odds = 69) //brainrot, i know
	{
		part_particles_burst(part_sys, mouse_x, mouse_y, FuckingVaporizeCustomer)
		var snd = audio_play_sound(VaporizeCustomer, 1, false)
		audio_sound_gain(snd, 100, 1800)
		
		if canTip
		{
			tipOdds = floor(random_range(1, 3))
			if tipOdds == 3
			{
				tipReturnValue = tipReturnValue * 2.0
			}
			else if tipOdds == 1
			{
				tipReturnValue = tipReturnValue * -1.0
			}
		}
	}
	
	obj_Manager.money += tipReturnValue

	
	//show_debug_message(totalScore)
	return (totalScore)
	
}


part_sys = part_system_create();
part_emitter = part_emitter_create(part_sys);

part_type = part_type_create();
part_type_shape(part_type, pt_shape_cloud);
part_type_life(part_type, 15,30)
part_type_scale(part_type, 0.5, 0.5)
part_type_size(part_type, 0.5, 1.5, -0.1, 0.5)
part_type_speed(part_type, 5, 5, 0, 0)
part_type_gravity(part_type, 1, 267)
part_type_direction(part_type, 283, 100, 0,0)
part_type_alpha1(part_type, 0.1)

function CleanupParticleSystem ()
{
	part_emitter_destroy(part_sys, part_emitter)
	part_system_destroy(part_sys);//shoutout gamemaker documentation
	part_type_destroy(part_type);
	
}
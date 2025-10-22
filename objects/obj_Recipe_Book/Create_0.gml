onClick = function(){}

toggleVisiblity = function() {

	if visible {
		visible = false
	}
	else {
		visible = true
		drinkList = obj_Intitialize.drinks

		currentDrinkKey = ds_map_find_first(drinkList);
		currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
		pageTitle = currentDrinkKey
		makePageContents()
	}
}


nextPage = function() {
	var next_item = ds_map_find_next(drinkList, currentDrinkKey)
	if !is_undefined(next_item) { //If on the last page loop to beginning
		currentDrinkKey = ds_map_find_next(drinkList, currentDrinkKey)
	}
	else {
		currentDrinkKey = ds_map_find_first(drinkList);
	}
	pageTitle = currentDrinkKey // Set Page Title
	currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
	makePageContents()
}


makePageContents = function() {
	var drinkProp = ds_map_find_first(currentDrinkValue)
	pageContents = ""
	while(!is_undefined(drinkProp)){
		var drinkVal = currentDrinkValue[? drinkProp]
		if(drinkProp != "numLiquids"){// Exclude Num Liquids
			switch (drinkVal) {
				case 0:
					drinkVal = "No"
				break;
				
				case 1: 
					drinkVal = "Yes"
				break;
				
				default:
					drinkVal = string(drinkVal) + " oz"
				break;
			}
			pageContents += drinkProp + " " + string(drinkVal) + "\n"
		}
		drinkProp = ds_map_find_next(currentDrinkValue, drinkProp)
	}
}
// I don't know if this is the best way to put the book up front but it
// works for now...
depth = -256

onClick = function(){}
bookPages = []
currentPage = 0

toggleVisibility = function() {

	if visible {
		visible = false
	}
	else {
		visible = true
		drinkList = obj_Intitialize.drinks

		//currentDrinkKey = ds_map_find_first(drinkList);
		//currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
		//pageTitle = currentDrinkKey
		//makePageContents()
	}
}
drinkList = obj_Intitialize.drinks

currentDrinkKey = ds_map_find_first(drinkList);
currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
pageTitle = currentDrinkKey




nextPage = function() {
	var next_item = ds_map_find_next(drinkList, currentDrinkKey)
	if !is_undefined(next_item) { //If on the last page loop to beginning
		currentDrinkKey = ds_map_find_next(drinkList, currentDrinkKey)
	}
	else {
		// go to beginning
	}
	pageTitle = string_upper(string_char_at(currentDrinkKey, 1)) + string_copy(currentDrinkKey, 2, string_length(currentDrinkKey) - 1) // Set Page Title
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
					if(drinkProp == "ice")
					{
						drinkVal = "Yes"
					}
					else
					{
						drinkVal = string(drinkVal) + " oz"
					}
				break;
				
				default:
					if (drinkProp == "stirred"){
						drinkVal = string(drinkVal) + " seconds"
					}
					else {
						drinkVal = string(drinkVal) + " oz"
					}
				break;
			}
			pageContents += string_upper(string_char_at(drinkProp, 1)) + string_copy(drinkProp, 2, string_length(drinkProp) - 1) + ": " + string(drinkVal) + "\n"
		}
		drinkProp = ds_map_find_next(currentDrinkValue, drinkProp)
		
	}
	pageContents = pageTitle + "\n" + pageContents
	//show_debug_message(pageContents)
	array_push(bookPages, pageContents)
}
makePageContents()

for (i = 1; i < ds_map_size(obj_Intitialize.drinks); i++) {
	nextPage()
}

array_sort(bookPages, function(left, right){
	if (left < right)
		return - 1;
	else  if (left > right)
		return 1;
	else
		return 0;
})

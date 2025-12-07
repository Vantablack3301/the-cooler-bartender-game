// I don't know if this is the best way to put the book up front but it
// works for now...
depth = -256
var _forceload = BourbonShotImg
_forceload = DarkRumShotImg
_forceload = JagerShotImg
_forceload = MalibuShotImg
_forceload = RedWineImg
_forceload = TequilaShotImg
_forceload = VodkaShotImg
_forceload = WhiskeyNeatImg
_forceload = WhiskeyRocksImg
_forceload = WhiteRumShotImg
_forceload = WhiteWineImg
_forceload = DaiquiriImg
_forceload = GinAndTonicImg
_forceload = GinBuckImg
_forceload = DrPepperAndWhiskeyImg
_forceload = JackAndCokeImg
_forceload = JagerBombImg
_forceload = VodkaCranImg
_forceload = VodkaRedbullImg
_forceload = VodkaSodaImg
_forceload = VodkaSpriteImg
_forceload = WhiskeyAndCokeImg
_forceload = WhiskeyGingerImg
_forceload = JohnCollinsImg
_forceload = MojitoImg
_forceload = PainkillerImg
_forceload = PinaColadaImg
_forceload = TomCollinsImg


onClick = function(){}
bookPages = []
currentPage = 0

toggleVisibility = function() {

	if visible {
		visible = false
		instance_deactivate_object(obj_bookBG);
	}
	else {
		visible = true
		drinkList = obj_Intitialize.drinks
		instance_activate_object(obj_bookBG);

		//currentDrinkKey = ds_map_find_first(drinkList);
		//currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
		//pageTitle = currentDrinkKey
		//makePageContents()
	}
}
drinkList = obj_Intitialize.drinks

currentDrinkKey = ds_map_find_first(drinkList);
currentDrinkValue = ds_map_find_value(drinkList, currentDrinkKey)
pageTitle = Format(currentDrinkKey)



nextPage = function() {
	var next_item = ds_map_find_next(drinkList, currentDrinkKey)
	if !is_undefined(next_item) { //If on the last page loop to beginning
		currentDrinkKey = ds_map_find_next(drinkList, currentDrinkKey)
	}
	else {
		// go to beginning
	}
	pageTitle = Format(currentDrinkKey)
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
						drinkVal = "Yes"
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

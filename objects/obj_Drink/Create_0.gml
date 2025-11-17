liquids = ds_map_create()
hasIce = false
garnishes = ds_list_create()
isShaken = false
isStirred = false
stirAmount = 0.0

fill = instance_create_layer(x + sprite_width/2, y + sprite_height - 19, "Instances", obj_drink_fill);

liqText = ""

// storing mouse positions and other metadata for sake of shaking/stirring
prevStirMouseX = mouse_x
prevStirMouseY = mouse_y

reset = function() 
{
	//delete cup here when resetting the game after alpha
	sprite_index = asset_get_index(spr_Glass_Rocks) //delete this line after implementing cup seletion system
	ds_map_clear(liquids)
	hasIce = false
	ds_list_clear(garnishes)
	isShaken = false
	isStirred = false	
	stirAmount = 0.0
	liqText = ""
	instance_destroy(fill)
	fill = instance_create_layer(x + sprite_width/2, y + sprite_height - 19, "Instances", obj_drink_fill);
}

// adding soemthing to the cup
add_liquid = function(item, amount) 
{
	
	// if we're adding nothing, we should do, well... nothing... 
	if (item == "")
		return
	
	if (ds_map_exists(liquids, item)) 
	{ 
		ds_map_replace(liquids, item, amount + ds_map_find_value(liquids, item))
	}
	else
	{
		ds_map_add(liquids, item, amount)
	}
	fill.add_stuff(amount)
	
	
	// I Honestly don't know how we should keep track of mixed/stirred status, would it be better to make 
	// them floats that increment when stirring/mixing and decrement when liquids are added?
	// it's not a prototype issue but still an eventual concern.
	isMixed = false
	isStirred = false
	
}

get_liquid = function(item)
{
	
	if (!ds_map_exists(liquids, item))
		return 0
	
	return ds_map_find_value(liquids, item)
}

add_ice = function()
{
	hasIce = true	
}

add_garnish = function(item)
{
	
	if (!has_garnish(item)) 
	{
		ds_list_add(garnishes, item)	
	}
	
}

has_garnish = function(item)
{
	return ds_list_find_index(garnishes, item) != -1
}

shake = function() 
{
	isShaken = true	
}

stir = function()
{
	var dx = abs(mouse_x-prevStirMouseX)
	var dy = abs(mouse_y-prevStirMouseY)
	
	prevStirMouseX = mouse_x
	prevStirMouseY = mouse_y
	
	totalDelta = sqrt(power(dx,2) + power(dy,2))
	
	show_debug_message(stirAmount)
	
	stirAmount += min(totalDelta/150.0, 0.10)
	isStirred = stirAmount >= 1
}

/*fillObj = instance_create_layer(x, y, self.layer, LiquidFillObj)

fillObj.MaskSprite = self.sprite_index
fillObj.image_xscale = bbox_right - bbox_left
fillObj.image_yscale = bbox_top - bbox_bottom*/

liquids = ds_map_create()
hasIce = false
garnishes = ds_list_create()
isShaken = false
isStirred = false



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
	
	
	// I Honestly don't know how we should keep track of mixed/stirred status, would it be better to make 
	// them floats that increment when stirring/mixing and decrement when liquids are added?
	// it's not a prototype issue but still an eventual concern.
	isMixed = false
	isStirred = false
	
}

get_liquid = function(item)
{
	
	if (!ds_map_exists(liquids, item))
		return -1
	
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
	isStirred = true	
}



middles = ds_list_create()
top = instance_create_layer(0,0, "Instances", obj_Ticket_Top)
top.depth = -1024
bottom = instance_create_layer(0,0, "Instances", obj_Ticket_Bottom)
bottom.depth = -1024


upTime = 0

add_middle = function(str)
{
	newMiddle = instance_create_layer(0,0, "Instances", obj_Ticket_Middle)
	newMiddle.text = str
	newMiddle.depth = -1024
	ds_list_add(middles, newMiddle)	
}

x = 0
y = 200

dx = 0
dy = -10

updatePos = function()
{
	var currX = x
	var currY = y
	if top != noone
	{
		top.x = currX
		top.y = currY
		currY += 64
		currX += 38
	}
	
	for (var i = 0; i < ds_list_size(middles); i++)
	{
		var middle = middles[|i]
		middle.x = currX
		middle.y = currY
		currY += 40
	}
	
	if bottom != noone
	{
		bottom.x = currX
		bottom.y = currY
		currY += 64
	}
	
	if y >= 2000
	{
		killMe()	
	}
	
	
	
}


killMe = function()
{
	instance_destroy(bottom)
	instance_destroy (top)
	
	for (var i = 0; i < ds_list_size(middles); i++)
	{
		var middle = middles[|i]
		instance_destroy(middle)
	}
	
	instance_destroy(self)
}


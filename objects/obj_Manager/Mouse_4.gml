var instances_clicked = ds_list_create()
if(not instance_position_list(mouse_x, mouse_y, obj_Parent_Clickable, instances_clicked, false))
	return

var currItem = instances_clicked[| 0]
var currDepth = currItem.depth

for (var i = 1; i < ds_list_size(instances_clicked); i++) 
{
    var item = instances_clicked[| i];
    
	// placement order behind the camera focuses on order first, 
	// then by creation order which can be tracked by id I believe...
	
	if (item.depth < currDepth or ((item.depth == currDepth) and (item.id > currItem.depth))) 
	{
		currItem = item
		currDepth = item.depth
	}
	
}


// IF AN ERROR IS THROWN HERE ITS BECAUSE CURRITEM HAS NO ONCLICK, PLEASE ADD ONE
currItem.onClick()

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, buttonCoverText);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


var instances_hovered = ds_list_create()
if(not instance_position_list(mouse_x, mouse_y, obj_Parent_Bottle, instances_hovered, false))
	return

var currItem = instances_hovered[| 0]
var currDepth = currItem.depth

for (var i = 1; i < ds_list_size(instances_hovered); i++) 
{
    var item = instances_hovered[| i];
    
	// placement order behind the camera focuses on order first, 
	// then by creation order which can be tracked by id I believe...
	
	if (item.depth < currDepth or ((item.depth == currDepth) and (item.id > currItem.depth))) 
	{
		currItem = item
		currDepth = item.depth
	}
	
}
var str_obj_name = object_get_name(currItem.object_index);
currItem.drawOutline()

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Safety
if (!variable_global_exists("shop_cosmetics")) exit;

var m = instance_find(global.obj_manager, 0);

// MATCH THE DRAW SETTINGS
var items_per_column = 6;
var total_columns = 2;
var column_width = 450;
var row_height = 80;
var y_shift = 120; // ← this changed because the GUI shifted down

// Recalculate exact same start_x as Draw GUI event
var sw = display_get_gui_width();
var total_width = total_columns * column_width;
var start_x = (sw - total_width) / 2;  // ← FIXED!

for (var i = 0; i < array_length(global.shop_cosmetics); i++)
{
    var item = global.shop_cosmetics[i];

    var col = i div items_per_column;
    var row = i mod items_per_column;

    if (col >= total_columns) break;

    // SAME POSITIONS AS DRAW GUI
    var x1 = start_x + col * column_width;
    var x2 = x1 + 400;

    var y1 = global.start_y + row * row_height + y_shift;
    var y2 = y1 + 60;

    // Check click inside item card
    if (mx > x1 && mx < x2 && my > y1 && my < y2)
    {
        // Buy logic
        if (!item.bought && m.money >= item.cost)
        {
            item.bought = true;
            m.money -= item.cost;
            global.last_bought_item = item.name;
            audio_play_sound(CoinSingle, 1, false);
        }
		else if (item.bought == false) //play sound for can't afford
		{
			audio_play_sound(Incorrect, 0, 0)
		}

        break;
    }
}

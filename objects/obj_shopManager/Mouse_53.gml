var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Safety
if (!variable_global_exists("shop_cosmetics")) exit;

var m = instance_find(global.obj_manager, 0);

// MATCH DRAW VALUES EXACTLY
var items_per_column = 5;
var total_columns = 2;
var column_width = 450;
var row_height = 80;
var y_shift = 80;

var col_x1 = 100; // same as draw code

for (var i = 0; i < array_length(global.shop_cosmetics); i++) {

    var item = global.shop_cosmetics[i];

    // Determine col and row
    var col = i div items_per_column;
    var row = i mod items_per_column;

    if (col >= total_columns) break;

    // X Bounds (same as draw)
    var x1 = col_x1 + col * column_width;
    var x2 = x1 + 400;

    // Y Bounds (MATCHES DRAW CODE PERFECTLY)
    var y1 = global.start_y + row * row_height + y_shift;
    var y2 = y1 + 60;

    // Check click inside box
    if (mx > x1 && mx < x2 && my > y1 && my < y2) {

        // Buy logic
        if (!item.bought && m.money >= item.cost) {
            item.bought = true;
            m.money -= item.cost;
            global.last_bought_item = item.name;
            audio_play_sound(CoinSingle, 1, false);
        }

        break;
    }
}
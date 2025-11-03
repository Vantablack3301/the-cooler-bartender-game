var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (!variable_global_exists("shop_cosmetics")) exit;

for (var i = 0; i < array_length(global.shop_cosmetics); i++) {
    var item = global.shop_cosmetics[i];
    var z = global.start_y + i * 80;

    var bx1 = 100;
    var bx2 = 500;
    var by1 = z;
    var by2 = z + 60;

    if (mx > bx1 && mx < bx2 && my > by1 && my < by2) {
     
        if (!variable_instance_exists(item, "bought") || !item.bought) {
            global.last_bought_item = item.name;
			audio_play_sound(CoinSingle, 1, false);
            global.shop_cosmetics[i].bought = true;
        } 
        break; //bought
    }
}

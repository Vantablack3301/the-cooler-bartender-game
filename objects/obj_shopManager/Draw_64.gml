var sw = display_get_gui_width();
var sh = display_get_gui_height();

// Shop background
draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(50, 50, sw-50, sh-50, false);

// Shop title
draw_set_color(c_white);
draw_text(sw/2 - 80, 60, "SHOP - COSMETICS");

// Draw shop items
for (var i = 0; i < array_length(global.shop_cosmetics); i++) {
    var item = global.shop_cosmetics[i];
    var z = global.start_y + i * 80;

    // Item box background
    draw_set_color(make_color_rgb(50,50,50));
    draw_rectangle(100, z, 500, z+60, false);

    // Item name
    draw_set_color(c_white);
    draw_text(120, z + 20, item.name);

    // Cost
    draw_set_color(c_lime);
    draw_text(300, z + 20, string(item.cost) + " cash");

    // Buy button
    if (item.bought) {
        draw_set_color(c_gray); 
    } else {
        draw_set_color(c_lime);
    }
    draw_rectangle(420, z + 10, 490, z + 50, false);

    draw_set_color(c_black);
    draw_text(430, z + 20, item.bought ? "Bought" : "Buy");
}

//Last bought message
if (variable_global_exists("last_bought_item")) {
    draw_set_color(c_white);
    draw_text(120, sh-100, "Bought " + global.last_bought_item + "!");
}

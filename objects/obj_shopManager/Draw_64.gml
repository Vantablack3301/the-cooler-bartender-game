var sw = display_get_gui_width();
var sh = display_get_gui_height();

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var hovered_item = -1;

//browser
draw_set_color(make_color_rgb(235,235,240));
draw_rectangle(0, 0, sw, 50, false);

// Window buttons (macOS style)
draw_set_color(make_color_rgb(255,92,92));   draw_circle(25, 25, 8, false);
draw_set_color(make_color_rgb(255,188,60));  draw_circle(55, 25, 8, false);
draw_set_color(make_color_rgb(46,204,87));   draw_circle(85, 25, 8, false);

//url
draw_set_color(make_color_rgb(250,250,255)); // slightly bluish white
draw_roundrect(130, 10, sw - 50, 40, false);

draw_set_color(make_color_rgb(100,100,130)); // softer gray-blue text
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(150, 25, "https://bartender-decor-shop.com");

//nav bar
draw_set_color(make_color_rgb(28,35,63)); // deep navy
draw_rectangle(0, 50, sw, 90, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(sw/2, 70, "Home   |   Shop   |   About   |   Contact");

//page bg
draw_set_color(make_color_rgb(240,240,245));
draw_rectangle(0, 90, sw, sh, false);


//screen
draw_set_color(make_color_rgb(210,215,225)); // cooler gray slate
draw_rectangle(50, 120, sw - 50, sh - 50, false);

//title
draw_set_color(make_color_rgb(20,20,30));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(sw/2 - 150, 140, "BAR DECOR & UPGRADES SHOP");


//shop layout
var y_shift = 120;
var items_per_column = 6;
var total_columns = 2;
var column_width = 450;
var row_height = 80;

var total_width = total_columns * column_width;
var start_x = (sw - total_width) / 2;

var column_titles = ["Decorations", "Upgrades"];

draw_set_color(make_color_rgb(20,20,30));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var c = 0; c < total_columns; c++) {
    var title_center_x = start_x + c * column_width + column_width / 2;
    var title_y = (global.start_y - 25) + y_shift;
    draw_text(title_center_x, title_y, column_titles[c]);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);


//draw items
for (var i = 0; i < array_length(global.shop_cosmetics); i++) {

    var item = global.shop_cosmetics[i];

    var col = i div items_per_column;
    var row = i mod items_per_column;
    if (col >= total_columns) break;

    var x_offset = start_x + col * column_width;
    var y_offset = global.start_y + row * row_height + y_shift;

    // Item card
    draw_set_color(make_color_rgb(255,255,255)); // white card
    draw_roundrect(x_offset, y_offset, x_offset + 400, y_offset + 60, false);

    draw_set_color(make_color_rgb(225,225,230)); // inner shading
    draw_roundrect(x_offset, y_offset, x_offset + 400, y_offset + 60, true);

    // Name
    draw_set_color(make_color_rgb(25,25,40));
    draw_text(x_offset + 20, y_offset + 20, item.name);

    // Cost
    draw_set_color(make_color_rgb(0,150,0));
    draw_text(x_offset + 200, y_offset + 20, string(item.cost) + " coins");

    // Buy button
    draw_set_color(item.bought ? make_color_rgb(180,180,180) : make_color_rgb(0,210,70));
    draw_roundrect(x_offset + 320, y_offset + 10, x_offset + 390, y_offset + 50, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(x_offset + 355, y_offset + 30, item.bought ? "Bought" : "Buy");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Hover detection
    if (mx > x_offset && mx < x_offset + 400 &&
        my > y_offset && my < y_offset + 60)
    {
        hovered_item = i;
    }
}


//tool tip
if (hovered_item != -1)
{
    var item = global.shop_cosmetics[hovered_item];

    var tip_text = item.desc;
    var padding = 10;

    var tw = string_width(tip_text);
    var th = string_height(tip_text);

    var box_x1 = mx + 15;
    var box_y1 = my + 15;
    var box_x2 = box_x1 + tw + padding*2;
    var box_y2 = box_y1 + th + padding*2;

    draw_set_color(make_color_rgb(40,40,50));
    draw_roundrect(box_x1, box_y1, box_x2, box_y2, false);

    draw_set_color(c_white);
    draw_text(box_x1 + padding, box_y1 + padding, tip_text);
}


//coins + last purchase message
var m = instance_find(global.obj_manager, 0);

var footer_y = 150; // visible for sure

// Coins
draw_set_color(c_black); // gold
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(sw - 100, footer_y, "Coins: " + string(m.money));

// Last bought
if (variable_global_exists("last_bought_item"))
{
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text(80, footer_y, "Shipped " + string(global.last_bought_item) + " To Your Bar!!!");
}

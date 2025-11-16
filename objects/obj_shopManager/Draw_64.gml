var sw = display_get_gui_width();
var sh = display_get_gui_height();

// --- FAR BACKGROUND ---
draw_set_color(make_color_rgb(225,225,225));
draw_rectangle(0, 0, 1400, 800, false);

// --- SHOP BACKGROUND ---
draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(50, 50, sw-50, sh-50, false);

// --- SHOP TITLE ---
draw_set_color(c_white);
draw_text(sw/2 - 80, 60, "SHOP - DECORATIONS");

// Shift everything else down
var y_shift = 80;

// Layout settings
var items_per_column = 5;  
var total_columns = 2;      
var column_width = 450;
var row_height = 80;
var item_box_width = 400;
var item_box_height = 60;

// Column titles
var column_titles = [
    "Decorations",
    "Upgrades"
];

// Draw column titles centered
for (var c = 0; c < total_columns; c++) {
    var title_x = 100 + c * column_width + column_width/2;
    var title_y = (global.start_y - 50) + y_shift;
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(title_x, title_y, column_titles[c]);
    draw_set_halign(fa_left);
}

// --- HOVER DESCRIPTION RESET ---
global.hover_description = "";

// Draw shop items
for (var i = 0; i < array_length(global.shop_cosmetics); i++) {

    var item = global.shop_cosmetics[i];

    // Determine column (0 or 1) and row (0–4)
    var col = i div items_per_column;
    var row = i mod items_per_column;

    if (col >= total_columns) break;

    // Centered X offset in column
    var x_offset = 100 + col * column_width + (column_width - item_box_width)/2;
    var y_offset = (global.start_y + row * row_height) + y_shift;

    // Item box
    draw_set_color(make_color_rgb(50,50,50));
    draw_rectangle(x_offset, y_offset, x_offset + item_box_width, y_offset + item_box_height, false);

    // Name
    draw_set_color(c_white);
    draw_text(x_offset + 20, y_offset + 20, item.name);

    // Cost
    draw_set_color(c_lime);
    draw_text(x_offset + 200, y_offset + 20, string(item.cost) + " cash");

    // Buy button dimensions
    var btn_width = 70;
    var btn_height = 40;
    var bx1 = x_offset + (item_box_width - btn_width - 10); // 10 px padding from right
    var by1 = y_offset + 10;
    var bx2 = bx1 + btn_width;
    var by2 = by1 + btn_height;

    // Buy button
    draw_set_color(item.bought ? c_gray : c_lime);
    draw_rectangle(bx1, by1, bx2, by2, false);

    // Button text centered
    var btn_text = item.bought ? "Bought" : "Buy";
    var cx = (bx1 + bx2)/2;
    var cy = (by1 + by2)/2;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(cx, cy, btn_text);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // --- HOVER DETECTION ---
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (mx > x_offset && mx < x_offset + item_box_width && my > y_offset && my < y_offset + item_box_height) {
        global.hover_description = item.desc; // show description when hovered
    }
}

// Last bought message
if (variable_global_exists("last_bought_item")) {
    draw_set_color(c_white);
    draw_text(120, (sh - 100) + y_shift, "Bought " + global.last_bought_item + "!");
}

// --- DRAW HOVER DESCRIPTION ---
if (global.hover_description != "") {
    draw_set_color(c_white);
    draw_text(device_mouse_x_to_gui(0) + 20, device_mouse_y_to_gui(0) + 20, global.hover_description);
}

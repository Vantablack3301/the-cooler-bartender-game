draw_self();

draw_set_font(letterFont);
draw_set_color(c_white)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, displayText);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(defaultFont);
draw_self();

draw_set_font(titleFont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, "Are you sure you want to quit?");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(defaultFont);
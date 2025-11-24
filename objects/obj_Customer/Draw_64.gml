draw_set_color(c_black)
draw_set_font(defaultFont);

draw_set_alpha(.5)
draw_sprite(spr_EmphasisBox, 1, x + 40, y + 100)
draw_set_alpha(1)
draw_text(x + 50, y + 150, "click to complete order")
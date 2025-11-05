draw_self()
draw_sprite(boxSprite, 1, x + 343, y - 4)

if !ordered {
	draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_yellow, 0.5)
	draw_text(x, y , "Click me to Take my order")
}
draw_set_font(defaultFont);
draw_set_color(c_black)

draw_text(x+ 343, y - 4, wantedDrink)

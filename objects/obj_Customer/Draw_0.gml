draw_self()
draw_set_color(c_black)
if image_alpha >= 1{
	draw_sprite(boxSprite, 1, x + 350, y - 4)
	draw_text(x + 250, y - 4, "I would like a " + wantedDrink)
}

draw_set_font(defaultFont);


if instance_position(mouse_x, mouse_y, self) && image_alpha >= 1{
	draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_yellow, 0.5)
}



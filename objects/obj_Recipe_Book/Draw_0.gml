draw_self()

draw_set_colour(c_black);
draw_set_font(fnt_bookFont)
draw_text(x +100, y + 100, bookPages[currentPage] + "\n" + "[Left and Right to\n change page]");
drinkImg = asset_get_index(string_replace_all(string_split(bookPages[currentPage], "\n")[0], " ", "") + "Img")
show_debug_message(string_replace_all(string_split(bookPages[currentPage], "\n")[0], " ", "") + "Img")
if drinkImg{
	draw_sprite_ext(drinkImg, 1, x+ 650, y+150, 1.2, 1.2, 0, c_white, 1)
}
draw_set_font(defaultFont)

draw_self()

draw_set_colour(c_black);
draw_set_font(fnt_bookFont)
draw_text(x +100, y + 100, bookPages[currentPage] + "\n" + "[Left and Right to\n change page]");

if (string_split(bookPages[currentPage], "\n")[0] == "Vodka Shot"){
	draw_sprite(GREYBOX, 1, x+ 800, y+100)
}

draw_set_font(defaultFont)

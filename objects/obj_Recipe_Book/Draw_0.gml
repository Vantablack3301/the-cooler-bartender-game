draw_self()

draw_set_colour(c_black);
draw_set_font(fnt_bookFont)
draw_text(x +100, y + 100, bookPages[currentPage] + "\n" + "[Left and Right to change page]");
draw_set_font(defaultFont)

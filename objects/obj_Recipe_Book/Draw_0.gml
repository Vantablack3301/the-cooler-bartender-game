draw_self()

draw_set_colour(c_black);
draw_set_font(fnt_bookFont)
draw_text(x +100, y + 100, bookPages[currentPage] + "\n" + "[space for next]");
draw_set_font(defaultFont)

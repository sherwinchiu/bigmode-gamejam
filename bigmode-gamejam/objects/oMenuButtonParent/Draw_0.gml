draw_self();

draw_set_font(fMenu);

draw_set_color(bg);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, button_text);

// reset to defaults

draw_set_font(fIndicators);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(fg);
/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(fMenu);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(global.view_xview + 960, global.view_yview + 100, "Week " + string(global.week_num));
draw_set_font(fWeek);
draw_text_colour(global.view_xview + 960, global.view_yview + 200, "Choose One", c_white, c_white, c_white, c_white, 0.4);

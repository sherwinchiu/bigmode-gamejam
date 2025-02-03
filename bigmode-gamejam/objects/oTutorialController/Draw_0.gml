draw_self();
if (dialogue_break_timer > 0) {
	dialogue_break_timer--;
} else {
	if (dialogue_timer > 0) {
		cur_dialogue = clamp(cur_dialogue, 0, 22);
		draw_sprite(dialogue_arr[cur_dialogue], 0, 960, 150);
		draw_set_color(c_black);
		draw_set_font(fTutorial);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(960, 150, dialogue_text[cur_dialogue]);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	}
}



draw_set_color(c_white);
//draw_text_transformed(display_get_width()/3 + 100, 150, "Energy: " + string(global.energy_output - global.energy_consumed) + "\n" + string(global.energy_output) + " Generated,\n" + string(global.energy_consumed) + " Consumed", 2, 2, 0);

if (dragging_wire && selected_circle != noone) {
    var path=path_add();
	path_set_kind(path, 1);
	path_set_closed(path, 0);
	drawWire(path, selected_circle.x, selected_circle.y, mouse_x, mouse_y, true);
}

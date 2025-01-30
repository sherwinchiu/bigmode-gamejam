draw_self();

draw_set_color(c_white);
//draw_text_transformed(display_get_width()/3 + 100, 150, "Energy: " + string(global.energy_output - global.energy_consumed) + "\n" + string(global.energy_output) + " Generated,\n" + string(global.energy_consumed) + " Consumed", 2, 2, 0);

if (dragging_wire && selected_circle != noone) {
    var path=path_add();
	path_set_kind(path, 1);
	path_set_closed(path, 0);
	show_debug_message("dragging");

	drawWire(path, selected_circle.x, selected_circle.y, mouse_x, mouse_y, true);
}

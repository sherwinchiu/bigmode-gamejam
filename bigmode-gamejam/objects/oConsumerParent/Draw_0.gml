draw_self();

if (is_selected) {
	draw_set_color(c_red);
	draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}

if (current_demand > 0) {
	draw_set_color(c_red);
	draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}
	
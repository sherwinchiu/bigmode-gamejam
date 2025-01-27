if (dragging_wire && selected_circle != noone) {
    var path=path_add();
	path_set_kind(path, 1);
	path_set_closed(path, 0);

	drawWire(path, selected_circle.x, selected_circle.y, mouse_x, mouse_y);
	draw_path(path, selected_circle.x, selected_circle.y, 1);
}

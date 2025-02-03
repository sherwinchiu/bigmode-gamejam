function drawWire(path, x1, y1, x2, y2, genPath){	
	instance_destroy(oWire, true);
	if (genPath) {
		draw_set_colour(c_white);	
		//show_debug_message("drawing");
		var mid_x = (x1 + x2) / 2;
	
		var dist = sqrt(sqr(y2-y1) + sqr(x2-x1));
	
		var mid_y = y1;
		if (dist > 5) {
			// change 100 below to edit curve (also edt this comment :))
			mid_y = ((y1 + y2)/2 + 75/log10(dist + 10));
		}
		// check for max distance, set it to red since it's too far
		var num_tiles = 4.1;
		if (!point_in_rectangle(mouse_x , mouse_y, x1 - 120 * num_tiles, y1 - 120 * num_tiles, x1 + 120 * num_tiles, y1 + 120 * num_tiles)) {
			draw_set_colour(c_red);	
			global.can_connect_wire = false;
		} 
	
		path_add_point(path, x1, y1, 100);
		path_add_point(path, mid_x, mid_y, 100);
		path_add_point(path, x2, y2, 100);
	}
	
	// draw circles along path	
	for(var i = 0; i <= 1; i+= 0.005) {
		draw_circle(path_get_x(path, i), path_get_y(path, i), 3, false);
		//instance_create_layer(path_get_x(path, i), path_get_y(path, i), "Instances", oWire);
	}
	
}
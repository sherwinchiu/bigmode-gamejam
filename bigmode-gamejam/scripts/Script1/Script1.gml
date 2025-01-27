function drawWire(path, x1, y1, x2, y2){	
	var mid_x = (x1 + x2) / 2;
	
	var dist = sqrt(sqr(y2-y1) + sqr(x2-x1));
	
	var mid_y = y1;
	if (dist != 0) {
		// change 100 below to edit curve (also edt this comment :))
		mid_y = ((y1 + y2)/2 + 100/log10(dist));
	}
	
	//show_debug_message(mid_x);
	//show_debug_message(mid_y);
	
	path_add_point(path, x1, y1, 100);
	path_add_point(path, mid_x, mid_y, 100);
	path_add_point(path, x2, y2, 100);
}
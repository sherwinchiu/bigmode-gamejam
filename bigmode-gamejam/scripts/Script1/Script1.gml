function drawWire(path, x1, y1, x2, y2){	
	path_clear_points(path);
	var mid_x = (x1 + x2) / 2;
	var mid_y = ((y1 + y2)/2 - 200/(x2 - x1));
	
	path_add_point(path, x1, y1, 100);
	path_add_point(path, mid_x, mid_y, 100);
	path_add_point(path, x2, y2, 100);
}
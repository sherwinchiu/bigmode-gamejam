depth = 100;
if (start_circle != noone && end_circle != noone && !drawn) {
	drawWire(wire_path, start_circle.x, start_circle.y, end_circle.x, end_circle.y, true);
	drawn = true;
}

if (instance_exists(start_circle) && instance_exists(end_circle) && wire_path != noone) {
	draw_set_colour(c_white);
	drawWire(wire_path, start_circle.x, start_circle.y, end_circle.x, end_circle.y, false);
}
depth = 0;
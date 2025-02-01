// draw producer

draw_set_color(c_teal)
depth = 100;
if (global.paused) {
	for (var i = 0; i < len; i++) {
		if (global.producer_inv[i] >= 10) draw_text_transformed(buttons[i].x + 60, buttons[i].y + 30, string(global.producer_inv[i]), 3, 3, 0);	
		else draw_text_transformed(buttons[i].x + 80, buttons[i].y + 30, string(global.producer_inv[i]), 3, 3, 0);	
	}
	draw_set_color(c_white);
}

depth = 0;

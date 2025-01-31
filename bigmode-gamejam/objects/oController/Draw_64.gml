// draw producer
draw_set_color(c_teal)
depth = 100;
for (var i = 0; i < len; i++) {
	
	draw_text_transformed(buttons[i].x + 80, buttons[i].y + 10, string(global.producer_inv[i]), 3, 3, 0);	
}
draw_set_color(c_white);
depth = 0;
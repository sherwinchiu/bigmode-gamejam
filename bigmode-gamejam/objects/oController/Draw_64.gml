// draw producer

draw_set_color(c_teal)
depth = 100;
if (!global.paused) {
	for (var i = 0; i < len; i++) {
		if (global.producer_inv[i] >= 10) draw_text_transformed(buttons[i].x + 60, buttons[i].y + 30, string(global.producer_inv[i]), 3, 3, 0);	
		else draw_text_transformed(buttons[i].x + 80, buttons[i].y + 30, string(global.producer_inv[i]), 3, 3, 0);	
	}
	draw_set_color(c_white);
}

depth = 0;

var percent = floor(min((global.curProvided / global.totalDemand) * 100, 100) / 20);
draw_sprite(sBattery, 5 - percent, 60, 60);
draw_text_transformed(60, 100, string(global.score), 5, 5, 0);
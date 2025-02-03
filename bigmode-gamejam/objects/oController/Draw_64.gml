// draw producer

draw_set_font(fToolbar);
depth = 100;

if (!global.paused) {
	for (var i = 0; i < len; i++) {
		/* I DONT KNOW WHY IT CRASHES all the objects exist :(
		if (global.producer_inv[i] >= 10) draw_text(global.buttons[i].x + 80, global.buttons[i].y + 45, string(global.producer_inv[i]));	
		else draw_text(global.buttons[i].x + 87, global.buttons[i].y + 45, string(global.producer_inv[i]));	
		*/
	}
}

depth = 0;

var percent = floor(min((global.curProvided / global.totalDemand) * 100, 100) / 20);
draw_sprite(sBattery, 5 - percent, 60, 60);
//draw_text_transformed(60, 100, string(global.score), 5, 5, 0);
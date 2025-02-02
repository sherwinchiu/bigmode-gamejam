/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
draw_set_font(fToolbar);
draw_set_color(c_black);
if (!global.paused) {
	if (global.producer_inv[global.WATER_ID] >= 10) draw_text(self.x + 94, self.y + 62, string(global.producer_inv[global.WATER_ID]));	
	else draw_text(self.x + 94, self.y + 62, string(global.producer_inv[global.WATER_ID]));	
}

draw_set_color(c_white);
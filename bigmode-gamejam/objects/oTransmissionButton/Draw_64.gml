/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_font(fToolbar);
draw_set_color(c_black);
if (!global.paused) {
	if (global.producer_inv[global.TRANMISSIONTOWERID] >= 10) draw_text(self.x + 87, self.y + 63, string(global.producer_inv[global.TRANMISSIONTOWERID]));	
	else draw_text(self.x + 94, self.y + 62, string(global.producer_inv[global.TRANMISSIONTOWERID]));	
}

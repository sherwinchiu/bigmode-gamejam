/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_font(fToolbar);
draw_set_color(c_black);
if (!global.paused) {
	if (global.producer_inv[global.TREE_ID] >= 10) draw_text(self.x + 80, self.y + 45, string(global.producer_inv[global.TREE_ID]));	
	else draw_text(self.x + 94, self.y + 62, string(global.producer_inv[global.TREE_ID]));	
}

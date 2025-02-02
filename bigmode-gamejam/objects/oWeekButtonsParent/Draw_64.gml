/// @description Insert description here
// You can write your code in this editor
draw_self();
if (this_room != -1 && global.paused) {
	draw_set_font(fMenu);
	draw_set_color(c_black);
	draw_text(self.x + 285, self.y + 190, string(global.producers_to_add[this_room]));	

	
}
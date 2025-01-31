/// @description Insert description here
// You can write your code in this editor
if (is_ghost) {
	draw_set_alpha(0.2);
	x = mouse_x;
	y = mouse_y;
	show_debug_message("i am a " + string(producer_type));
}
draw_self();
draw_set_alpha(1);

draw_set_color(c_aqua);
draw_text_transformed(x, y, global.producer_energy[producer_type], 3, 3, 0);
draw_set_color(c_white);
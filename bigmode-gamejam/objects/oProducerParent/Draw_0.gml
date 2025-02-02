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

var percentUsed = (global.producer_energy[producer_type] - energy_used) / global.producer_energy[producer_type];

draw_set_color(c_white);
draw_set_font(fTutorial);
draw_text(x + 30, y + 30, global.producer_energy[producer_type]);
draw_set_font(fIndicators);


//var frameToDraw = floor(min(percentUsed * 100, 100) / 12.5);
//frameToDraw = (frameToDraw > 7) ? 7 : frameToDraw;
//frameToDraw = (frameToDraw < 0) ? 0 : frameToDraw;
//draw_sprite(sProducerBattery, frameToDraw, x + 30, y - 30);
//show_debug_message("drawing frame: " + string(frameToDraw));

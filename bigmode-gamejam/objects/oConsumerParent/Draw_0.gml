draw_self();

if (is_selected) {
	draw_set_color(c_red);
	//draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}

if (current_demand > 0) {
	draw_set_color(c_red);
	//draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}
draw_set_color(c_white);
var percentFulfill = (global.consumer_demand[consumer_type] - current_demand) / global.consumer_demand[consumer_type];
draw_set_font(fTutorial);
draw_text(x +  global.consumer_offset[consumer_type][0] - 10, y + global.consumer_offset[consumer_type][1] - 25, string(global.consumer_demand[consumer_type]));
draw_set_font(fIndicators);

var frameToDraw = round(percentFulfill * 10) - 1;
frameToDraw = (frameToDraw > 9) ? 9 : frameToDraw;
frameToDraw = (frameToDraw < 0) ? 0 : frameToDraw;
draw_sprite(sLightbulb, frameToDraw, x + global.consumer_offset[consumer_type][0], y - global.consumer_offset[consumer_type][1]);
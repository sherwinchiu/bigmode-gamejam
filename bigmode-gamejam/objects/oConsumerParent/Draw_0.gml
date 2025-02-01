draw_self();

if (is_selected) {
	draw_set_color(c_red);
	draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}

if (current_demand > 0) {
	draw_set_color(c_red);
	draw_circle(x, y, 16, false);
	draw_set_color(c_white);
}

var percentFulfill =(global.consumer_demand[consumer_type] - current_demand) / global.consumer_demand[consumer_type];
draw_text_transformed(x, y, ((current_demand < 0) ? string(0) : string(current_demand))+ "/" + string(global.consumer_demand[consumer_type]), 3, 3, 0);
var frameToDraw = round(percentFulfill * 10) - 1;
frameToDraw = (frameToDraw > 9) ? 9 : frameToDraw;
frameToDraw = (frameToDraw < 0) ? 0 : frameToDraw;
draw_sprite(sLightbulb, frameToDraw, x - 60, y - 120);
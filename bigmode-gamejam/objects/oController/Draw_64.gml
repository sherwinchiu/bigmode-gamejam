// draw producer

draw_set_font(fToolbar);
draw_set_color(c_white);
var lose_string = "";
if (percent == 0) {
	lose_string = "Lose in: " + string(lose_counter) +"s";
}

draw_text(150, 150, lose_string);
percent =  floor(min((global.curProvided / global.totalDemand) * 100, 100) / 20);
draw_sprite(sBattery, 5 - percent, 60, 60);


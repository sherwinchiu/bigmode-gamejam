/// @description New Week Screen
// You can write your code in this editor


pause = true;

// show Week_Display Layer
var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, true); 
// random number between 1-6 to choose which producer to choose

// add a length of rail
wire_length_available += 40;

alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // reset alarm on call
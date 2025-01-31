/// @description New Week Screen
// You can write your code in this editor

//instance_deactivate_all(true);
//instance_activate_object(oContinueButton); // TEMPORARY

var spawn_time = alarm_get(1);
alarm_set(1, -1); // pause alarm


//global.paused = true;
global.week_end = true;
global.leveled_up = false;
show_debug_message("week ended");
// show Week_Display Layer
var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, true); 
// random number between 1-6 to choose which producer to choose

// add a length of rail
wire_length_available += 40;

alarm_set(1, spawn_time);
global.paused = false;
alarm_set(0, game_get_speed(gamespeed_fps) * 5);  // reset alarm on call
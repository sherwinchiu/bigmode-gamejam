/// @description New Week Screen
// You can write your code in this editor

//instance_deactivate_all(true);
//instance_activate_object(oContinueButton); // TEMPORARY

instance_deactivate_all(true);

//global.paused = true;
global.week_end = true;
global.leveled_up = false;
show_debug_message("week ended");
// show Week_Display Layer
var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, true); 

// random number between 1-6 to choose which producer to choose
// create the two buttons
show_debug_message("created button");
var button1 = instance_create_layer(global.view_xview + 500, global.view_yview + 500, "Week_Display", oContinueButton);
//var button2 = instance_create_layer(global.view_xview + 500, global.view_yview + 500, "Week_Display", oContinueButton);
//var background = instance_create_layer(global.view_xview, global.view_yview, "Week_Display", oWeekPauseBackground);
//button2.isOnPausedScreen = true;

wire_length_available += 40;

// add a length of rail


alarm_set(0, game_get_speed(gamespeed_fps) * 15);  // reset alarm on call
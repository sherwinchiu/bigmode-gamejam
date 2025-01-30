/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
show_debug_message("I AM CREATED");
show_debug_message(string(x) + ", " + string(y));
activate_button = function() { // function to override
	global.curr_building = global.COAL_ID; // change button
}
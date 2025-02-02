/// @description Insert description here
// You can write your code in this editor

// pause alarms
global.controller.alarm[0]++;
global.controller.alarm[1]++;
show_debug_message("CUR ALARM: " + string(global.controller.alarm[1]));

hovering = instance_position(mouse_x, mouse_y, id);
if (hovering && mouse_check_button_pressed(mb_left)) {
	// instead of activating button
	instance_activate_object(inst_789A4457); // activate everything
	var lay_id = layer_get_id("Week_Display");
	layer_set_visible(lay_id, false); 
	unpauseGame();
	instance_destroy(self);
}
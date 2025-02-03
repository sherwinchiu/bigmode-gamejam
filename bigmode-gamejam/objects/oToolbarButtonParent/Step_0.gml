/// @description Insert description here


hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if (hovering) {
	global.isTouchingToolbar = true;
} 
if (hovering && mouse_check_button_pressed(mb_left)) 
{
	audio_play_sound(click, 1, false);
	clicked = true;
	activate_button();
	show_debug_message("button pressed" + string(global.curr_building));
} 

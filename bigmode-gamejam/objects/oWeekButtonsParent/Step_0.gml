/// @description Insert description here
// You can write your code in this editor

// pause alarms
var hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if (hovering && mouse_check_button_pressed(mb_left)) {
	// instead of activating button
	audio_play_sound(click, 1, false);
	unpauseGame();// activate everything 
}
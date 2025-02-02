/// @description Insert description here
// You can write your code in this editor
var hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if (hovering && mouse_check_button_pressed(mb_left)) {
	// instead of activating button
	global.producer_inv[global.OIL_ID] += 1;
	unpauseGame();// activate everything 
}
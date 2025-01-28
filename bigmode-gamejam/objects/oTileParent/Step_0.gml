/// @description Insert description here

var zoom_factor_x = camera_get_view_width(view_camera[0]) / room_width;
var zoom_factor_y = camera_get_view_height(view_camera[0]) / room_height;

hovering = position_meeting((device_mouse_x_to_gui(0) * zoom_factor_x) + camera_get_view_x(view_camera[0]), (device_mouse_y_to_gui(0) * zoom_factor_y) + camera_get_view_y(view_camera[0]), id);

if (hovering && mouse_check_button_pressed(mb_left) && !has_building && global.curr_building == current_tile) 
{
	// place tile
	placeBuilding(current_tile, x, y);
	
	has_building = true;	
}
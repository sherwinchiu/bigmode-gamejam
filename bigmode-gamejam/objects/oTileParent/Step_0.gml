/// @description Insert description here

hovering = position_meeting(device_mouse_x_to_gui(0) + camera_get_view_x(view_camera[0]), device_mouse_y_to_gui(0) + camera_get_view_y(view_camera[0]), id);

if (hovering && mouse_check_button_pressed(mb_left) && !has_building && global.curr_building == current_tile) 
{
	// place tile
	placeBuilding(current_tile, x, y);
	
	has_building = true;	
}
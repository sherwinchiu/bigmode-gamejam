/// @description Insert description here

hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hovering && mouse_check_button_pressed(mb_left) && !has_building) 
{
	// place tile
	placeBuilding(global.curr_building, current_tile, x, y);
	
	has_building = true;	
}
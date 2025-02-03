/// @description Insert description here

var zoom_factor_x = camera_get_view_width(view_camera[0]) / room_width;
var zoom_factor_y = camera_get_view_height(view_camera[0]) / room_height;

hovering = position_meeting(mouse_x, mouse_y, id);

if (!global.isTouchingToolbar && hovering && mouse_check_button_pressed(mb_left) && !has_building && global.curr_building == current_tile) 
{
	// place tile
	placeBuilding(current_tile, x, y);
	
	has_building = true;	
}
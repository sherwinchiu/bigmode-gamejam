/// @description On Gameplay Start
window_set_size(1280, 720);

selected_circle = noone;
dragging_wire = false;
<<<<<<< Updated upstream
camera = camera_create_view(0, 0, room_width, room_height);
view_set_camera(0,camera)
view_visible[0] = true;
zoom_speed = 1;

view_wview = 1366;
view_hview = 768;
view_xview = 0;
view_yview = 0;
window_max_w = view_wview;
window_max_h = view_hview;
camera_set_view_pos(camera, view_xview, view_yview);
camera_set_view_size(camera, view_wview, view_hview);
=======

wire_length_available = 0; // total wire length for player to use

pause = false;

week_num = 1;

// disable week display
var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, false); 

alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // new week every 2 minutes
>>>>>>> Stashed changes

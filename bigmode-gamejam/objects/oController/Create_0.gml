/// @description On Gameplay Start

selected_circle = noone;
dragging_wire = false;
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
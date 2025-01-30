camera = camera_create_view(0, 0, room_width, room_height);
view_set_camera(0,camera)
view_visible[0] = true;
zoom_speed = 10;

view_wview = 960;
view_hview = 576;
global.view_xview = (room_width - view_wview) / 2;
global.view_yview = (room_height - view_hview) / 2;
show_debug_message(string(room_width) + " " + string(room_height));
window_max_w = view_wview;
window_max_h = view_hview;
is_panning = false;
mouse_x_start = window_views_mouse_get_x;
mouse_y_start = window_views_mouse_get_x;
min_zoom_width = view_wview;
max_zoom_width = room_width * 2;
min_zoom_height = view_hview;
max_zoom_height = room_height * 2;

cur_level = 0;
max_level = 5;
zoom_factor = 128;
global.leveled_up = true;

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);

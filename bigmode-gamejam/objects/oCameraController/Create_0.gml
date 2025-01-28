camera = camera_create_view(0, 0, room_width, room_height);
view_set_camera(0,camera)
view_visible[0] = true;
zoom_speed = 10;

view_wview = 1366;
view_hview = 768;
global.view_xview = 0;
global.view_yview = 0;
window_max_w = view_wview;
window_max_h = view_hview;
is_panning = false;
mouse_x_start = window_views_mouse_get_x;
mouse_y_start = window_views_mouse_get_x;
min_zoom_width = 100;
max_zoom_width = room_width * 2;
min_zoom_height = 100;
max_zoom_height = room_height * 2;

camera_set_view_pos(camera, view_xview, view_yview);
camera_set_view_size(camera, view_wview, view_hview);

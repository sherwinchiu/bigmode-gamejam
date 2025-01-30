view_wview = 1920;
view_hview = 1080;
global.view_xview = (room_width / 2) - (view_wview / 2);
global.view_yview = (room_height / 2) - (view_hview / 2) - 60;
show_debug_message(string(global.view_xview) + " " + string(global.view_yview));

instance_deactivate_all(true);
instance_activate_layer("GUI");
instance_activate_object(oController);
instance_activate_layer("GUI");
instance_activate_region(global.view_xview, global.view_yview, view_wview, view_hview, true);

buttons = [oCoalToolbarButton, oGrassToolbarButton, oOilSandToolbarButton, oToolbarButtonParent, oTreeToolbarButton, oWaterToolbarButton];

for (var i = 0; i < array_length(buttons); i++) {
	instance_activate_object(buttons[i]);	
}

camera = camera_create_view(global.view_xview, global.view_yview, view_wview, view_hview);
view_set_camera(0,camera)
view_visible[0] = true;
zoom_speed = 60;
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);
show_debug_message("Actual Camera Position: " + string(cam_x) + ", " + string(cam_y));


window_max_w = view_wview;
window_max_h = view_hview;
is_panning = false;
min_x_cam = global.view_xview;
max_x_cam = global.view_xview;
min_y_cam = global.view_yview;
max_y_cam = global.view_yview;
mouse_x_start = window_views_mouse_get_x;
mouse_y_start = window_views_mouse_get_x;
min_zoom_width = view_wview;
max_zoom_width = room_width;
min_zoom_height = view_hview;
max_zoom_height = room_height;

cur_level = 0;
max_level = 5;
zoom_factor = 120;
global.leveled_up = true;

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);

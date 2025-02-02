view_wview = 1920;
view_hview = 1080;
global.view_xview = (room_width / 2) - (view_wview / 2);
global.view_yview = (room_height / 2) - (view_hview / 2);
show_debug_message(string(global.view_xview) + " X, Y->" + string(global.view_yview));

instance_deactivate_all(true);
instance_activate_layer("GUI");
instance_activate_object(oController);
instance_activate_region(global.view_xview, global.view_yview, view_wview, view_hview, true);

camera = camera_create_view(global.view_xview, global.view_yview, view_wview, view_hview);
view_set_camera(0,camera)
view_visible[0] = true;
zoom_speed = 10;
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);
show_debug_message("Actual Camera Position: " + string(cam_x) + ", " + string(cam_y));


global.active_x = global.view_xview;
global.active_y = global.view_yview;
global.active_w = view_wview;
global.active_h = view_hview;

global.cur_level = 0;
max_level = 10;
zoom_factor = 120;
global.leveled_up = true;

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);
show_debug_message(view_wview);

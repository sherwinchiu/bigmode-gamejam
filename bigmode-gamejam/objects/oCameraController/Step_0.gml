if (mouse_check_button_pressed(mb_middle)) {
	mouse_x_start = window_views_mouse_get_x();
	mouse_y_start = window_views_mouse_get_y();
}

if (mouse_check_button(mb_middle)) {
	view_xview += mouse_x_start - window_views_mouse_get_x();
	view_yview += mouse_y_start - window_views_mouse_get_y();
    
}

var prev_view_w = view_wview;
var prev_view_h = view_hview;

if (mouse_wheel_up()) {
    view_wview -= window_max_w / zoom_speed;
    view_hview -= window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, max_zoom_height);
    view_xview += (prev_view_w - view_wview) / 2;
    view_yview += (prev_view_h - view_hview) / 2;
}

if (mouse_wheel_down()) {
    view_wview += window_max_w / zoom_speed;
    view_hview += window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, max_zoom_height);
    view_xview -= (view_wview - prev_view_w) / 2;
    view_yview -= (view_hview - prev_view_h) / 2;
}

camera_set_view_pos(camera, view_xview, view_yview);
camera_set_view_size(camera, view_wview, view_hview);
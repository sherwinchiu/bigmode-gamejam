if (global.week_end && !global.leveled_up) {
	if (cur_level < max_level) {
		show_debug_message(cur_level);
		cur_level++;
	
		var old_w = view_wview;
		var old_h = view_hview;
		view_wview = min(max_zoom_width, view_wview + zoom_factor);
		view_hview = min(max_zoom_height, view_hview + zoom_factor);
	
		global.view_xview -= (view_wview - old_w) / 2;
		global.view_yview -= (view_hview - old_h) / 2;
	
		// expand pan range
		min_x_cam -= 120;
		min_y_cam -= 120;
		//max_x_cam += 120;
		//max_y_cam += 120;
		
		// expand zoom range
		min_zoom_width = view_wview;
		max_zoom_width = view_wview + (max_x_cam - min_x_cam);
		min_zoom_height = view_hview;
		max_zoom_height = view_hview +(max_y_cam - min_y_cam);
	
		global.leveled_up = true;
		var _vx = camera_get_view_x(view_camera[0]);
		var _vy = camera_get_view_y(view_camera[0]);
		var _vw = camera_get_view_width(view_camera[0]);
		var _vh = camera_get_view_height(view_camera[0]);
		instance_activate_region(_vx, _vy, _vw, _vh, true);
	}
}

if (mouse_check_button_pressed(mb_middle)) {
	mouse_x_start = window_views_mouse_get_x();
	mouse_y_start = window_views_mouse_get_y();
}

if (mouse_check_button(mb_middle)) {
	global.view_xview += mouse_x_start - window_views_mouse_get_x();
	global.view_yview += mouse_y_start - window_views_mouse_get_y();
    
}

//show_debug_message("before clamp ONE: " + string(global.view_xview) + ", " + string(global.view_yview) +" --- " + string(min_x_cam) + ", " + string(min_y_cam) + " to " + string(max_x_cam) + ", " + string(max_y_cam));
if (!keyboard_check(vk_space)) { // IF STATEMENT FOR TESTING
	global.view_xview = clamp(global.view_xview, min_x_cam, max_x_cam);
	global.view_yview = clamp(global.view_yview, min_y_cam, max_y_cam);
}



// FIX ZOOM LATER

var prev_view_w = view_wview;
var prev_view_h = view_hview;

if (mouse_wheel_up() && keyboard_check(vk_space)) {
    view_wview -= window_max_w / zoom_speed;
    view_hview -= window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, max_zoom_height);
    global.view_xview += (prev_view_w - view_wview) / 2;
    global.view_yview += (prev_view_h - view_hview) / 2;
}

if (mouse_wheel_down() && keyboard_check(vk_space)) {
    view_wview += window_max_w / zoom_speed;
    view_hview += window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, max_zoom_height);
    global.view_xview -= (view_wview - prev_view_w) / 2;
    global.view_yview -= (view_hview - prev_view_h) / 2;
}

if (!keyboard_check(vk_space)) { // IF STATEMENT FOR TESTING
	global.view_xview = clamp(global.view_xview, min_x_cam, max_x_cam);
	global.view_yview = clamp(global.view_yview, min_y_cam, max_y_cam);
}

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);
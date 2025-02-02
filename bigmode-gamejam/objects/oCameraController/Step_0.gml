if (global.week_end && !global.leveled_up) {
	if (cur_level < max_level) {
		//show_debug_message(cur_level);
		cur_level++;
		//view_wview = min(global.max_zoom_width, view_wview + zoom_factor);
		//view_hview = min(global.max_zoom_height, view_hview + zoom_factor);
	
		//global.view_xview -= (view_wview - old_w) / 2;
		//global.view_yview -= (view_hview - old_h) / 2;
	
		// expand pan range
		global.min_x_cam -= 288;
		global.min_y_cam -= 162;
		max_x_cam += 288;
		max_y_cam += 162;
		
		// expand zoom range
		global.max_zoom_width += 576;
		global.max_zoom_height += 324;
		
		show_debug_message(string(global.min_x_cam) + ", " + string(global.min_y_cam) + " to " + string(max_x_cam) + ", " + string(max_y_cam));
		show_debug_message("zoom: " + string(global.max_zoom_width) + ", " + string(global.max_zoom_height));
	
		global.leveled_up = true;
		// deactivate everything outside viewport
		//instance_deactivate_region(_vx, _vy, _vw, _vh, false, true);
		// activate wires
		instance_deactivate_all(true);
		instance_activate_object(oLine);
		instance_activate_layer("Covers");
		instance_activate_layer("GUI");
		instance_activate_layer("Instances");
		instance_activate_region(global.min_x_cam, global.min_y_cam, global.max_zoom_width, global.max_zoom_height, true);
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

//show_debug_message("before clamp ONE: " + string(global.view_xview) + ", " + string(global.view_yview) +" --- " + string(global.min_x_cam) + ", " + string(global.min_y_cam) + " to " + string(max_x_cam) + ", " + string(max_y_cam));

global.view_xview = clamp(global.view_xview, global.min_x_cam, max_x_cam);
global.view_yview = clamp(global.view_yview, global.min_y_cam, max_y_cam);

var prev_view_w = view_wview;
var prev_view_h = view_hview;

if (mouse_wheel_up()) {
    view_wview -= window_max_w / zoom_speed;
    view_hview -= window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, global.max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, global.max_zoom_height);
    global.view_xview += (prev_view_w - view_wview) / 2;
    global.view_yview += (prev_view_h - view_hview) / 2;
}

if (mouse_wheel_down()) {
    view_wview += window_max_w / zoom_speed;
    view_hview += window_max_h / zoom_speed;
	view_wview = clamp(view_wview, min_zoom_width, global.max_zoom_width);
    view_hview = clamp(view_hview, min_zoom_height, global.max_zoom_height);
    global.view_xview -= (view_wview - prev_view_w) / 2;
    global.view_yview -= (view_hview - prev_view_h) / 2;
}
global.view_xview = clamp(global.view_xview, global.min_x_cam, max_x_cam);
global.view_yview = clamp(global.view_yview, global.min_y_cam, max_y_cam);

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);
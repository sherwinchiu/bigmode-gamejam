if (global.week_end && !global.leveled_up) {
	if (cur_level < max_level) {
		cur_level++;
		global.active_x -= 288;
		global.active_w += 576;
		global.active_y -= 162;
		global.active_h += 324;
		
		
		global.leveled_up = true;
		// deactivate everything outside viewport
		//instance_deactivate_region(_vx, _vy, _vw, _vh, false, true);
		// activate wires
		instance_deactivate_all(true);
		instance_activate_object(oLine);
		instance_activate_layer("Covers");
		instance_activate_layer("GUI");
		instance_activate_layer("Instances");
		instance_activate_region(global.active_x, global.active_y, global.active_w, global.active_h, true);
		global.paused = false;
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

global.view_xview = clamp(global.view_xview, global.active_x, global.active_x + global.active_w - view_wview);
global.view_yview = clamp(global.view_yview, global.active_y, global.active_y + global.active_h - view_hview);

var prev_view_w = view_wview;
var prev_view_h = view_hview;

if (mouse_wheel_up()) {
    view_wview -= 16 * zoom_speed;
    view_hview -= 9 * zoom_speed;
	view_wview = clamp(view_wview, 1920, global.active_x + global.active_w - global.view_xview);
    view_hview = clamp(view_hview, 1080, global.active_y + global.active_h - global.view_yview);
    
	global.view_xview += (prev_view_w - view_wview > 0) ? 8 * zoom_speed : 0;
    global.view_yview += (prev_view_h - view_hview > 0) ? 4.5 * zoom_speed : 0;
}

if (mouse_wheel_down()) {
    view_wview += 16 * zoom_speed;
    view_hview += 9 * zoom_speed;
	var diffX = (global.view_xview + view_wview) - (global.active_x + global.active_w);
	var diffY = (global.view_yview + view_hview) - (global.active_y + global.active_h);
	
	view_wview = clamp(view_wview, 1920, global.active_x + global.active_w - global.view_xview);
    view_hview = clamp(view_hview, 1080, global.active_y + global.active_h - global.view_yview);
    if (diffX > 0) {
		global.view_xview -= diffX;
	}
	if (diffY > 0) {
		global.view_yview -= diffY;
	}
	global.view_xview -= 8 * zoom_speed;
    global.view_yview -= 4.5 * zoom_speed;
}

global.view_xview = clamp(global.view_xview, global.active_x, global.active_x + global.active_w - view_wview);
global.view_yview = clamp(global.view_yview, global.active_y, global.active_y + global.active_h - view_hview);

camera_set_view_pos(camera, global.view_xview, global.view_yview);
camera_set_view_size(camera, view_wview, view_hview);
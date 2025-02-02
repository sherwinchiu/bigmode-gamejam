if (global.week_end && !global.leveled_up) {
	if (global.cur_level < max_level) {
		global.cur_level++;
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
		global.paused = false;
		instance_activate_object(inst_8B6E3F4);
		instance_activate_layer("Instances");
		instance_destroy(global.button1);
		instance_destroy(global.button2);
		instance_activate_region(global.active_x, global.active_y, global.active_w, global.active_h, true);
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

var num_c = array_length(global.allConsumers);
for (var i = 0; i < num_c; i++) {
	var cur_c = global.allConsumers[i];
	if (cur_c.x < global.view_xview || cur_c.x > global.view_xview + view_wview || cur_c.y < global.view_yview || cur_c.y > global.view_yview + view_hview) {
		var mid_x = (global.view_xview + view_wview) / 2;
		var mid_y = (global.view_yview + view_hview) / 2;
		var angle = point_direction(mid_x, mid_y, cur_c.x, cur_c.y);
		
	}
}
var mouse_x_start = window_views_mouse_get_x();
var mouse_y_start = window_views_mouse_get_y();
var is_panning = false;

if (mouse_check_button_pressed(mb_middle)) {
	show_debug_message("CLICKED");
    is_panning = true;
	mouse_x_start = window_views_mouse_get_x();
	mouse_y_start = window_views_mouse_get_y();	
}

if (mouse_check_button(mb_middle)) {
	show_debug_message("PANNING");
	view_xview += mouse_x_start - window_views_mouse_get_x();
	view_yview += mouse_y_start - window_views_mouse_get_y();
	show_debug_message(view_xview);
}

var prev_view_x = view_wview;
var prev_view_y = view_hview;

if (mouse_wheel_up()) {
    view_hview -= window_max_h / zoom_speed;
    view_wview -= window_max_w / zoom_speed;
    view_xview += abs(view_wview - prev_view_x) / 2;
    view_yview += abs(view_hview - prev_view_y) / 2;
}

if (mouse_wheel_down()) {
    view_hview += window_max_h / zoom_speed;
    view_wview += window_max_w / zoom_speed;
    view_xview -= abs(view_wview - prev_view_x) / 2;
    view_yview -= abs(view_hview - prev_view_y) / 2;
}

camera_set_view_pos(camera, view_xview, view_yview);
camera_set_view_size(camera, view_wview, view_hview);


if (selected_circle != noone) {
    if (mouse_check_button_released(mb_left)) {
		
		// find what circle you drop it on
        var dest_circle = instance_position(mouse_x, mouse_y, oCircle);

        if (dest_circle != noone && dest_circle != selected_circle) {

            var newWire = instance_create_layer(0, 0, "Instances", oLine);
            newWire.start_circle = selected_circle;
            newWire.end_circle = dest_circle;
			drawWire(newWire.path, newWire.start_circle.x, newWire.start_circle.y, newWire.end_circle.x, newWire.end_circle.y);

            array_push(selected_circle.connected_circles, dest_circle);
            array_push(dest_circle.connected_circles, selected_circle);

            // reset states
            selected_circle.is_selected = false;
            selected_circle = noone;
            dragging_wire = false;
        } else {
            selected_circle.is_selected = false;
            selected_circle = noone;
            dragging_wire = false;
        }
    }
    if (mouse_check_button(mb_left)) {
        dragging_wire = true;
    }
}
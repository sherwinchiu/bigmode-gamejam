hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (clicked) {
	image_alpha = 0;
} else if (hovering) {
	if (mouse_check_button(mb_left)) {
		image_alpha = 0.6; // animation for on click
		alarm[0] = 10;
	} else {
		image_alpha = 0.2; // on hover
	}
} else {
	image_alpha = 0.4;
}



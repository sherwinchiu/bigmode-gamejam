if (pause) { // if game is paused
	
} else {
	if (selected_circle != noone) {
	    if (mouse_check_button_released(mb_left)) {
			// find what circle you drop it on
	        var dest_circle = instance_position(mouse_x, mouse_y, oWireDraggable);

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
}
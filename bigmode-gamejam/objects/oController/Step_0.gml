if (global.paused) { // if game is paused
	
} else {
	if (selected_circle != noone) {
	    if (mouse_check_button_released(mb_left)) {
			// find what circle you drop it on
	        var dest_circle = instance_position(mouse_x, mouse_y, oWireDraggable);

	        if (dest_circle != noone && dest_circle != selected_circle) {	
				
				connectWires(selected_circle, dest_circle);
				
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
	
	// electricity calculations
	checkPower();
}

var ghost_building = instance_create_layer(mouse_x, mouse_y, "Instances", global.producer_order[global.curr_building]);
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

	// display demand for consumers
	//var num_c = array_length(global.allConsumers);
	//if (num_c > 0) {
	//	for (var i = 0; i < num_c; i++) {
	//		var curConsumer = global.allConsumers[i];
	//		draw_set_color(c_aqua);
	//		show_debug_message(string(curConsumer.x) + ", " + string(curConsumer.y));
	//		depth = 100;
	//		draw_text_transformed(100, 100, "4834923", 10, 10, 0);
	//		draw_text(100, 100, "4328");
	//		draw_text(curConsumer.x - 100, curConsumer.y, string(curConsumer.current_demand));
	//		draw_set_color(c_white);
	//		depth = 0;
	//	}
	//}
	
	//show_debug_message(string(global.ghost_building) + ", " + string(global.curr_building));
	
	//if (global.ghost_building == noone && global.curr_building != -1) {
	//	show_debug_message("here");
	//	global.ghost_building = instance_create_layer(mouse_x, mouse_y, "Instances", global.producer_order[global.curr_building]);
	//} else if(global.ghost_building != noone) {
	//	show_debug_message("GHOST BUILDING IS " + str(global.ghost_building));
	//	if (global.ghost_building.producer_type != global.curr_building) {
	//		global.ghost_building = instance_create_layer(mouse_x, mouse_y, "Instances", global.producer_order[global.curr_building]);
	//	}
	//} else if (global.ghost_building != noone && global.curr_building == -1) {
	//	show_debug_message("hi");
	//	instance_deactivate_object(global.ghost_building);
	//	global.ghost_building = noone;
	//}
}
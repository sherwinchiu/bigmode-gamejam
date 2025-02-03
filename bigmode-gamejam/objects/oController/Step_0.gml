
if (selected_circle != noone) {
	if (mouse_check_button_released(mb_left)) {
		// find what circle you drop it on
	    var dest_circle = instance_position(mouse_x, mouse_y, oWireDraggable);

	    if (dest_circle != noone && dest_circle != selected_circle && global.can_connect_wire) {	
			connectWires(selected_circle, dest_circle);
			audio_play_sound(cableafter, 1, false);
	        // reset states
	        selected_circle.is_selected = false;
	        selected_circle = noone;
	        dragging_wire = false;
	    } else {
	        selected_circle.is_selected = false;
	        selected_circle = noone;
	        dragging_wire = false;
			global.can_connect_wire = true;
			//instance_destroy(oWire, true);
	    }
	}
	if (mouse_check_button(mb_left)) {
		if (!dragging_wire) {
			audio_play_sound(cable, 1, false);	
		}
	    dragging_wire = true;
	}
}

if (percent == 0 && !going_to_lose && !global.paused) {
	going_to_lose = true;
	alarm_set(2,  game_get_speed(gamespeed_fps) * 1);
} else if (percent > 0 && going_to_lose) {
	going_to_lose = false;	
	alarm_set(2,  game_get_speed(gamespeed_fps) * 100000);
	lose_counter = 10;
}
checkPower();
if (!audio_is_playing(current_track)) {
	track_selection++;
	if (track_selection > 2) {
		track_selection = 0;	
	}
	current_track = audio_play_sound(tracks[track_selection], 1, false);
}
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
	
	//show_debug_message(string(global.ghost_building_id) + ", " + string(global.curr_building));
	
	//if (global.ghost_building_id != global.curr_building) {
	//	instance_deactivate_object(global.ghost_building);
	//	show_debug_message("delete");
	//	global.ghost_building = noone;
	//	if (global.curr_building == -1) {
	//		global.ghost_building_id = -1;
	//	} else {
	//		global.ghost_building_id = global.curr_building;
	//		show_debug_message("create: " + string(global.ghost_building_id));
	//		global.ghost_building = instance_create_layer(mouse_x, mouse_y, "Instances", global.producer_order[global.ghost_building_id]);
	//		global.ghost_building.is_ghost = true;
	//	}
	//}


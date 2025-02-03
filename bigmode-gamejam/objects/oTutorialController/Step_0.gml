if (dialogue_timer > 0) {
    dialogue_timer--;
} else {
    if (cur_dialogue < array_length(dialogue_text)) {
        cur_dialogue++;
        dialogue_timer = DIALOGUE_TIMER;
        dialogue_break_timer = BREAK_TIMER;
    }
	if (cur_dialogue == 23) {
		audio_stop_sound(City_12);
		room_goto(Gameplay);
    }
    
}

if (cur_dialogue == 3) { // show coal button
    layer_set_visible("GUI", true);
}

if (cur_dialogue == 4) { // waiting for user to click coal mine
    if (global.curr_building != global.COAL_ID) {
        dialogue_timer = 50;
        dialogue_timer++;    
    }
}
if (cur_dialogue == 5) { // place coal mine
    if (!instance_exists(oCoalProducer)) {
        dialogue_timer = 50;
        dialogue_timer++;
    }
}
if (cur_dialogue == 8 && !house_spawned) { // spawn a house
    drawConsumerBuilding(oHouse, sHouse);
	var house = instance_find(oHouse, 0);
	house.current_demand = 1;
	house_spawned = true;
}

if (cur_dialogue == 11 && !buttonSpawned) { // show transmission tower button
    instance_create_layer(45, 780, "GUI", oTransmissionButton);
	buttonSpawned = true;
}
if (cur_dialogue == 12) {//  click transmission tower
	if(global.curr_building != global.TRANMISSIONTOWERID) {
		dialogue_timer = 50;
		dialogue_timer++;
	}
}

if (cur_dialogue == 13) {// place transmission tower
	if (!instance_exists(oTransmission)) {
		dialogue_timer = 50;
		dialogue_timer++;
	}
}

if (cur_dialogue == 14) { // connect from coal mine to transmission tower
	if (instance_number(oLine) < 1) {
		dialogue_timer = 50;
		dialogue_timer++;
	}
}

if (cur_dialogue == 15) { // connect frm tower to house
	if (instance_number(oLine) < 2) {
		dialogue_timer = 50;
		dialogue_timer++;
	}
}

if (cur_dialogue == 16 && !sixteenDone) {
	var house = instance_find(oHouse, 0);
	house.current_demand = 0;	
	sixteenDone = true;
}

if (cur_dialogue == 17) { // show other producer buttons
	instance_create_layer(45, 660, "GUI", oOilSandToolbarButton);
	instance_create_layer(45, 420, "GUI", oTreeToolbarButton);
	instance_create_layer(45, 540, "GUI", oWaterToolbarButton);
	// NEED TO ADD COVERS
}



// connect wires:
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
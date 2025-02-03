show_debug_message(cur_dialogue);
if (dialogue_timer > 0) {
    dialogue_timer--;
} else {
    if (cur_dialogue < array_length(dialogue_text)) {
        cur_dialogue++;
        dialogue_timer = DIALOGUE_TIMER;
        dialogue_break_timer = BREAK_TIMER;
    } else {
        // end of tutorial    
    }
    
}

if (cur_dialogue == 3) { // show coal button
    layer_set_visible("GUI", true);
}

if (cur_dialogue == 4) { // waiting for user to click coal mine
    if (global.curr_building != global.COAL_ID) {
        dialogue_timer = 10;
        dialogue_timer++;    
    }
}
if (cur_dialogue == 5) { // place coal mine
    if (!instance_exists(oCoalProducer)) {
        dialogue_timer = 10;
        dialogue_timer++;
    }
}

if (cur_dialogue == 8 && !house_spawned) { // spawn a house
    drawConsumerBuilding(oHouse, sHouse);
	house_spawned = true;
}

if (cur_dialogue == 12) { // show transmission tower button
    instance_create_layer(45, 780, "GUI", oTransmissionButton);
}

if (cur_dialogue == 13) {//  click transmission tower
	if(global.curr_building != global.TRANMISSIONTOWERID) {
		dialogue_timer = 10;
		dialogue_timer++;
	}
}

if (cur_dialogue == 14) {// place transmission tower
	if (!instance_exists(oTransmission)) {
		dialogue_timer = 10;
		dialogue_timer++;
	}
}

if (cur_dialogue == 15) { // connect from coal mine to transmission tower
	if (instance_number(oLine) < 1) {
		dialogue_timer = 10;
		dialogue_timer++;
	}
}

if (cur_dialogue == 16) { // connect frm tower to house
	if (instance_number(oLine) < 2) {
		dialogue_timer = 10;
		dialogue_timer++;
	}
}

if (cur_dialogue == 18) { // show other producer buttons
	instance_create_layer(45, 660, "GUI", oOilSandToolbarButton);
	instance_create_layer(45, 420, "GUI", oTreeToolbarButton);
	instance_create_layer(45, 540, "GUI", oWaterToolbarButton);
	// NEED TO ADD COVERS
}

if (cur_dialogue == 22) { // trigger week end, make user select one
	pauseGame(false);
	global.producer_inv[global.TRANMISSIONTOWERID] += 3;
}
if (cur_dialogue == 23) { // select & place oil
	if (!instance_exists(oOilSandProducer)) {
		dialogue_timer = 10;
		dialogue_timer++;
	}
}

//if (24) // poewr factory

// if (26) // show battery

// if (28) // show clock

// if (29) // tutorial done
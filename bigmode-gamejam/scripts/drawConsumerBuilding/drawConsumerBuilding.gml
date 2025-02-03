// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawConsumerBuilding(obj, sprite){
	var other_inst_found = true; // assume no instance found
	var inst;
	var random_grass_tile;
	var number_of_tries = 0;
	while (other_inst_found && number_of_tries <= 30) {
		random_grass_tile = instance_find(oGrassTile, irandom_range(0, instance_number(oGrassTile) -1 ));
		// check if outside the drawing will be outside the bounding box
		if (random_grass_tile == noone) {
			break;	
		}
		other_inst_found = false;
		// tile is top, bottom or right of active arrow
		if (random_grass_tile.y <= global.active_y || random_grass_tile.y + sprite_get_height(sprite)/2 >= global.active_y + global.active_h|| random_grass_tile.x + sprite_get_width(sprite)/2 >= global.active_x +global.active_w) {
			other_inst_found = true;
		}
		// check no other tiles are hindering the building
		for (var i = 0; i < array_length(global.tile_order); i++) {
			inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + sprite_get_width(sprite)/2, random_grass_tile.y + sprite_get_height(sprite)/2, global.tile_order[i], false, false);
			if inst != noone && i != 1 {
				other_inst_found = true;
			}
		}
		// check no other consumers are touching
		for (var i = 0; i < array_length(global.consumer_order); i++) {
			inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + sprite_get_width(sprite)/2, random_grass_tile.y + sprite_get_height(sprite)/2, global.consumer_order[i], false, false);
			if inst != noone {
				other_inst_found = true;
			}
		}
		// check not hitting any producer's either, mainly just ran
		for (var i = 0; i < array_length(global.producer_order); i++) {
			inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + sprite_get_width(sprite)/2, random_grass_tile.y + sprite_get_height(sprite)/2, global.producer_order[i], false, false);
			if inst != noone {
				other_inst_found = true;
			}
		}
		number_of_tries++;
	}
	if (number_of_tries <= 30) {
		var drawnConsumer = instance_create_layer(random_grass_tile.x + random_grass_tile.sprite_width, random_grass_tile.y + random_grass_tile.sprite_height, "Instances", obj);
		drawnConsumer.image_xscale = 0.5;
		drawnConsumer.image_yscale = 0.5;
		audio_play_sound(sdThunk, 1, false);
		array_push(global.allConsumers, drawnConsumer);
	}

	// if we tried 100 times to get a tile and nothing, prob infinite loop don't place
	
}
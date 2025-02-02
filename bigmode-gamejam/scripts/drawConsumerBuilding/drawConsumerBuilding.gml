// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawConsumerBuilding(obj, sprite){
	var other_inst_found = true; // assume no instance found
	var inst;
	var random_grass_tile;
	while (other_inst_found) {
		random_grass_tile = instance_find(oGrassTile, irandom_range(0, instance_number(oGrassTile) -1 ));
		// check if outside the drawing will be outside the bounding box
		
		
		if (random_grass_tile == noone) {
			break;	
		}
		other_inst_found = false;
		// tile is top, bottom or right of active arrow
		show_debug_message("sprite hite: " + string(random_grass_tile.y + random_grass_tile.sprite_height));
		show_debug_message(string(global.max_zoom_height));
		if (random_grass_tile.y <= global.min_y_cam || random_grass_tile.y + random_grass_tile.sprite_height >= global.min_y_cam + global.max_zoom_height || random_grass_tile.x + random_grass_tile.sprite_width >= global.min_x_cam +global.max_zoom_width) {
			other_inst_found = true;
		}
		// check no other tiles are hindering the building
		for (var i = 0; i < array_length(global.tile_order); i++) {
			show_debug_message(random_grass_tile == noone);
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
	}

	// draw oHouse on random grass tile
	var drawnConsumer = instance_create_layer(random_grass_tile.x + random_grass_tile.sprite_width, random_grass_tile.y + random_grass_tile.sprite_height, "Instances", oHouse);
	drawnConsumer.image_xscale = 0.5;
	drawnConsumer.image_yscale = 0.5;
	audio_play_sound(sdThunk, 1, false);
	array_push(global.allConsumers, drawnConsumer);
}
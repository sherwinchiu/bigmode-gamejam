// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawConsumerBuilding(obj, sprite){
	var other_inst_found = true; // assume no instance found
	var inst;
	var random_grass_tile;
	while (other_inst_found) {
		random_grass_tile = instance_find(oGrassTile, random_range(0, instance_number(oGrassTile))); 
		other_inst_found = false;
		// check no other tiles are hindering the building
		for (var i = 0; i < array_length(global.tile_order); i++) {
			inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + sprite_get_width(sprite)/4, random_grass_tile.y + sprite_get_height(sprite)/4, global.tile_order[i], false, false);
			if inst != noone && i != 1 {
				other_inst_found = true;
			}
		}
		// check no other consumers are touching
		for (var i = 0; i < array_length(global.consumer_order); i++) {
			inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + sprite_get_width(sprite)/4, random_grass_tile.y + + sprite_get_height(sprite)/4, global.consumer_order[i], false, false);
			if inst != noone {
				other_inst_found = true;
			}
		}
	}

	// draw oHouse on random grass tile
	var drawnConsumer = instance_create_layer(random_grass_tile.x + random_grass_tile.sprite_width, random_grass_tile.y + random_grass_tile.sprite_height, "Instances", oHouse);
	drawnConsumer.image_xscale = 0.25;
	drawnConsumer.image_yscale = 0.25;
	
	array_push(global.allConsumers, drawnConsumer);
}
/// @description Spawn Consumers over random time 
// You can write your code in this editor

// choose a consumer object randomly 
var random_grass_tile = instance_find(oGrassTile, random_range(0, instance_number(oGrassTile)));
var other_inst_found = true; // assume no instance found
var inst;
while (other_inst_found) {
	random_grass_tile = instance_find(oGrassTile, random_range(0, instance_number(oGrassTile))); 
	other_inst_found = false;
	// check no other tiles are hindering the building
	for (var i = 0; i < array_length(global.tile_order); i++) {
		inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + 120, random_grass_tile.y + 120, global.tile_order[i], false, false);
		if inst != noone && i != 1 {
			show_debug_message(string(i));
			other_inst_found = true;
		}
	}
	// check no other consumers are touching
	for (var i = 0; i < array_length(global.consumer_order); i++) {
		inst = collision_rectangle(random_grass_tile.x, random_grass_tile.y, random_grass_tile.x + 120, random_grass_tile.y + 120, global.consumer_order[i], false, false);
		if inst != noone {
			other_inst_found = true;
		}
	}
}

// draw oHouse on random grass tile
var dest_circle = instance_create_layer(random_grass_tile.x, random_grass_tile.y, "Instances", oHouse);
dest_circle.image_xscale = 0.25;
dest_circle.image_yscale = 0.25;
random_grass_tile.has_building = true;
random_consumer_spawn = random_range(10, 20);
alarm_set(1, game_get_speed(gamespeed_fps) * random_consumer_spawn); // reset timer
array_push(global.allConsumers, dest_circle);
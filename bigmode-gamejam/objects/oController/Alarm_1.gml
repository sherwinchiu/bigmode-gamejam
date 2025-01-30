/// @description Spawn Consumers over random time 
// You can write your code in this editor

// choose a consumer object randomly 
var random_grass_tile = instance_find(oGrassTile, random_range(0, instance_number(oGrassTile)));
while (random_grass_tile.has_building) { // if there's a building on it
	// keep finding a tile until we find one 
	random_grass_tile = instance_find(oGrassTile, random_range(0, instance_number(oGrassTile))); 	
}

// draw oHouse on random grass tile
var dest_circle = instance_create_layer(random_grass_tile.x, random_grass_tile.y, "Instances", oHouse);
dest_circle.image_xscale = 0.25;
dest_circle.image_yscale = 0.25;
random_grass_tile.has_building = true;
random_consumer_spawn = random_range(10, 20);
alarm_set(1, game_get_speed(gamespeed_fps) * random_consumer_spawn); // reset timer
array_push(global.allConsumers, dest_circle);
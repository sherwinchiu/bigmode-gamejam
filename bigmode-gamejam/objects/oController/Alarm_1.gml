/// @description Spawn Consumers over random time 
// You can write your code in this editor

// choose a consumer object randomly 
show_debug_message("RUN");
drawConsumerBuilding(oHouse, sHouse);


random_consumer_spawn = random_range(10, 20);
alarm_set(1, game_get_speed(gamespeed_fps) * random_consumer_spawn); // reset timer
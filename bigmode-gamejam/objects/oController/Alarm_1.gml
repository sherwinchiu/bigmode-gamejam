/// @description Spawn Consumers over random time 
// You can write your code in this editor

// choose a consumer object randomly 
show_debug_message("RUN");

var building_num = irandom_range(0, 100);
for(var i = 0; i < 4; i++){
	if (building_num < consumer_probability[i]) {
		drawConsumerBuilding(global.consumer_order[i], consumer_sprites[i]);
		break;
	}
}

if (global.week_num/2 < 4) {
	random_consumer_spawn = random_range(10-global.week_num/2, 12 -global.week_num/2);
} else {
	random_consumer_spawn = random_range(4, 6);
}


alarm_set(1, game_get_speed(gamespeed_fps) * random_consumer_spawn); // reset timer
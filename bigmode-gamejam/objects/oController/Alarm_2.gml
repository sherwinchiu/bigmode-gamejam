/// @description Insert description here
// You can write your code in this editor

lose_counter--;

if (lose_counter == 0) {
	room_goto_next();	
}

alarm_set(2,  game_get_speed(gamespeed_fps) * 1);

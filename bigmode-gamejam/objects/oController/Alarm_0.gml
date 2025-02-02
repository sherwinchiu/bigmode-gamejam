/// @description New Week Screen
// You can write your code in this editor


// pause for week end
pauseGame(false);
wire_length_available += 40;

alarm_set(0, game_get_speed(gamespeed_fps) * 15);  // reset alarm on call
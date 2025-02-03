/// @description New Week Screen
// You can write your code in this editor


// pause for week end

pauseGame(false);
global.week_num++;
global.producer_inv[global.TRANMISSIONTOWERID] += 3;

alarm_set(0, game_get_speed(gamespeed_fps) * 40);  // reset alarm on call
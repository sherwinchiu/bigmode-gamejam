// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pauseGame(endWeekOrPauseButton){
	// if endWeekOrPauseButton -> False, the week ended
	// if endWeekOrPauseButton -> True, the player just pressed the pause button
	global.paused = true;
	instance_deactivate_all(true);
	layer_destroy("Week_Display");
	layer_create(-101, "Week_Display");
	if (!endWeekOrPauseButton) {
		global.week_end = true;
		global.leveled_up = false;
		show_debug_message("week ended");
		// show Week_Display 
		//instance_activate_layer("Week_Display");
		instance_activate_layer("Week_Display");
		var lay_id = layer_get_id("Week_Display");
		layer_set_visible(lay_id, true);
		// random number between 1-6 to choose which producer to choose
		// create the two global.buttons
		var num1 = irandom_range(0, 100);
		var num2 = irandom_range(0, 100);
		while (num1 == num2) {
			num2 = irandom_range(0, 100);
		}
		var producer_probability = [35, 70, 90, 100];
		var chosen_first = 0;
		depth = 300;
		for(var i = 0; i < 4; i++) {
			if (num1 < producer_probability[i]) {
				global.button1 = instance_create_layer(480, 405, "Week_Display", global.week_display_order[i]);
				chosen_first = i;
				break;
			}
		}
		
		for(var i = 0; i < 4; i++) {
			if (num2 < producer_probability[i] && i != chosen_first) {
				global.button2 = instance_create_layer(1080, 405, "Week_Display", global.week_display_order[i]);
				break;
			}
		}
		
		//var button2 = instance_create_layer(1080, 405, "Week_Display",  global.week_display_order[num2]);
		depth = 0;
		var background_pause = instance_create_layer(0, 0, "Week_Display", oWeekPauseBackground);
		background_pause.image_xscale = 4;
		background_pause.image_yscale = 4;
	} else { // player pressed pause
		
		
	}
}

function unpauseGame(){
	// activates the camera, which will in-turn activate everything in the game
	instance_destroy(oWeekPauseBackground);
	instance_deactivate_layer("Week_Display");
	var lay_id = layer_get_id("Week_Display");
	layer_set_visible(lay_id, false);
	instance_activate_object(inst_789A4457);
	instance_activate_object(inst_8B6E3F4);
	global.paused = false;
}
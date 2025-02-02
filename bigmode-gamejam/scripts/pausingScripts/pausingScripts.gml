// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pauseGame(endWeekOrPauseButton){
	// if endWeekOrPauseButton -> False, the week ended
	// if endWeekOrPauseButton -> True, the player just pressed the pause button
	instance_deactivate_all(true);
	if (!endWeekOrPauseButton) {
		global.week_end = true;
		global.leveled_up = false;
		show_debug_message("week ended");
		// show Week_Display 
		var lay_id = layer_get_id("Week_Display");
		layer_set_visible(lay_id, true); 

		// random number between 1-6 to choose which producer to choose
		// create the two buttons
		depth = 100;
		var button1 = instance_create_layer(global.view_xview + 500, global.view_yview + 500, "Week_Display", oContinueButton);
		depth = 0;
		var background = instance_create_layer(global.view_xview, global.view_yview, "Week_Display", oWeekPauseBackground);
	} else { // player pressed pause
		
		
	}
	

	

}

function unpauseGame(){
	// activates the camera, which will in-turn activate everything in the game
	instance_activate_object(inst_789A4457); 
}
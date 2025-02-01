// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function placeBuilding(curr_tile, curr_x, curr_y){
	// check if that the current building the player selected is the same as curr_tile
	if (global.curr_building == curr_tile) {
		// if it's the same, then you can place the building
		
		if (global.producer_inv[global.curr_building] > 0) {
		// TODO: change oProducerParent to an object in global.producer_order
			var newBuilding = instance_create_layer(curr_x, curr_y, "Instances", global.producer_order[global.curr_building]);
			if (global.curr_building == global.COAL_ID || 
				global.curr_building == global.OIL_ID ||
				global.curr_building == global.WATER_ID ||
				global.curr_building == global.TREE_ID) {
			
				array_push(global.allProducers, newBuilding);
			}
			global.producer_inv[global.curr_building]--;
			global.curr_building = -1;
		}
		//global.energy_output += global.producer_energy[global.curr_building];
	} else { // if not, invalid
		
	}
}
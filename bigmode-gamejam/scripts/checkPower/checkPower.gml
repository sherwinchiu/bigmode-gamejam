function checkPower() {
	var numP = array_length(global.allProducers);
	var n = array_length(global.allConsumers);
	global.totalDemand = 0;
	global.curProvided = 0;
	// reset demand
	for (var i = 0; i < n; i++) {
		global.totalDemand += global.consumer_demand[global.allConsumers[i].consumer_type];
		global.allConsumers[i].current_demand = global.consumer_demand[global.allConsumers[i].consumer_type];
	}
	
	// this can be optimized
	for (var i = 0; i < numP; i++) {
		var curP = global.allProducers[i];
		var numC = array_length(curP.connected_consumers);
		var powerGenerated = global.producer_energy[curP.producer_type];
		var powerDistributed = powerGenerated / numC;
		for (var j = 0; j < numC; ++j) {
			curP.connected_consumers[j].current_demand -= powerDistributed;
			global.curProvided += powerDistributed;
		}
	}
	for (var i = 0; i < n; i++) {
		if (global.allConsumers[i].current_demand > 0) {
			//show_debug_message("ID: " + string(i) + " !!! NOT POWERED: need " + string(global.allConsumers[i].current_demand));
		}
	}
}
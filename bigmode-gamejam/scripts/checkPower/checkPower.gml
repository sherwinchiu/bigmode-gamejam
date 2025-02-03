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
	for (var i = 0; i < numP; i++) {
		global.allProducers[i].energy_used = 0;	
	}
	
	// this can be optimized
	for (var i = 0; i < numP; i++) {
		var curP = global.allProducers[i];
		var powerGenerated = global.producer_energy[curP.producer_type];
		var powerDistributed = powerGenerated / ds_map_size(curP.connected_consumers);
		for (var k = ds_map_find_first(curP.connected_consumers); !is_undefined(k); k = ds_map_find_next(curP.connected_consumers, k)) {
			k.current_demand -= powerDistributed;
			global.curProvided += powerDistributed;
			curP.energy_used += powerDistributed;
		}
	}
}
function createComponent(){
	var curID = global.component_id;
	global.component_id += 1;
	
	global.components[curID] = [];
	global.connections[curID] = [];
	global.energy_output[curID] = 0;
	global.energy_in[curID] = 0;
	
	return cur_id;	
}
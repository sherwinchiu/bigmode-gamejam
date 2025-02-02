for (var i = ds_map_find_first(connected_producers); !is_undefined(i); i = ds_map_find_next(connected_producers, i)) {
	for (var j = ds_map_find_first(connected_consumers); !is_undefined(j); j = ds_map_find_next(connected_consumers, j)) {
		show_debug_message(i);
		show_debug_message(j);
		//if(ds_map_exists(j.connected_producers, i)) {
		//	j.connected_producers[i]--;
		//	if (j.connected_producers[i] <= 0) {
		//		ds_map_delete(j.connected_producers, i);
		//	}
		//}
		if (ds_map_exists(i.connected_consumers, j)) {
			i.connected_consumers[?j]--;
			if (i.connected_consumers[?j] <= 0) {
				ds_map_delete(i.connected_consumers, j);	
			}
		}
	}
}
var tile = instance_position(x, y, oTileParent);
tile.has_building = false;
global.producer_energy[global.TRANMISSIONTOWERID]++;
instance_destroy();
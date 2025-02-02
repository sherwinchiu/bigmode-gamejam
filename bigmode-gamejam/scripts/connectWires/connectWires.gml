function addToMap(map, val) {
	if(ds_map_exists(map, val)) map[?val]++;
	else map[?val] = 1;
}

function union_map(map1, map2) {
	var new_map = ds_map_create();
	
	for (var k = ds_map_find_first(map1); !is_undefined(k); k = ds_map_find_next(map1, k)) {
		new_map[?k] = map1[?k];
	}
	
	for (var k = ds_map_find_first(map2); !is_undefined(k); k = ds_map_find_next(map2, k)) {
		new_map[?k] = map2[?k];
	}
	
	ds_map_clear(map1);
	ds_map_clear(map2);
	
	
	for (var k = ds_map_find_first(new_map); !is_undefined(k); k = ds_map_find_next(new_map, k)) {
		map1[?k] = new_map[?k];
		map2[?k] = new_map[?k];
	}
	
	ds_map_destroy(new_map);
}

function connectWires(c1, c2) {
	// hard coded numbers in parent object
	var producerID = 0;
	var consumerID = 1;
	var transmissionID = 2;
	var connected = false;
	
	if (c1.building_type > c2.building_type) return connectWires(c2, c1);
	
	if (c1.building_type == producerID && c2.building_type == transmissionID && !ds_map_exists(c2.direct_connections, c1)) {
		// add all consumers connected to transmission tower to the producer
		for (var k = ds_map_find_first(c2.connected_consumers); !is_undefined(k); k = ds_map_find_next(c2.connected_consumers, k)) {
			addToMap(c1.connected_consumers, k);
		}
		addToMap(c2.connected_producers, c1);
		addToMap(c2.direct_connections, c1);
		connected = true;
	}
	if (c1.building_type == consumerID && c2.building_type = transmissionID && !ds_map_exists(c2.direct_connections, c1)) {
		// add consumer to transmission tower's array + add consumer to all producers connected to tranmission tower
		addToMap(c2.connected_consumers, c1);
		for (var k = ds_map_find_first(c2.connected_producers); !is_undefined(k); k = ds_map_find_next(c2.connected_producers, k)) {
			addToMap(k.connected_consumers, c1);
		}

		addToMap(c2.direct_connections, c1);
		connected = true;
	}
	
	if (c1.building_type == transmissionID && c2.building_type == transmissionID && !ds_map_exists(c2.direct_connections, c1)) {
		// this is unoptimized :(
		
		union_map(c1.connected_producers, c2.connected_producers);
		union_map(c1.connected_consumers, c2.connected_consumers);	
		
		for (var k = ds_map_find_first(c1.connected_producers); !is_undefined(k); k = ds_map_find_next(c1.connected_producers, k)) {
			union_map(k.connected_consumers, c1.connected_consumers);
		}
		
		connected = true;
		addToMap(c1.direct_connections, c2);
		addToMap(c2.direct_connections, c1);
	}
	if (connected) {
		var newWire = instance_create_layer(0, 0, "Instances", oLine);
	    newWire.start_circle = c1;
	    newWire.end_circle = c2;
	    // reset states
	}
}



/*
new notes:

RULE:
LINES CONNECT:
producer -> transmission tower
transmission tower -> consumer
transmission tower -> transmission tower
---

producer has array of consumers attached
line pushes consumer to producer's array

keep DAG of producers & consumers

ie. if connecting 

producer end wires weights divided, consumer end wire weights added (see whiteboard screenshot)
transformer adds wire weights and can redistribute to consumers
transformer contains array of consumers connected -> if connecting a new producer to transformer, the producer gets all the consumers in the transformer's array


each consumer has attribute containing how much energy_in


main game loop contains array of producers
*/

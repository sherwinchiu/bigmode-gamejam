function connectWires(c1, c2) {
	// hard coded numbers in parent object
	var producerID = 0;
	var consumerID = 1;
	var transmissionID = 2;
	var connected = false;
	
	if (c1.building_type > c2.building_type) return connectWires(c2, c1);
	
	if (c1.building_type == producerID && c2.building_type == transmissionID && !array_contains(c2.direct_connections, c1)) {
		// add all consumers connected to transmission tower to the producer
		var n = array_length(c2.connected_consumers);
		if (n > 0) {
			for (var i = 0; i < n; i++) {
				array_push(c1.connected_consumers, c2.connected_consumers[i]);
			}
		}
		array_push(c2.connected_producers, c1);
		array_push(c2.direct_connections, c1);
		connected = true;
	}
	if (c1.building_type == consumerID && c2.building_type = transmissionID && !array_contains(c2.direct_connections, c1)) {
		// add consumer to transmission tower's array + add consumer to all producers connected to tranmission tower
		array_push(c2.connected_consumers, c1);
		var n = array_length(c2.connected_producers);
		
		for (var i = 0; i < n; i++) {
			array_push(c2.connected_producers[i].connected_consumers, c1);
		}
		array_push(c2.direct_connections, c1);
		connected = true;
	}
	
	if (c1.building_type == transmissionID && c2.building_type == transmissionID && !array_contains(c2.direct_connections, c1)) {
		// this is unoptimized :(
		var p_union = array_unique(array_concat(c1.connected_producers, c2.connected_producers));

		c1.connected_producers = p_union;
		c2.connected_producers = p_union;
		
		var c_union = array_unique(array_concat(c1.connected_consumers, c2.connected_consumers));
		c1.connected_consumers = c_union;
		c2.connected_consumers = c_union;
		
		var prod_len = array_length(p_union);
		for (var i = 0; i < prod_len; i++) {
			var temp = array_unique(array_concat(p_union[i].connected_consumers, c_union));	
			p_union[i].connected_consumers = temp;
		}
		
		connected = true;
		array_push(c1.direct_connections, c2);
		array_push(c2.direct_connections, c1);
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

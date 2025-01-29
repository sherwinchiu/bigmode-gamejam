function connectWires(c_1, c_2){
	if (c_1.id == -1 && c_2.id == -1) { // both not part of a component currently
		var new_c = createComponent();
		
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

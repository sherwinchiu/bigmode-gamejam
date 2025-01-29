function connectWires(c_1, c_2){
	if (c_1.id == -1 && c_2.id == -1) { // both not part of a component currently
		var new_c = createComponent();
		
	}
}

/*
-----THIS FILE-----
graph has connected components -> producers, consumers
global component_id variable that tracks the current id of the component you're on
-> createComponent() returns the current id and adds it

connectWires is called whenever you connect a wire between two things (producer & consumer for now)
1. check if both have id = -1 (not part of a component rn)
-> assign them to a new component using createComponent()
-> add edge to connections[cur_id]
-> update energy_consumed[cur_id] and energy_produced[cur_id]
-> add consumer to components[cur_id] (idk how this gets referenced later to tell which obj it is -- hopefully a gm fn for that)
2. if one has -1 one is not -1
-> assign the -1 to the one that is not -1
-> if its a consumer add to connections[thing_id]
-> update energy_consumed[thing_id]
-> add edge to connections[cur_id]
3. if both are not -1
-> choose c1 (arbitrary choice) to be the new component
-> change all of c2's ids to c1 (c2 index useless now)
-> add energy_consumed[c2.id] and energy_output[c2.id] to energy_consumed[c1.id] and energy_output[c1.id]
-> move connections[c2.id] to connections[c1.id]
-> move components[c2.id] to connections[c1.id]

-----DISTRIBUTE POWER FN-----
loop through each component id until current component id
add to total produced global var based on energy_output arr
divide the energy_output[id] over # of consumers and then add to the energy_in[id]
add to total consumed global var based on energy_consumed arr

-----CHECK POWER FN-----
loop through consumers to see if energy required for each consumer type is less than energy_in[id]
-> if no, then display red ! / return false or something

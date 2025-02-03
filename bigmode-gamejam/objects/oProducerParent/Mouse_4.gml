if (!is_ghost) {
	is_selected = true;
	if (global.tutorial) oTutorialController.selected_circle = id;
	else oController.selected_circle = id;
}
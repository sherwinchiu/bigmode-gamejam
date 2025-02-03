if (dialogue_break_timer > 0) {
	dialogue_break_timer--;
} else {
	if (dialogue_timer > 0) {
		draw_sprite(dialogue_arr[cur_dialogue], 0, 960, 300);
		draw_set_color(c_black);
		draw_set_font(fTutorial);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(960, 300, dialogue_text[cur_dialogue]);
	}
}
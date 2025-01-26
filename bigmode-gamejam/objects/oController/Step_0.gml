if (mouse_check_button_pressed(mb_left)) {
    var circle = instance_position(mouse_x, mouse_y, oCircle);
    
    if (circle != noone) {        
        if (selected_circle == noone) { // user clicked first circle
            selected_circle = circle;
            circle.is_selected = true;
        } else { // user clicked second circle
            if (selected_circle != noone) {
                var line = instance_create_layer(0, 0, "Instances", oLine);
                if (line != noone) {
                    line.start_circle = selected_circle;
                    line.end_circle = circle;

                    array_push(selected_circle.connected_circles, circle);
                    array_push(circle.connected_circles, selected_circle);

                    selected_circle.is_selected = false;
                    selected_circle = noone;
                }
            }
        }
    }
}
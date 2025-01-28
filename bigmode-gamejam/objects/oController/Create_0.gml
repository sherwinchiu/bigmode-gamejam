/// @description On Gameplay Start

selected_circle = noone;
dragging_wire = false;

wire_length_available = 0; // total wire length for player to use

pause = false;

window_set_size(1920, 1080);

global.energy_output = 0; // tracking total energy output of producers
global.curr_building = 0; // building used for building on producers

// track producers & it's tiles
tile_order = [oCoalTile, oGrassTile, oOilSandTile, oTreeTile, oWaterTile];
// track respective producer to each tile
global.producer_order = [oCoalProducer, oGrassProducer, oOilSandProducer, oTreeProducer, oWaterProducer];
// track producer points
global.producer_energy = [2, 0, 10, 2, 3];

// disable week display
week_num = 1;

var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, false); 

alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // new week every 2 minutes




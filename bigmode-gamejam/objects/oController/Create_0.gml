/// @description On Gameplay Start

selected_circle = noone;
dragging_wire = false;

// reset viewport and camera
global.res_width = 1920;
global.res_height = 1080;

window_set_size(global.res_width, global.res_height);
surface_resize(application_surface, global.res_width, global.res_height);


wire_length_available = 0; // total wire length for player to use

global.paused = false;

global.ghost_building_id = -1;
global.ghost_building = noone;

window_set_size(1920, 1080);

global.week_end = false;
global.can_connect_wire = true;


global.curr_building = -1; // building used for building on producers
global.allProducers = []; // store all producers
global.allConsumers = [];

//-------------------- PRODUCER TRACKING -----------------------------
// track producers & it's tiles
global.tile_order = [oCoalTile, oGrassTile, oOilSandTile, oTreeTile, oWaterTile];
// track respective producer to each tile
global.producer_order = [oCoalProducer, oOilSandProducer, oTreeProducer, oWaterProducer, oTransmission]; // ***** TRANSMISSION TOWER TEMPORARY FOR TESTING*****
global.COAL_ID = 0;
global.OIL_ID = 1;
global.TREE_ID = 2;
global.WATER_ID = 3;

global.TRANMISSIONTOWERID = 4; // *****TEMPORARY FOR TESTING*****

// track producer points
global.producer_energy = [2, 10, 2, 3];
global.producer_inv = [3, 2, 5, 2, 100];
buttons = [oCoalToolbarButton, oOilSandToolbarButton, oTreeToolbarButton, oWaterToolbarButton, oTransmissionButton];
len = array_length(buttons);
//-------------------- CONSUMER TRACKING ------------------------------
//global.consumer_order = [oHouse, oApartment, oBusiness, oFactory, oCommunityCenter, oEmergency, oAirport];
global.consumer_order = [oHouse];
global.HOUSE_ID = 0;
global.APARTMENT_ID = 1;
global.BUSINESS_ID = 2;
global.FACTORY_ID = 3;
global.COMMUNITY_ID = 4;
global.EMERGENCY_ID = 5;
global.AIRPORT_ID = 6;

global.consumer_demand = [1, 5, 5, 10, 7, 4, 3];

//-------------------- GENERATE RANDOM CONSUMERS OVER TIME ------------------------------
random_consumer_spawn = random_range(5, 15);
alarm_set(1, game_get_speed(gamespeed_fps) * 1);


//-------------------- DISPLAY WEEK END ------------------------------
// disable week display
week_num = 1;

var lay_id = layer_get_id("Week_Display");
layer_set_visible(lay_id, false); 

alarm_set(0, game_get_speed(gamespeed_fps) * 5);
// alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // new week every 2 minutes


/// @description On Gameplay Start
randomize();
selected_circle = noone;
dragging_wire = false;

global.controller = self; 

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

global.sounds = [coal, water, oil, wood, wire];
global.curr_building = -1; // building used for building on producers
global.allWires = []; // stores all the wire 
global.allProducers = []; // store all producers
global.allConsumers = [];

//-------------------- PRODUCER TRACKING -----------------------------
// track producers & it's tiles
global.tile_order = [oCoalTile, oGrassTile, oOilSandTile, oTreeTile, oWaterTile];

// track respective producer to each tile
global.producer_order = [oCoalProducer, oTreeProducer, oWaterProducer, oOilSandProducer, oTransmission]; // ***** TRANSMISSION TOWER TEMPORARY FOR TESTING*****
global.week_display_order = [oCoalWeekDisplay, oTreeWeekDisplay, oWaterWeekDisplay, oOilWeekDisplay];
global.COAL_ID = 0;
global.TREE_ID = 1;
global.WATER_ID = 2;
global.OIL_ID = 3;

global.TRANMISSIONTOWERID = 4; // *****TEMPORARY FOR TESTING*****

// track producer points
global.producer_energy = [3, 1, 2, 10];
global.producer_inv = [1, 2, 1, 1, 3];
global.producers_to_add = [2, 6, 3, 1];
global.curProvided = 0;

global.buttons = [oCoalToolbarButton, oTreeToolbarButton, oWaterToolbarButton, oOilSandToolbarButton, oTransmissionButton];
len = array_length(global.buttons);
//-------------------- CONSUMER TRACKING ------------------------------
//global.consumer_order = [oHouse, oApartment, oBusiness, oFactory, oCommunityCenter, oEmergency, oAirport];
global.consumer_order = [oHouse, oApartment, oFactory, oAirport];
consumer_sprites = [sHouse, sApartment, sFactory, sAirport];
consumer_probability = [70, 85, 95, 100];
global.HOUSE_ID = 0;
global.APARTMENT_ID = 1;
global.FACTORY_ID = 2;
global.AIRPORT_ID = 3;
global.totalDemand = 0;

global.consumer_demand = [1, 3, 5, 7];
global.consumer_offset = [[120, 120], [180, 120], [240, 180], [300, 240]]; // for drawing lightbulbs at top right

//-------------------- GENERATE RANDOM CONSUMERS OVER TIME ------------------------------
random_consumer_spawn = random_range(5, 15);
alarm_set(1, game_get_speed(gamespeed_fps) * 1);


//-------------------- DISPLAY WEEK END ------------------------------
// disable week display
global.week_num = 0;

instance_deactivate_layer("Week_Display");

alarm_set(0, 1);
// alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // new week every 2 minutes

global.score = 0;

global.button1 = 0;
global.button2 = 0;
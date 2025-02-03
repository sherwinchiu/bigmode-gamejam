/// @description On Gameplay Start
DIALOGUE_TIMER = game_get_speed(gamespeed_fps) * 3;
BREAK_TIMER = game_get_speed(gamespeed_fps) * 0.5;
dialogue_timer = DIALOGUE_TIMER;
dialogue_break_timer = BREAK_TIMER;
cur_dialogue = 20;
dialogue_arr = [sTutorial2, sTutorial2b, sTutorial4, sTutorial2a, sTutorial3, sTutorial3a, sTutorial5, sTutorial2a, sTutorial4a, sTutorial5, sTutorial4a, sTutorial2a, sTutorial3a, sTutorial4, sTutorial5, sTutorial5, sTutorial3, sTutorial3a, sTutorial5, sTutorial4a, sTutorial4a, sTutorial4a, sTutorial4a];
dialogue_text = ["Welcome to electriCity!", "Based on the theme of \"Power\"", "electriCity is about keeping the city powered!", "This is a power producer.", "Click on the coal producer to select it.", "Click on a coal mine tile (navy) to place it.", "The number indicates how much power the producer provides.", "This is a power consumer.", "The lightbulb indicates how \"powered\" each consumer is.", "The number indicates how much power the consumer needs.", "You cannot directly connect producers with consumers.", "This is a transmission tower.", "Click on the transmission tower to select it.", "Click somewhere to place the transmission tower.", "Drag from the coal mine to the transmission tower to connect them.", "Drag from the transmission tower to the house to connect them.", "Nice! This house is now fully powered.", "These are the other available producers.", "Oil sands are yellow, tree tiles are green, and water tiles are blue.", "Each producer generates a different amount of power.", "At the end of each week, you receive more materials.", "If your city goes without power for too long, you lose :(", "You have completed the tutorial. Good luck and have fun!"];
house_spawned = false;
alreadyPaused = false;
global.tutorial = true;
randomize();
show_debug_message(array_length(dialogue_arr));
show_debug_message(array_length(dialogue_text));
selected_circle = noone;
dragging_wire = false;
buttonSpawned = false;
sixteenDone = false;
// 5 battery bars = all powered, anything unpowered is lower battery bar can have max 5 things unpowered
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

global.sounds = [coal, wood, water, oil, wire];
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
global.producer_inv = [1, 4, 2, 1, 5];
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
global.consumers_lightbulbs = 0;
instance_deactivate_layer("Week_Display");

alarm_set(0, 1);
// alarm_set(0, game_get_speed(gamespeed_fps) * 120);  // new week every 2 minutes

global.score = 0;

global.battery_filled = 0;

global.button1 = 0;
global.button2 = 0;
going_to_lose = false;
percent = 0;
lose_counter = 10;
global.isTouchingToolbar = false;


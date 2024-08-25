/*
	Author: PrinceF90 
 
	Description: 
		Configuration for Task System
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0
*/

// true to turn on debug
TaskDebug = false; 

// Time interval to check for task status
Task_CheckInterval = 3;
// Minimum patrol time in minutes
Task_PatrolTimeMin = 1;
// Maximum patrol time in minutes
Task_PatrolTimeMax = 2;
// Task area multiplier. Increase if task area is too small.
Task_AreaMultiplier = 0.5;
// The count of enemy units to perform QRF while on a mission. Format ARRAY[min, max]
Task_AmbushGroupSize = [4,16];
// The count of enemy group to perfom patrol on AO. Format ARRAY[min, max]
Task_PatrolGroupCount = [1,6];
// The distance for each waypoint for enemy patrol group. 
Task_PatrolWPDistance = 100;
// Chance that hvt will appear on ambush mission
Task_AmbushHVTSpawnChance = 45;
// Chance that assets will appear on mission. Note that not all missions will spawn assets
Task_SeizableAssetSpawnChance = 50;
// The group count of enemy QRF for task support
Task_SupportEnemyQRFGroupCount = 2;

Task_BaseMarkers = ["base_0"];
// Add your custom patrol task location here. Formatted by [[STRING:location name, ARRAY[x,y,z]:position, NUMBER:direction, ARRAY[x,y]:size, BOOL:isRectangle]];
Task_PatrolLocations = []; 
// Add your custom ambush task location here. Formatted by [[STRING:location name, ARRAY[x,y,z]:position, NUMBER:direction, ARRAY[x,y]:size, BOOL:isRectangle]];
Task_HideoutLocations = []; 
// Locations that are not suitable as hideout markers
Task_HideoutBlacklist = ["factory", "refinery", "radio", "industrial", "Comms", "power"];
// Classnames of seizeable assets.
Task_SeizableAssetModels = 
[
	"Box_FIA_Wps_F", 
	"Box_FIA_Ammo_F", 
	"B_G_Offroad_01_F", 
	"B_G_Van_01_fuel_F", 
	"B_G_Offroad_01_AT_F", 
	"B_G_Offroad_01_armed_F", 
	"B_G_Offroad_01_repair_F", 
	"B_G_Quadbike_01_F", 
	"B_G_Van_01_transport_F", 
	"B_G_Van_02_vehicle_F", 
	"B_G_Van_02_transport_F"
];



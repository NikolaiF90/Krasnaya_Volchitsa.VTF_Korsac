/*
	Author: PrinceF90 
 
	Description: 
		Configuration for Task System
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0

	Example: 
		[] call F90_fnc_taskEconomy;
*/

TaskDebug = true; // true to turn on debug
[TaskDebug, "configureTask", "Configuring task system...", true] call F90_fnc_debug;

// Minimum patrol time in minutes
Task_PatrolTimeMin = 1;
// Maximum patrol time in minutes
Task_PatrolTimeMax = 2;

Task_TownMarkers = ["town_0", "town_1", "town_2", "town_3", "town_4", "town_5", "town_6", "town_7", "town_8", "town_9", "town_10", "town_11", "town_12", "town_13"];
Task_BaseMarkers = ["base_0"];
Task_HideoutMarkers = ["ho_01", "ho_02", "ho_03", "ho_04", "ho_05", "ho_06", "ho_07", "ho_08", "ho_09", "ho_10"]; 

// Chance that hvt will appear on ambush mission
Task_AmbushHVTSpawnChance = 45;

// Do not edit
configureTaskDone = true;
[TaskDebug, "configureTask", "Done configuring task.", true] call F90_fnc_debug;
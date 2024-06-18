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

// Minimum patrol time in minutes
Task_PatrolTimeMin = 1;
// Maximum patrol time in minutes
Task_PatrolTimeMax = 2;

Task_BaseMarkers = ["base_0"];
Task_HideoutMarkers = ["ho_01", "ho_02", "ho_03", "ho_04", "ho_05", "ho_06", "ho_07", "ho_08", "ho_09", "ho_10"]; 

// Chance that hvt will appear on ambush mission
Task_AmbushHVTSpawnChance = 45;

// Do not edit
configureTaskDone = true;
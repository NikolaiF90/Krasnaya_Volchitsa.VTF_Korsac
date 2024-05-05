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



configureTaskDone = true; // Do not edit
[TaskDebug, "configureTask", "Done configuring task.", true] call F90_fnc_debug;
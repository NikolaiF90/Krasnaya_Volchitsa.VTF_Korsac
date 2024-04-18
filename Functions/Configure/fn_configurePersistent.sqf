/*
	Author: PrinceF90 
 
	Description: 
		Configuration for ARMAPERSCORE
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0

	Example: 
		[] call F90_fnc_configurePersistent;
*/
PersistentDebug = true; // true to turn on debug
[PersistentDebug, "configurePersistent", "Configuring persistence system...", true] call F90_fnc_debug;

Persistent_Host = player; // can be your player name or just player

Persistent_SavePrefix = "KrasnayaVolchitsa"; // The script will find saves from file by using this prefix
Persistent_SaveIntervals = 600; // This does nothing for now

// Add anything to save here
Persistent_VehiclesToSave = [];
Persistent_ContainersToSave = [];
Persistent_VariablesToSave = [];

configurePersistentDone = true; // do not change this
[PersistentDebug, "configurePersistent", "Done configuring persistence system.", true] call F90_fnc_debug;
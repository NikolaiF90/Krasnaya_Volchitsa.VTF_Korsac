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

// The script will find saves from file by using this prefix
Persistent_SavePrefix = "KrasnayaVolchitsa"; 
// Autosave intervals
Persistent_SaveIntervals = 600; 

// Add anything to save here
Persistent_VehiclesToSave = [];
Persistent_ContainersToSave = [];
Persistent_VariablesToSave = [];

// Add anything you do not wish to save here
Persistent_MarkerBlacklists = [];
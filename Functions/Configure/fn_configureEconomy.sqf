/*
	Author: PrinceF90 
 
	Description: 
		Configuration for Economy System
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0

	Example: 
		[] call F90_fnc_configureEconomy;
*/

EconomyDebug = true;
[EconomyDebug, "configureEconomy", "Configuring economy system...", true] call F90_fnc_debug;

Economy_PlayerStartingMoney = 500; // Default milcash for players
Economy_DefaultBLUFORMoney = 5000; // Milcash for all spawned BLUFOR units
Economy_DefaultOPFORMoney = 7000; // Milcash for all spawned OPFOR units
Economy_DefaultGUERMoney = 5000; // Milcash for all spawned GUER units
Economy_DefaultCIVMoney = 5000; // Milcash for all spawned CIV units

configureEconomyDone = true; // do not change this
[EconomyDebug, "configureEconomy", "Done configuring economy system.", true] call F90_fnc_debug;
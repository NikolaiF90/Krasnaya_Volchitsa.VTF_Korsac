Scenario_Name = "Krasnaya Volchitsa";
Mission_Host = missionHost;

[true, "init",format ["Starting %1...", Scenario_Name], false] call F90_fnc_debug;

// Init persistence
configurePersistentDone = false;
[] call F90_fnc_configurePersistent;
waitUntil {configurePersistentDone};
[] call F90_fnc_persistentInit;

// Init Economy 
configureEconomyDone = false;
[] call F90_fnc_configureEconomy;
waitUntil {configureEconomyDone};
[] call F90_fnc_initEconomy;

// Init VCR
configureVCRDone = false;
[] call F90_fnc_configureVCR;
waitUntil {configureVCRDone};
[] call F90_fnc_initVCR;

private _debugGroup = createGroup [west, true];
[_debugGroup, "B_Soldier_F", [2499.23,2053.64,0]] call F90_fnc_createUnit;
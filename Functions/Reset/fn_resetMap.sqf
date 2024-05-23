// Runs every mission start or before loading saves.

[Mission_Host, Mission_HostStartPos] call F90_fnc_resetUnit;
[player1, Mission_P1StartPos] call F90_fnc_resetUnit;
[player2, Mission_P2StartPos] call F90_fnc_resetUnit;

if (!isNil{Persistent_ActionID})then{Mission_Host removeAction Persistent_ActionID};
if (!isNil{VCR_ActionID})then{Mission_Host removeAction VCR_ActionID};

// Init Economy 
configureEconomyDone = false;
[] call F90_fnc_configureEconomy;
waitUntil {configureEconomyDone};
[] call F90_fnc_initEconomy;
configureEconomyDone = nil;

// Init task 
configureTaskDone = false;
[] call F90_fnc_configureTask;
waitUntil {configureTaskDone};
[] call F90_fnc_initTask;
configureTaskDone = nil;

// Init VCR
configureVCRDone = false;
[] call F90_fnc_configureVCR;
waitUntil {configureVCRDone};
[] call F90_fnc_initVCR;
configureVCRDone = nil;

// Init persistence
configurePersistentDone = false;
[] call F90_fnc_configurePersistent;
waitUntil {configurePersistentDone};
[] call F90_fnc_persistentInit;
configurePersistentDone = nil;

if ((count Mission_CreatedUnits) > 0) then 
{
    {
        deleteVehicle _x;
    } forEach Mission_CreatedUnits;
};

// private _debugGroup = createGroup [west, true];
// [_debugGroup, "B_Soldier_F", [2499.23,2053.64,0]] call F90_fnc_createUnit;
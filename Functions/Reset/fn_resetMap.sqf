// Executed by server every mission start or before loading saves.
if ((count Mission_CreatedUnits) > 0) then 
{
    {
        [_x, false] call F90_fnc_deleteUnit;
    } forEach Mission_CreatedUnits;
    publicVariable "Mission_CreatedUnits";
};

if (count Mission_AlliedBasePatrols > 0) then
{
    {
        [_x] call F90_fnc_deleteUnit;
    } forEach Mission_AlliedBasePatrols;
};

// Reinit/Respawn dead units
[] call F90_fnc_createTaskOfficer;
[] call F90_fnc_createPersonnelOfficer;
[] call F90_fnc_createRangeOfficer;
[] call F90_fnc_createTransportVehicles;
[] call F90_fnc_createSupportOfficer;
[] spawn F90_fnc_spawnBaseGuard;
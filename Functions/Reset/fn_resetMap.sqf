// Executed by server every mission start or before loading saves.

{
    [_x, Mission_StartingPosition] call F90_fnc_resetUnit;
} forEach playableUnits;

[] call F90_fnc_initCivilian;
[] call F90_fnc_initCABServer;
[] call F90_fnc_initTask;

if ((count Mission_CreatedUnits) > 0) then 
{
    {
        deleteVehicle _x;
    } forEach Mission_CreatedUnits;
};
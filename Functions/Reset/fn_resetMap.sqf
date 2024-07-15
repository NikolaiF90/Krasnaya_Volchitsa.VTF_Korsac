// Executed by server every mission start or before loading saves.
[] call F90_fnc_initDSC;
[] call F90_fnc_initCivilian;
[] call F90_fnc_initCABServer;
[] call F90_fnc_initTask;
[] call F90_fnc_initSHARS;

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
[] call F90_fnc_spawnBaseGuard;
// Executed by server every mission start or before loading saves.
[] call F90_fnc_initCivilian;
[] call F90_fnc_initCABServer;
[] call F90_fnc_initTask;
[] call F90_fnc_initSHARS;

if ((count Mission_CreatedUnits) > 0) then 
{
    {
        deleteVehicle _x;
    } forEach Mission_CreatedUnits;
};
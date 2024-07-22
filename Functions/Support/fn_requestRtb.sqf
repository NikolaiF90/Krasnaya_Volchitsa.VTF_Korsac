params ["_transportVehicle"];

if !(alive _transportVehicle) exitWith {};

if ((_transportVehicle getVariable "RSW_IsIdle")) then 
{
    _transportVehicle setVariable ["RSW_IsIdle", false, true];

    private _heliWaitingTime = 3;
    private _basePosition = _transportVehicle getVariable "RSW_BasePosition";
    _transportVehicle move _basePosition;

    sleep _heliWaitingTime;

    // Arrive Check
    while {alive _transportVehicle && !(unitReady _transportVehicle)} do 
    {
        sleep 1;
    };
    // Land
    if (alive _transportVehicle && unitReady _transportVehicle) then 
    {
        _transportVehicle land "LAND";
        sleep _heliWaitingTime;
        _transportVehicle setVariable ["RSW_OnTransportMission", false, true];
        _transportVehicle setVariable ["RSW_IsIdle", true, true];
    };
} else 
{
    ["The transport vehicle is already on another mission", "ERROR"] call F90_fnc_textNotification;
};

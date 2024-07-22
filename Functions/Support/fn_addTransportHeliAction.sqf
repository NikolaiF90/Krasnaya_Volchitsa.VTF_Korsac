/*
    Author: PrinceF90

    Description:
        Manages DropOff and Return To Base actions for a transport vehicle.

    Parameter(s):
        _transportVehicle - The transport vehicle object [OBJECT]

    Returns:
        None
*/
params ["_transportVehicle"];

// DropOff action
[
    _transportVehicle, 
    "Request Drop Off", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        // Dropoff function 
        openMap [true, true];
        [_target, _caller] onMapSingleClick 
        {
            [_this select 0, _this select 1, _pos] spawn F90_fnc_requestDropOff;
            openMap [false, false]; 
            onMapSingleClick "";
            (_this select 0) setVariable ["RSW_OnTransportMission", true, true];
        };
    },
    "alive _this && (objectParent _this == _target) && !(_target getVariable 'RSW_OnTransportMission')",
    "RSW_DropOffActionID"
] call F90_fnc_addAction;

// Return To Base Action 
[
    _transportVehicle,
    "Request RTB",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target] spawn F90_fnc_requestRtb;
    },
    "alive _this && (objectParent _this == _target) && (_target getVariable 'RSW_OnTransportMission')",
    "RSW_RTBActionID"
] call F90_fnc_addAction;
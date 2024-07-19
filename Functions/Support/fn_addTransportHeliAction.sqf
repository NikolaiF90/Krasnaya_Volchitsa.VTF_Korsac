params ["_transportHeli"];

// DropOff action
private _dropOffActionID = _transportHeli getVariable ["Mission_DropOffActionID", -1];
if (_dropOffActionID == -1) then 
{
    [
        _transportHeli, 
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
                (_this select 0) setVariable ["Mission_OnTransportMission", true, true];
            };
        },
        "alive _this && (objectParent _this == _target) && !(_target getVariable 'Mission_OnTransportMission')",
        "Mission_DropOffActionID"
    ] call F90_fnc_addAction;
};

// Return To Base Action 
private _rtbActionID = _transportHeli getVariable ["Mission_RTBActionID", -1];
if (_rtbActionID == -1) then 
{
    [
        _transportHeli,
        "Request RTB",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            [_target] spawn F90_fnc_requestRtb;
        },
        "alive _this && (objectParent _this == _target) && (_target getVariable 'Mission_OnTransportMission')",
        "Mission_RTBActionID"
    ] call F90_fnc_addAction;
};
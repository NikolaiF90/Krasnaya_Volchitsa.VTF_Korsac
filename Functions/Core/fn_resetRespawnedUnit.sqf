params ["_unit"];
// Heals unit
_unit setDamage 0;

// Reset original unit 
private _helperUnit = _unit getVariable ["ais_helperUnit", objNull];
if !(isNull _helperUnit) then
{
    _unit setVariable ["ais_helperUnit", ObjNull, true];

    detach _helperUnit;
    detach _unit;
};

_unit setVariable ["AIS_IsUnconscious", false, true];
_unit setVariable ["ais_fireDamage", 0];

_unit call AIS_System_fnc_restoreFaks;

if (isPlayer _unit) then 
{
    showHUD true;
    if (AIS_TOGGLE_RADIO) then 
    {
        [true] call AIS_Effects_fnc_toggleRadio;
    };
};

[_unit, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0]; 
[_unit, false] remoteExec ["setCaptive", 0, false];

_unit removeAllEventHandlers "GetOutMan";

// Notify player
["You're dead. You have been respawned", "WARNING"] call F90_fnc_textNotification;
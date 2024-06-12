// For some reasons, all addAction will disappear after changing units
params ["_previousUnit", "_newUnit"];

/*
if (_newUnit == missionCaptain) then 
{
    Persistent_Host addAction ["<t color='#0089f2'>Persistent</t>", { [] call F90_fnc_openPersistentTab;}];
    _newUnit addAction ["<t color='#23d1cd'>Open Tactical Tab</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] call F90_fnc_openTacticalTab}, nil, 6, false, false, "", "_target == _this", -1, false];
};
*/

player addAction ["<t color='#23d1cd'>Open Tactical Tab</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] call F90_fnc_openTacticalTab}, nil, 6, false, false, "", "_target == _this", -1, false];
player addAction ["<t color='#0089f2'>Persistent</t>", { [] call F90_fnc_openPersistentTab;}];
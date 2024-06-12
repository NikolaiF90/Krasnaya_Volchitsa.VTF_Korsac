params ["_unit", "_actionName"];

_unit addAction 
[
    _actionName, 
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        [_target, _caller] call F90_fnc_confirmKill; 
        _target removeAction _actionId;
    },
    nil,
    6,
    true,
    true,
    "",
    "true",
    5
];
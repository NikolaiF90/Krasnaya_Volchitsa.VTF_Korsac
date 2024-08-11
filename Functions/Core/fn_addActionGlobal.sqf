params ["_unit", "_actionName", "_code", "_condition", "_actionKey"];

[
    _unit,
    _actionName,
    _code,
    _condition,
    _actionKey    
] remoteExec ["F90_fnc_addAction", 0, true];
params ["_unit"];

CAB_ArrestActionID = _unit addAction 
[
    "<t color='#00ff00'>Arrest</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        private _arrested = [_target, _caller] call F90_fnc_arrest;
        if (_arrested) then {_target removeAction _actionId};
    },
    nil,
    5,
    true,
    true,
    "",
    "alive _target",
    5
];

_unit setVariable ["CAB_ArrestActionID", CAB_ArrestActionID, true];
params ["_unit"];

_unit setVariable ["CAB_IDChecked", false];
_unit setVariable ["CAB_IsArrested", false];

_unit addAction 
[
    "<t color='#00ff00'>Ask for identification</t>",
    {
		params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller] call F90_fnc_askForID;
	},
    nil,
    6,
    true,
    true,
    "",
    "alive _target",
    5
];

_unit addAction 
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
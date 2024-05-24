params ["_unit"];

_unit setVariable ["CAB_IDChecked", false];

_unit addAction 
[
    "<t color='#23d1cd'>Ask for identification</t>",
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

// Arrest action
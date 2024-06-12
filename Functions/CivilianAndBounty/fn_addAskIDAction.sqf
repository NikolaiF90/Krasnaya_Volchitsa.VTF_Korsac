params ["_unit"];

CAB_AskActionID = _unit addAction 
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

_unit setVariable ["CAB_AskActionID", CAB_AskActionID, true];
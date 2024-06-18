/*
    VETCOMREC - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/
params [["_unit", player]];

// Set the default value of VETCOMREC variables
[_unit] call F90_fnc_resetTempRecord;
private _defaultUnitVariables = 
[
    ["Record_ConfirmedKills", 0, true],
    ["Record_TotalConductedMissions", 0, true],
    ["Record_TotalSuccessfulMissions", 0, true],
    ["Record_TotalArrestedHVT", 0, true],
    ["Record_TotalKilledHVT", 0, true]
];

{
    private _currentValue = _unit getVariable [_x select 0, -1];
    if (_currentValue == -1) then 
    {
        _unit setVariable [_x select 0, _x select 1, _x select 2];
    };
} forEach _defaultUnitVariables;

private _RECActionID = _unit getVariable ["REC_ActionID", nil];

// Delete action if already exist. To prevent duplicate action on mission host
if (!isNil {_RECActionID}) then { _unit removeAction _RECActionID};

_RECActionID = _unit addAction 
[
    "<t color='#23d1cd'>Open Tactical Tab</t>", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        [_caller] call F90_fnc_openTacticalTab;
    }, 
    nil, 
    4, 
    false, 
    false, 
    "", 
    "_target == _this"
];

_unit setVariable ["REC_ActionID", _RECActionID];
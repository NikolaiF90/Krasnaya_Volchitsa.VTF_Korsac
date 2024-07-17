/*
    VETCOMREC - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/
params ["_unit"];

if (isNull _unit) then 
{
    _unit = player;
};

// Set the default value of VETCOMREC variables
[_unit] call F90_fnc_resetTempRecord;
private _defaultUnitVariables = 
[
    ["Record_ConfirmedKills", 0, true],
    ["Record_TotalConductedMissions", 0, true],
    ["Record_TotalSuccessfulMissions", 0, true],
    ["Record_TotalArrestedHVT", 0, true],
    ["Record_TotalKilledHVT", 0, true], 
    ["Record_SkillTreeBonus", 0, true]
];

{
    private _currentValue = _unit getVariable [_x select 0, -1];
    if (_currentValue == -1) then 
    {
        _unit setVariable [_x select 0, _x select 1, _x select 2];
    };
} forEach _defaultUnitVariables;

private _notificationList = _unit getVariable ["Record_RecentNotification", nil];
if (isNil {_notificationList}) then 
{
    _unit setVariable ["Record_RecentNotification", [], true];
};

// Add Player Unique ID
private _playerUID = [name _unit] call F90_fnc_generateUniqueID;
_unit setVariable ["Record_PlayerUID", _playerUID, true];
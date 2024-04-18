/*
    Author: PrinceF90

    Description:
        This function updates the confirmed kill count for a unit. It adds the specified number of kills to the unit's existing confirmed kill count.

    Parameter(s):
        0: OBJECT - _unit: The unit whose confirmed kill count is being updated
        1: NUMBER - (Optional)_killCount: The number of kills to add to the unit's confirmed kill count

    Returns:
        0

    Examples:
        [_player2] call F90_fnc_addKillCount;
        [player, 2] call F90_fnc_addKillCount;
*/

params ["_unit", "_killCount"];

if !(isNil{_killCount})then{_killCount = _killCount}else{_killCount = 1};

private _confirmedKills = _unit getVariable "Record_ConfirmedKills";
_confirmedKills = _confirmedKills + _killCount;
_unit setVariable ["Record_ConfirmedKills", _confirmedKills];

[VCRDebug, "addKillCount", format ["%1 kills added to %2's confirmed kill counts.", _killCount, _unit], false] call F90_fnc_debug;
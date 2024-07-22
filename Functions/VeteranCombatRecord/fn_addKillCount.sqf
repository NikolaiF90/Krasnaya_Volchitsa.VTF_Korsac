/*
    Author: PrinceF90

    Description:
        This function updates the confirmed kill count for a unit. It adds the specified number of kills to the unit's existing confirmed kill count.

    Parameter(s):
        0: OBJECT - _killer: The unit whose confirmed kill count is being updated
        1: NUMBER - (Optional)_killCount: The number of kills to add to the unit's confirmed kill count

    Returns:
        0

    Examples:
        [_player2] call F90_fnc_addKillCount;
        [player, 2] call F90_fnc_addKillCount;
*/

params ["_killer", "_killed", "_killCount"];

if !(isNil{_killCount})then{_killCount = _killCount}else{_killCount = 1};

private _hasBeenArrest = _killed getVariable ["CAB_HasBeenArrested", false];
private _isHVT = _killed getVariable ["Record_IsHVT", false];

if (_hasBeenArrest && !(_isHVT)) then 
{
    private _tempCapturedPrisoners = _killer getVariable "REC_TempCapturedPrisoners";
    _tempCapturedPrisoners = _tempCapturedPrisoners - 1;
    _killer setVariable ["REC_TempCapturedPrisoners", _tempCapturedPrisoners, true];
};

private _tempKillCount = _killer getVariable "REC_TempKillCount";
_tempKillCount = _tempKillCount + _killCount;
_killer setVariable ["REC_TempKillCount", _tempKillCount];
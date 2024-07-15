params ["_unit"];

if (isNull _unit) then {_unit = player};

private _currentRank = [_unit] call F90_fnc_getUnitRank;
private _rankIndex = [_currentRank] call F90_fnc_getRankIndex;
private _nextRank = (PRS_AllRanks select (_rankIndex + 1)) select 0;
private _requirement = [_currentRank] call F90_fnc_getPromotionOP;
private _currentOP = [_unit] call F90_fnc_getTotalOP;

if (_currentOP >= _requirement) then 
{
    // Promote the unit
    [_unit, _nextRank] call F90_fnc_setUnitRank;

    // Notify player
    if (isPlayer _unit) then 
    {
        [format ["You have been promoted to %1", _nextRank], "DEFAULT"] call F90_fnc_textNotification;
    } else
    {
        [format ["%1 have been promoted to %1", name _unit, _nextRank], "DEFAULT"] call F90_fnc_textNotification;
    };
} else 
{
    if (isPlayer _unit) then 
    {
        ["You haven't meet the requirements for promotion", "ERROR"] call F90_fnc_textNotification;
    } else
    {
        [format ["%1 haven't meet the requirements for promotion", name _unit], "ERROR"] call F90_fnc_textNotification;
    };
};
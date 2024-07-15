/*
    Author: PrinceF90

    Description:
        This function sets the rank of a specified unit along with additional operation points based on the rank.

    Parameter(s):
        _unit - The unit object to set the rank for. [OBJECT]
        _rank - The rank name or index to set for the unit. [STRING or SCALAR]

    Returns:
        None
*/
params ["_unit", "_rank"];

if (isNull _unit) exitWith {[MissionDebug, "setUnitRank", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

if (isNil {_rank}) then 
{
    // Get the rank name of the first element in PRS_AllRanks
    _rank = (PRS_AllRanks select 0) select 0;
} else 
{
    private _rankName = "";
    private _rankIndex = -1;

    if (_rank isEqualType "") then 
    {
        _rankIndex = [_rank] call F90_fnc_getRankIndex;
        _rankName = _rank;
    };

    if (typeName _rank == "SCALAR") then 
    {
        _rankIndex = _rank;
        _rankName = (PRS_AllRanks select _rankIndex) select 0;
    };

    _unit setVariable ["PRS_Rank", _rankName, true];

    private _operationBonusPoints = (PRS_AllRanks select _rankIndex) select 1;
    _unit setVariable ["PRS_OperationPoints", _operationBonusPoints, true];
    
    // Unlock perks 
    private _unlockedPerks = (PRS_AllRanks select _rankIndex) select 3;
    {
        [_unit, _x] call F90_fnc_unlockPerk;
    } forEach _unlockedPerks;
};

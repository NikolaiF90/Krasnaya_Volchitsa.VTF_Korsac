/* 
    Author: PrinceF90 
    
    Description: 
        This function searches for a specific rank name in a list of ranks and returns the index of that rank. 
    
    Parameter(s): 
        _rank - The rank name to search for. [STRING] 
    
    Returns: 
        _rankIndex - The index of the specified rank in the list of ranks.
*/ 
params ["_rank"];

if (isNil {_rank}) exitWith {[MissionDebug, "getRankIndex", "ERROR - No String is provided for the variable _rank", false, false] call F90_fnc_debug};

private _rankIndex = -1;

{
    private _rankName = _x select 0;
    if (_rankName == _rank) then 
    {
        _rankIndex = _forEachIndex;
    }; 
} forEach PRS_AllRanks;

_rankIndex
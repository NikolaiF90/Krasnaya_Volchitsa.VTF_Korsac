/*
    Author: PrinceF90

    Description:
        Function to get the rank of a given unit.

    Parameter(s):
        _unit - The unit to get the rank from. [OBJECT]

    Returns:
        _rank = The rank of the given unit.
*/
params ["_unit"];

if (isNull _unit) exitWith {[MissionDebug, "getUnitRank", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

_unit getVariable ["PRS_Rank", nil] 
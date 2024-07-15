/*
    Author: PrinceF90

    Description:
        Function to get the gained points for a succesfull operation of a given unit.

    Parameter(s):
        _unit - The unit to get the gained operations points from. [OBJECT]

    Returns:
        _operationBonus - The gained points for a successfull operation of the given unit.
*/
params ["_unit"];

if (isNull _unit) exitWith {[MissionDebug, "getUnitOperationPoints", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

_unit getVariable ["PRS_OperationPoints", (PRS_AllRanks select 0) select 1]
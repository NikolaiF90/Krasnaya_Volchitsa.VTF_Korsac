/*
    Author: PrinceF90

    Description:
        Function to get the total operation points of a given unit.

    Parameter(s):
        _unit - The unit to get the total operation points from. [OBJECT]

    Returns:
        _totalOperationPoints = Total operation points of the given unit.
*/
params ["_unit"];

if (isNull _unit) exitWith {[MissionDebug, "getTotalOP", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

private _totalOP = _unit getVariable ["PRS_TotalOP", -1];
if (_totalOP == -1) then 
{
    _totalOP = 0;
};
_totalOP 

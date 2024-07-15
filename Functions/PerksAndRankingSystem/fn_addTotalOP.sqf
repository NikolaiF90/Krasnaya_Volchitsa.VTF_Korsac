/*
    Author: PrinceF90

    Description:
        Adds operation points to the total operation points of a given unit.

    Parameter(s):
        _unit - The unit to add operation points to. [OBJECT]
        _addedOperationPoints - (Optional, default 0)The number of operation points to add. [INT]

    Returns:
        _totalOP - The updated total operation points after adding the specified points.
*/
params ["_unit", "_addedOperationPoints"];

if (isNull _unit) exitWith {[MissionDebug, "addTotalOP", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

if (isNil {_addedOperationPoints}) then {_addedOperationPoints = 0};

private _totalOP = _unit getVariable ["PRS_TotalOP", -1];
if (_totalOP == -1) then 
{
    _totalOP = 0;
};

_totalOP = _totalOP + (floor _addedOperationPoints);

_unit setVariable ["PRS_TotalOP", _totalOP, true];

_totalOP
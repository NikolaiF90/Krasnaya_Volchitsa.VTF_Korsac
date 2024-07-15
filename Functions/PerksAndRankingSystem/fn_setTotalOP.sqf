/*
    Author: PrinceF90
    
    Description:
        Sets the total operation points for a given unit.

    Parameter(s):
        _unit - The unit to set the operation points for. [OBJECT]
        _newOperationPoints - (Optional, default 0)The new total operation points value. [SCALAR]

    Returns:
        None
*/
params ["_unit", "_newOperationPoints"];

if (isNull _unit) exitWith {[MissionDebug, "setTotalOP", "ERROR - No object is provided for the variable _unit", false, false] call F90_fnc_debug};

if (isNil {_newOperationPoints}) then {_newOperationPoints = 0};
_unit setVariable ["PRS_TotalOP", floor _newOperationPoints, true];
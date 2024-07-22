/*
    Author: PrinceF90

    Description:
        This function retrieves the total operation points (OP) associated with a specified unit.

    Parameter(s):
        _unit - The unit for which the total OP is retrieved. [OBJECT]

    Returns:
        _op - The total operation points of the specified unit.
*/
params ["_unit"];

if (isNil {_unit}) exitWith {[MissionDebug, "getTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[MissionDebug, "getTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};

private _op = _unit getVariable [PRS_OPName, nil];
_op

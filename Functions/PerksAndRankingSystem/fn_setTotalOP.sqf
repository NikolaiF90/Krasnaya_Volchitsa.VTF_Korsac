/*
    Author: PrinceF90

    Description:
        This function sets the total operation points (OP) for a specified unit to a specific value.

    Parameter(s):
        _unit - The unit for which the total OP is set. [OBJECT]
        _amount - The amount to set as the new total OP value. [SCALAR]

    Returns:
        _amount - The amount that was set as the total OP for the specified unit.
*/
params ["_unit", "_amount"];

if (isNil {_unit}) exitWith {[MissionDebug, "setTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[MissionDebug, "setTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNil {_amount}) then {_amount = 0};

_unit setVariable [PRS_OPName,floor _amount, true];

_amount
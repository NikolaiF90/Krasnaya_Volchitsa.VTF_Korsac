/*
    Author: PrinceF90

    Description:
        This function adds a specified amount to the total operation points (OP) associated with a unit.

    Parameter(s):
        _unit - The unit for which the total OP is updated. [OBJECT]
        _amount - The amount to be added to the current total OP. [SCALAR]

    Returns:
        _op - The updated total OP after adding the specified amount.
*/
params ["_unit", "_amount"];

if (isNil {_unit}) exitWith {[MissionDebug, "addTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[MissionDebug, "addTotalOP", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNil {_amount}) then {_amount = 0};

private _op = [_unit] call F90_fnc_getMoney;

if (isNil {_op}) then 
{
    _op = _amount;
} else 
{
    _op = _op + _amount;
};

[_unit, _op] call F90_fnc_setTotalOP;

_op
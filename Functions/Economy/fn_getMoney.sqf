/*
    Author: PrinceF90

    Description:
        This function retrieves the amount of money associated with a specified unit.

    Parameter(s):
        _unit - The unit for which the money amount is retrieved. [OBJECT]

    Returns:
        _money - The amount of money associated with the specified unit.
*/
params ["_unit"];

if (isNil {_unit}) exitWith {[MissionDebug, "getMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[MissionDebug, "getMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};

private _money = _unit getVariable [Economy_CurrencyName, nil];
_money
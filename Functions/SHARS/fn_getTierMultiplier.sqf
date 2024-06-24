/*
    Author: PrinceF90

    Description:
        This function calculates a multiplier based on the provided class name. The function first will get the className tier. Then with the obtained tier, it will look through a sets of multipliers and set suitable multiplier for the tier.

    Parameter(s):
        0: STRING - _className: The className to get the tier multiplier for.

    Returns:
        _multiplier - A float value
*/
params ["_className"];

private _tier = [_className] call F90_fnc_getUnitsTier;
// Default multiplier
private _multiplier = 1.0;

{
    if (_x select 0 == _tier) exitWith 
    {
        _multiplier = _x select 1;
    }
} forEach SHARS_TierMultipliers;

_multiplier
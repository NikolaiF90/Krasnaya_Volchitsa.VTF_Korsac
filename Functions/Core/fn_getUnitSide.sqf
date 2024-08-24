/*
    Author: PrinceF90

    Description:
        This function retrieves the true side of a given unit. This function is useful as if the player is unconscious, the side command will return `civilian` where this function will return the unit's true side.

    Parameter(s):
        _unit - The unit whose side is being retrieved. [OBJECT]

    Returns: 
        _side - The side of the unit as defined in the configuration or the custom variable. [NUMBER]
*/
params ["_unit"];

private _side = _unit getVariable ["RSW_UnitSide", nil];
if (isNil {_side}) then 
{
    _side = getNumber (configfile >> "CfgVehicles" >> (typeOf _target) >> "side");
    _unit setVariable ["RSW_UnitSide", _side, true];
};

_side
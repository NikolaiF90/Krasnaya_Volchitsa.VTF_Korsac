/*
    Author: PrinceF90

    Description:
        Sets the personal arsenal inventory for a specified unit.

    Parameter(s):
        _unit - The unit to which the personal arsenal inventory will be assigned. [OBJECT]
        _inventory - The inventory data to be set for the personal arsenal. [ARRAY]

    Returns: 
        None
*/
params ["_unit", "_inventory"];

_unit setVariable ["RSW_PersonalArsenal", _inventory, true];
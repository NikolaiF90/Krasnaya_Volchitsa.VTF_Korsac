/*
    Author: PrinceF90

    Description:
        Initializes an OP associated with a unit to a default value if it does not already exist.

    Parameter(s):
        _unit - The unit for which the OP is initialized. [OBJECT]

    Returns:
        None
*/
params ["_unit"];

if (isNil {_unit}) then {_unit = player};

private _amount = _unit getVariable [PRS_OPName, nil];
if (isNil {_amount}) then 
{
    _amount = 0;
};
_unit setVariable [PRS_OPName, _amount, true];

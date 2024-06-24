/*
    Author: PrinceF90

    Description:
        Same as engine command removeAction, but this function will save the action ID to the provided unit with the provided key and nil as value.Then the function will make the variable public.

    Parameter(s):
        0: OBJECT - _unit: Unit to remove action from
        1: NUMBER - _actionID: ID of the action to remove
        2: STRING - _key: The key to the actionID variable

    Returns:
        None
*/
params ["_unit", "_actionID", "_key"];

if (!isNil {_actionID}) then 
{
    _unit removeAction _actionID;
    _unit setVariable [_key, nil, true];
};
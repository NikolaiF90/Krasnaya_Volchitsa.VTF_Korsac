/*
    Author: PrinceF90

    Description:
        This function checks if a specified variable exists for the player and, if it does, sets that variable to nil.

    Parameter(s):
        _key - The key for the variable being checked and modified. [STRING]

    Returns: 
        None
*/
params ["_key"];

private _variableExisted = player getVariable [_key, nil];

if !(isNil {_variableExisted}) then 
{
    player setVariable [_key, nil, true];
};
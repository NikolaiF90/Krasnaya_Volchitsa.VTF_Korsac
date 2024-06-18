/*
    Author: PrinceF90

    Description:
        This function adds a custom action to a specified unit in the game. Same as engine command addAction, but this function will automatically stores the actionID to the unit.

    Parameter(s):
        0: OBJECT - _unit: The unit to add the action to
        1: STRING - _actionName: The name of the custom action
        2: CODE - _code: The code to be executed when the action is performed
        3: STRING - _condition: The condition under which the action can be performed. Use "true" if unsure.
        4: STRING - _key: The key to identify the action

    Returns:
        None
*/

params ["_unit", "_actionName", "_code", "_condition", "_actionKey"];

private _actionID = _unit addAction 
[
    format ["<t color='#23d1cd'>%1</t>", _actionName], 
    _code,
    nil, 
    1.5, 
    true, 
    true, 
    "", 
    _condition, 
    5
];

_unit setVariable [_actionKey, _actionID, true];
sleep 0.001;
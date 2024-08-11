/*
    Author: PrinceF90

    Description:
        This function adds an action to a unit if the action is not already existed. It will create an action key if not already set, assigning it a unique action ID.

    Parameter(s):
        _unit - The unit to add the action to. [OBJECT]
        _actionName - The name of the action to display. [STRING]
        _code - The code to be executed when the action is performed. Parameters passed to the script in _this variable: "_target", "_caller", "_actionId", "_arguments" [CODE]
        _condition - The condition under which the action can be performed. _target(The object the action is attached to), _this(The person the action is shown). Use "true" if unsure. [STRING]
        _actionKey - The key used to store the action ID. [STRING]

    Returns:
        None
*/

params ["_unit", "_actionName", "_code", "_condition", "_actionKey"];

private _actionCreated = player getVariable [_actionKey, false];

if !(_actionCreated) then 
{
    _unit addAction 
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

    _actionCreated = true;
    player setVariable [_actionKey, _actionCreated, true];
};

sleep 0.001;
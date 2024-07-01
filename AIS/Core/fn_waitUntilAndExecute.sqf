/*
    Author: joko // Jonas, donated from ACE3

    Description:
        Executes a code once in unscheduled environment after a condition is true. Passed arguments _this: Parameters passed by this function. Same as '_args'.

    Parameters:
        _condition - The function to evaluate as condition. [CODE]
        _statement - The function to run once the condition is true.  [CODE]
        _args - (Optional, default emptyArray) Parameters passed to the functions (statement and condition). [ANY]

    Returns:
        None

    Examples:
        (begin example)
            [{(_this select 0) == vehicle (_this select 0)}, {(_this select 0) setDamage 1;}, [player]] call AIS_Core_fnc_waitUntilAndExecute;
        (end)
*/

params ["_condition", "_statement", "_args"];

if (isNil {_condition}) then {_condition = {}};
if (isNil {_statement}) then {_statement = {}};
if (isNil {_args}) then {_args = []};

AIS_waitUntilAndExecArray pushBack [_condition, _statement, _args];

nil
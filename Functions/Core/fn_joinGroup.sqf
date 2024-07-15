/*
    Author: PrinceF90

    Description:
        This function checks if a leader can accept a new subordinate based on their rank and the number of current subordinates.

    Parameter(s):
        _leader - The leader unit. [OBJECT]
        _subordinate - The subordinate unit to be added. [OBJECT]
        _silent - (Optional, default false) Parameter to add the subordinate silently. [BOOLEAN]

    Returns:
        _unlocked - Indicates whether the leader can accept the new subordinate based on rank and subordinates count.
*/
params ["_leader", "_subordinate", "_silent"];

private _unlocked = false;

_unlocked = [_leader, "SQUAD"] call F90_fnc_checkCommandingEgibility;

if (_unlocked) then
{
    if (isNil {_silent}) then {_silent = false;};

    if (_silent) then 
    {
        [_subordinate] joinSilent _leader;
    } else 
    {
        [_subordinate] join _leader;
    };
} else
{
    ["Only higher ranks can leads more subordinates", "ERROR"] call F90_fnc_textNotification;
    [_subordinate] call F90_fnc_deleteUnit;
};

_unlocked
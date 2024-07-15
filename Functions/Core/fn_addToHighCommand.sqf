/*
    Author: PrinceF90

    Description:
        This function adds the specified group to the specified unit's high command with a specific icon and color.

    Parameter(s):
        _unit - The high command commander. [OBJECT]
        _group - The group to be added to high command. [OBJECT]
        _icon - (Optional, default "o_inf") The icon to be assigned to the high command group. [STRING]

    Returns:
        _unlocked - Indicates whether the leader can add the unit to the high command group based on rank.
*/
params ["_unit", "_group", "_icon"];

private _unlocked = false;

_unlocked = [_unit, "HC"] call F90_fnc_checkCommandingEgibility;

if (_unlocked) then 
{
    if(isNil {_icon}) then {_icon = "o_inf";};

    private _iconColor = [1,0,0,1];

    _unit hcSetGroup [_group];
    _group addGroupIcon [_icon];
    _group setGroupIconParams [_iconColor, groupId _group, 1, true];
    [format ["%1 has been added to your HC", groupId _group]] call F90_fnc_textNotification;
} else 
{
    // Notify player
    ["Only higher ranks can leads more squads", "ERROR"] call F90_fnc_textNotification;
    {
        [_x] call F90_fnc_deleteUnit;
    } forEach units _group;
    deleteGroup _group;
};

_unlocked
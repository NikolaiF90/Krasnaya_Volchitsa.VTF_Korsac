/*
    Author: PrinceF90

    Description:
        This function adds a specified group to the specified unit's high command with a specific icon and color.

    Parameter(s):
        0: OBJECT - _unit: The high command commander.
        1: OBJECT - _group: The group to be added to high command.
        2: STRING - _icon: Optional, default "o_inf". The icon to be assigned to the high command group.

    Returns:
        None
*/
params ["_unit", "_group", "_icon"];

if(isNil {_icon}) then 
{
    _icon = "o_inf";
};

private _iconColor = [1,0,0,1];

_unit hcSetGroup [_group];
_group addGroupIcon [_icon];
_group setGroupIconParams [_iconColor, groupId _group, 1, true];
[format ["%1 has been added to your HC", groupId _group]] call F90_fnc_textNotification;
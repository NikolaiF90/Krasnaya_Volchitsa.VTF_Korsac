/*
    Author: PrinceF90

    Description:
        This function creates a notification with a specific text and icon and show it to specified side.

    Parameter(s):
        0: SIDE - _side: The side to show the notification to
        1: STRING - _type: Can be: "Patrol", "KillHVT", "Support", "Ambush", "RTB"
        2: STRING - _operation: Can be: "CREATED", "SUCCEEDED", "CANCELED"

    Returns:
        None

    Examples:
        [Mission_AlliedSide, "Patrol", "CREATED"] call F90_fnc_showTaskNotification;
*/

params ["_side", "_type", "_operation"];

private _taskID = [_type] call F90_fnc_generateUniqueID;
private _taskIcon = "";

switch (_type) do 
{
    case "Patrol": {_taskIcon = "navigate"};
    case "KillHVT": {_taskIcon = "kill"};
    case "Ambush": {_taskIcon = "attack"};
    case "Support": {_taskIcon = "defend"};
    case "RTB": {_taskIcon = "whiteboard"};
};

[_side, _taskID, ["", _type], objNull, _operation] call BIS_fnc_taskCreate;
[_taskID, _taskIcon] call BIS_fnc_taskSetType;
sleep 2;
[_taskID] call BIS_fnc_deleteTask;
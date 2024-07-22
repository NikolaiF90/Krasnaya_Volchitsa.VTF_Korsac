/*
    Author: PrinceF90

    Description:
        Marks the completion of a patrol task and updates task-related information.

    Parameter(s):
        None
        
    Returns:
        _donePatrol: BOOL - Whether the patrol task is completed.
*/
private _donePatrol = false;

["Patrol Completed"] remoteExec ["F90_fnc_textNotification", 0, true]; 
[Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;

Task_DutyStatus = 1;
Task_DutyName = "";
Task_DutyDescription = "";
Persistent_MarkerBlacklists = [Task_AoMarker, Task_AoZone];
publicVariable "Persistent_MarkerBlacklists";
deleteMarker Task_AoMarker;
deleteMarker Task_AoZone;

{  
    _x setVariable ["TASK_IsSuccessfulMission", true, true];
} forEach allPlayers;
["Task_RTB"] call F90_fnc_createTask;

_donePatrol = true;
_donePatrol
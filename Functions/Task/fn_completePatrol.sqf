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

["Patrol Completed"] remoteExec ["hint", 0, true]; 
[east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;

Task_DutyStatus = 1;
Task_DutyName = "";
Task_DutyDescription = "";
deleteMarker Task_AoMarker;
deleteMarker Task_AoZone;
Persistent_MarkerBlacklists = [];

["Task_RTB"] call F90_fnc_createTask;

_donePatrol = true;
_donePatrol;
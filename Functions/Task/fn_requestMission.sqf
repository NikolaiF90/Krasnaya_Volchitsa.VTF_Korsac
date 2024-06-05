/*
    Author: PrinceF90

    Description:
        This function is used to request a mission task and create it if there is no active task.

    Parameter(s):
        Does not accept any parameters.

    Returns:
        None

    Examples:
        // To request a mission task
        ["target", "caller", "actionID"] call F90_fnc_requestMission;
*/

[TaskDebug, "requestMission", "Requesting mission...", false] call F90_fnc_debug;

// Assign Task
if (Task_ActiveTask == -1) then 
{
    private _task = selectRandom Task_AllTask;

    // Prevent generating RTB task
    while {_task == "Task_RTB"} do 
    {
        _task = selectRandom Task_AllTask;
    };

    [_task] call F90_fnc_createTask;

    [TaskDebug, "requestMission", format ["Task %1 has been created.", _task], false] call F90_fnc_debug;
};
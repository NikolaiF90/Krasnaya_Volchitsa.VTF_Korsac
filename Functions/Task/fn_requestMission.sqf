

params ["_target", "_caller", "_actionID"];

[TaskDebug, "requestMission", "Requesting mission...", false] call F90_fnc_debug;

// Assign Task
if (Task_ActiveTask == -1) then 
{
    // Give random task except RTB task
    private _taskIndex = floor (random (count Task_AllTask)); 

    while {_taskIndex == 4} do 
    {
        [TaskDebug, "requestMission", "RTB mission generated. Now regenerating new mission...", false] call F90_fnc_debug;
        _taskIndex = floor (random (count Task_AllTask));
    };

    private _taskName = Task_AllTask # _taskIndex;

    [TaskDebug, "requestMission", format ["Mission successfully generated. Creating task %1...", _taskName], false] call F90_fnc_debug;
    [_taskName] call F90_fnc_createTask;

    [TaskDebug, "requestMission", format ["Task %1 has been created.", _taskName], false] call F90_fnc_debug;
};
[TaskDebug, "resetTask", "Now resetting existing task...", false] call F90_fnc_debug;

Task_ActiveTask = -1;
Task_CurrentTaskID = "";
Task_DutyName = "";
Task_DutyDescription = "";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed

if (!isNil {Task_AoMarker}) then 
{
    deleteMarker Task_AoMarker;
    deleteMarker Task_AoZone;
};

Persistent_MarkerBlacklists = [];
if (!isNull Task_TaskTrigger) then
{
    deleteVehicle Task_TaskTrigger;
    Task_TaskTrigger = objNull;
};

[TaskDebug, "resetTask", "All task has been cleared.", false] call F90_fnc_debug;

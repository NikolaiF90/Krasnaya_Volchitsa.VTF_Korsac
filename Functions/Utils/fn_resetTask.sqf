[TaskDebug, "resetTask", "Now resetting existing task...", false] call F90_fnc_debug;

if (!isNil {Task_CurrentTaskID}) then 
{
    if (Task_CurrentTaskID != "") then 
    {
        Task_ActiveTask = -1;
        Task_CurrentTaskID = "";
        Task_DutyName = "";
        Task_DutyDescription = "";
        Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed

        deleteMarker Task_AoMarker;
        deleteMarker Task_AoZone;
        if (!isNil{Task_TaskTrigger})then{deleteVehicle Task_TaskTrigger};
    };
};

[TaskDebug, "resetTask", "All task has been cleared.", false] call F90_fnc_debug;

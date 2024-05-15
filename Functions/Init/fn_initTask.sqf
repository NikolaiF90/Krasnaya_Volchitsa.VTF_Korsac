[TaskDebug, "initTask", "Initializing task system...", true] call F90_fnc_debug;

// Reset Task if already exist
[] call F90_fnc_resetTask;

Task_CurrentTaskID = "";
Task_ActiveTask = -1; // -1 None, 0 Assigned, 1 Completed, 2 Failed
Task_DutyName = "";
Task_DutyDescription = "";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed

Task_TaskTrigger = nil;

Task_PatrolTimeMin = Task_PatrolTimeMin * 60;
Task_PatrolTimeMax = Task_PatrolTimeMax * 60;
Task_PatrolTimeMid = (Task_PatrolTimeMin + Task_PatrolTimeMax) / 2;

Task_AllTask = 
[
    "Task_Patrol", 
    "Task_Ambush", 
    "Task_KillHVT",
    "Task_Support"
];

if (!isNil {Mission_TaskOfficer}) then 
{
    deleteVehicle Mission_TaskOfficer; 
};

private _group = createGroup [east, true];
Mission_TaskOfficer = _group createUnit ["min_rf_officer", Mission_TaskOfficerStartPos, [], 0, "FORM"];
Mission_TaskOfficer addAction ["Report Duty", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller, _actionId] spawn F90_fnc_requestMission}, nil, 1.5, true, true, "", "_this == Mission_Host", 5];
[Mission_TaskOfficer] call AIS_System_fnc_loadAIS;
["SETMONEY", [Mission_TaskOfficer, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;

// Hide or unhide markers based on debug option
if (TaskDebug) then 
{
    {
        _x setMarkerAlpha 1;
    } forEach Task_TownMarkers;
} else 
{
    {
        _x setMarkerAlpha 0;
    } forEach Task_TownMarkers;
};

[TaskDebug, "initTask", "Done initializing task system.", true] call F90_fnc_debug;
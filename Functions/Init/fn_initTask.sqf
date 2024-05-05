[TaskDebug, "initTask", "Initializing task system...", true] call F90_fnc_debug;

Task_ActiveTask = 0; // No task assigned

Task_AllTask = 
[
    "Task_Empty",
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
Mission_TaskOfficer addAction ["Report Duty", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller, _actionId] call F90_fnc_requestMission}, nil, 1.5, true, true, "", "_this == Mission_Host", 5];
[Mission_TaskOfficer] call AIS_System_fnc_loadAIS;
["SETMONEY", [Mission_TaskOfficer, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;

[TaskDebug, "initTask", "Done initializing task system.", true] call F90_fnc_debug;
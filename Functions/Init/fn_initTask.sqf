Task_TaskTrigger = objNull;

// Reset Task if already exist
if (!isNil {Task_CurrentTaskID}) then 
{
    if (Task_CurrentTaskID != "") then 
    {
        [true] call F90_fnc_resetTask;
    };
};

Task_CreatedPatrolGroups = []; // Created patrol units
Task_CurrentTaskID = "";
Task_MainTaskStatus = -1; // -1 None, 0 Assigned, 1 Completed, 2 Failed
publicVariable "Task_MainTaskStatus";
Task_DutyName = "";
publicVariable "Task_DutyName";
Task_DutyDescription = "";
publicVariable "Task_DutyDescription";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed
publicVariable "Task_DutyStatus";

Task_PatrolTimeMin = Task_PatrolTimeMin * 60;
Task_PatrolTimeMax = Task_PatrolTimeMax * 60;
Task_PatrolTimeMid = (Task_PatrolTimeMin + Task_PatrolTimeMax) / 2;

Task_AllTask = 
[
    "Task_Patrol", 
    "Task_Ambush", 
    "Task_KillHVT",
    "Task_Support",
    "Task_RTB"
];

// Delete task officer if already exist
if (!isNil {Mission_TaskOfficer}) then 
{
    deleteVehicle Mission_TaskOfficer; 
};

// Create reporting officer
private _group = createGroup [east, true];
Mission_TaskOfficer = _group createUnit ["min_rf_officer", Mission_TaskOfficerStartPos, [], 0, "FORM"];
Mission_TaskOfficer setCombatBehaviour "SAFE";
Mission_TaskOfficer setUnitPos "Up";
[Mission_TaskOfficer, "MOVE"] remoteExec ["disableAI", 0, true];

[Mission_TaskOfficer, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0, true]; 
[Mission_TaskOfficer, "HubBriefing_loop"] remoteExec ["playMoveNow", 0, true];

// Create a report duty action
private _reportDutyActionID = Mission_TaskOfficer getVariable ["Mission_ReportDutyActionID", -1];
if (_reportDutyActionID != -1) then 
{
    [Mission_TaskOfficer, _reportDutyActionID] remoteExec ["removeAction", 0, true];
};
[Mission_TaskOfficer] remoteExec ["F90_fnc_addReportDutyAction", 0, true];

[Mission_TaskOfficer] call AIS_System_fnc_loadAIS;
// ["SETMONEY", [Mission_TaskOfficer, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;

// Hide or unhide markers based on debug option
if (TaskDebug) then 
{
    {
        _x setMarkerAlpha 1;
    } forEach Task_TownMarkers + Task_BaseMarkers + Task_HideoutMarkers;
} else 
{
    {
        _x setMarkerAlpha 0;
    } forEach Task_TownMarkers + Task_BaseMarkers + Task_HideoutMarkers;
};

// Blacklist markers
{
    Persistent_MarkerBlacklists pushBack _x;
} forEach Task_TownMarkers + Task_BaseMarkers + Task_HideoutMarkers;
publicVariable "Persistent_MarkerBlacklists";
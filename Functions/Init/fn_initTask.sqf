Task_TaskTrigger = objNull;

// Reset Task if already exist
if (!isNil {Task_CurrentTaskID}) then 
{
    if (Task_CurrentTaskID != "") then 
    {
        [true] call F90_fnc_resetTask;
    };
};

// Created patrol units
Task_EnemyPatrols = []; 
// Spawned HVT. Used for resetting map
Task_SpawnedHVT = [];
// Created Assets. Used for resetting map and mission.
Task_CreatedAssets = [];

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

// Create task officer if not exist
if (isNil {Mission_TaskOfficer}) then 
{
    // Create reporting officer
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    Mission_TaskOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [Mission_TaskOfficer, mapX] spawn F90_fnc_teleportUnit;
    [Mission_TaskOfficer] call F90_fnc_setStandingAnimation;

    // Create a report duty action
    private _reportDutyActionID = Mission_TaskOfficer getVariable ["Mission_ReportDutyActionID", -1];
    if (_reportDutyActionID != -1) then 
    {
        [Mission_TaskOfficer, _reportDutyActionID] remoteExec ["removeAction", 0, true];
    };

    [
        Mission_TaskOfficer,
        "Report Duty",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            [] remoteExec ["F90_fnc_requestMission", 2];
        },
        "Task_MainTaskStatus == -1",
        "Mission_ReportDutyActionID"    
    ] remoteExec ["F90_fnc_addAction", 0, true];

    [Mission_TaskOfficer] call AIS_System_fnc_loadAIS;
};

// Finds towns for patrol task
Task_PatrolLocations = [["NameVillage", "NameCity", "NameCityCapital"]] call F90_fnc_getLocations;
// Finds locations for other task
Task_HideoutLocations = [["NameLocal"]] call F90_fnc_getLocations;

{
    private _key = _x;
    {
        private _nameArray = (_x select 0) splitString " ";
        private _index = _forEachIndex;
        if (_key in _nameArray) then 
        {
            Task_HideoutLocations deleteAt _index;
        };
    } forEach Task_HideoutLocations;
} forEach Task_HideoutBlacklist;

// Hide or unhide markers based on debug option
if (TaskDebug) then 
{
    {
        _x setMarkerAlpha 1;
    } forEach Task_BaseMarkers;
} else 
{
    {
        _x setMarkerAlpha 0;
    } forEach Task_BaseMarkers;
};

// Blacklist markers
{
    if !(_x in Persistent_MarkerBlacklists) then 
    {
        Persistent_MarkerBlacklists pushBack _x;
    };
} forEach Task_BaseMarkers;
publicVariable "Persistent_MarkerBlacklists";
params ["_taskType"];

private _taskCreated = false;

// Task variables
private _taskMarker = nil;
private _taskLocation = [];
private _taskArea = [];
private _taskAreaX = 0;
private _taskAreaY = 0;
private _taskAreaDir = 0;
private _condition = "";

// Task Patrol
switch (_taskType) do 
{
    case "Task_Patrol": 
    {
        Task_CurrentTaskID = "Patrol";

        Task_DutyName = "Patrol";
        Task_DutyDescription = "Perform a patrol on marked location.";
        Task_DutyStatus = 0;

        // Generate AO
        private _patrolLocation = selectRandom Task_PatrolLocations;
        private _markerName = [_patrolLocation select 0] call F90_fnc_generateUniqueID;
        _taskLocation = [_patrolLocation select 1 select 0, _patrolLocation select 1 select 1, 0];
        _taskMarker = createMarker [_markerName, _taskLocation];
        _taskArea = _patrolLocation select 3;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = _patrolLocation select 2;
        _taskMarker setMarkerAlpha 0;

        _condition = "this";
    };
    
    case "Task_Ambush": 
    {
        Task_CurrentTaskID = "Ambush";

        Task_DutyName = "Ambush";
        Task_DutyDescription = "We've got intels on recent rebels hideout. Perform an ambush on the location and clean the area.";
        Task_DutyStatus = 0;

        // Generate AO
        private _ambushLocation = selectRandom Task_HideoutLocations;
        private _markerName = [_ambushLocation select 0] call F90_fnc_generateUniqueID;
        _taskLocation = [_ambushLocation select 1 select 0, _ambushLocation select 1 select 1, 0];
        _taskMarker = createMarker [_markerName, _taskLocation];
        _taskArea = _ambushLocation select 3;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = _ambushLocation select 2;
        
        _condition = "this";
        [1, 4, _taskLocation] spawn F90_fnc_createPatrol;

        private _hvtSpawnPos = [_taskLocation, 5, 50] call BIS_fnc_findSafePos;
        [Task_AmbushHVTSpawnChance, _hvtSpawnPos] spawn F90_fnc_createHVT;

        // Randomly spawn seizable assets
        private _random = random 101;
        if (Task_SeizableAssetSpawnChance >= _random) then 
        {
            [_taskLocation] spawn F90_fnc_createSeizableAsset;
        };
    };

    case "Task_KillHVT": 
    {
        // Task Kill HVT
        Task_CurrentTaskID = "KillHVT";

        Task_DutyName = "HVT";
        Task_DutyDescription = "Take out or capture the High Value Target.";
        Task_DutyStatus = 0;

        // Generate AO
        private _possibleHVTLocation = Task_PatrolLocations + Task_HideoutLocations;
        private _hvtLocation = selectRandom _possibleHVTLocation;
        private _markerName = [_hvtLocation select 0] call F90_fnc_generateUniqueID;

        _taskLocation = [_hvtLocation select 1 select 0, _hvtLocation select 1 select 1, 0];
        _taskMarker = createMarker [_markerName, _taskLocation];
        _taskArea = _hvtLocation select 3;
        _taskAreaX = _taskArea select 0;
        _taskAreaY = _taskArea select 1;
        _taskAreaDir = _hvtLocation select 2;
        _taskMarker setMarkerAlpha 0;

        _condition = "this";

        [1, 1, _taskLocation] spawn F90_fnc_createPatrol;

        private _hvtSpawnPos = [_taskLocation, 5, 50] call BIS_fnc_findSafePos;
        [100, _hvtSpawnPos] spawn F90_fnc_createHVT;

        // Randomly spawn seizable assets
        private _random = random 101;
        if (Task_SeizableAssetSpawnChance >= _random) then 
        {
            [_taskLocation] spawn F90_fnc_createSeizableAsset;
        };
    };

    case "Task_Support": 
    {
        // Task Support 
        Task_CurrentTaskID = "Support";

        Task_DutyName = "Support";
        Task_DutyDescription = "Provide a support on marked location";
        Task_DutyStatus = 0;

        // Generate AO
        private _patrolLocation = selectRandom Task_PatrolLocations;
        private _markerName = [_patrolLocation select 0] call F90_fnc_generateUniqueID;

        _taskLocation = [_patrolLocation select 1 select 0, _patrolLocation select 1 select 1, 0];
        _taskMarker = createMarker [_markerName, _taskLocation];
        _taskArea = _patrolLocation select 3;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = _patrolLocation select 2;
        _taskMarker setMarkerAlpha 0;

        _condition = "this";
        [40, _taskMarker] spawn F90_fnc_createAmbush;
    };

    case "Task_RTB": 
    {
        // Task RTB
        Task_CurrentTaskID = "RTB";

        Task_DutyName = "Return To Base";
        Task_DutyDescription = "Return to base safely";
        Task_DutyStatus = 0;

        // Generate AO
        private _markerName = ["base"] call F90_fnc_generateUniqueID;
        _taskLocation = markerPos "base_0";
        _taskMarker = createMarker [_markerName, _taskLocation];
        _taskArea = markerSize "base_0";
        _taskAreaX = _taskArea select 0;
        _taskAreaY = _taskArea select 1;
        _taskAreaDir = markerDir "base_0";
        _taskMarker setMarkerAlpha 0;

        _condition = "missionCaptain in thisList";
    };
};

// Remove unused marker
deleteMarker _taskMarker;

// Create task trigger
[_taskLocation, _taskAreaX, _taskAreaY, _taskAreaDir, _condition] call F90_fnc_createAOTrigger;

// Create a marker at location
[Task_CurrentTaskID, _taskLocation, _taskAreaX, _taskAreaY, _taskAreaDir] call F90_fnc_createAOMarker;

// Notify player
[east, Task_CurrentTaskID, "CREATED"] call F90_fnc_showTaskNotification;

// Make current task public to all players
publicVariable "Task_DutyName";
publicVariable "Task_DutyDescription";
publicVariable "Task_DutyStatus";

// Let player know task has been created and assigned
[Task_DutyDescription] remoteExec ["F90_fnc_textNotification", 0, true];

// Run task handler
[_taskType] spawn F90_fnc_activeTaskHandler;

if (Task_CurrentTaskID != "") then 
{
    _taskCreated = true;
};

_taskCreated
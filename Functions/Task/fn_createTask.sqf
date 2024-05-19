params ["_taskType"];

[TaskDebug, "createTask", format ["Creating task %1...", _taskType], false] call F90_fnc_debug;

private _taskCreated = false;

// Task variables
private _locationIndex = -1;
private _taskMarker = nil;
private _taskLocation = [];
private _taskArea = [];
private _taskAreaX = 0;
private _taskAreaY = 0;
private _taskAreaDir = 0;
private _condition = "";
private _ambush = false;
private _spawnPercentage = 0;

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
        _locationIndex = floor (random (count Task_TownMarkers));
        _taskMarker = Task_TownMarkers # _locationIndex;
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _condition = "this";
        _ambush = true;
        _spawnPercentage = 60;
    };
    
    case "Task_Ambush": 
    {
        // Task Ambush
        Task_CurrentTaskID = "Ambush";

        Task_DutyName = "Ambush";
        Task_DutyDescription = "Ambush the marker AO.";
        Task_DutyStatus = 0;

        // Generate AO
        _locationIndex = floor (random (count Task_TownMarkers));
        _taskMarker = Task_TownMarkers # _locationIndex;
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _condition = "this";
        _ambush = false;
    };

    case "Task_KillHVT": 
    {
        // Task Kill HVT
        Task_CurrentTaskID = "KillHVT";

        Task_DutyName = "HVT";
        Task_DutyDescription = "Take out or capture the High Value Target.";
        Task_DutyStatus = 0;

        // Generate AO
        _locationIndex = floor (random (count Task_TownMarkers));
        _taskMarker = Task_TownMarkers # _locationIndex;
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _condition = "this";
        _ambush = true;
        _spawnPercentage = 40;
    };

    case "Task_Support": 
    {
        // Task Support 
        Task_CurrentTaskID = "Support";

        Task_DutyName = "Support";
        Task_DutyDescription = "Provide a support on marked location";
        Task_DutyStatus = 0;

        // Generate AO
        _locationIndex = floor (random (count Task_TownMarkers));
        _taskMarker = Task_TownMarkers # _locationIndex;
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _condition = "this";
        _ambush = true;
        _spawnPercentage = 60;
    };

    case "Task_RTB": 
    {
        // Task RTB
        Task_CurrentTaskID = "RTB";

        Task_DutyName = "Return To Base";
        Task_DutyDescription = "Return to base safely";
        Task_DutyStatus = 0;

        // Reset unused variables
        _locationIndex = -1;

        // Generate AO
        _taskMarker = "base_0";
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _condition = "Mission_Host in thisList";
        _ambush = false;
    };
};

// Create task trigger
[_taskLocation, _taskAreaX, _taskAreaY, _taskAreaDir, _condition] call F90_fnc_createAOTrigger;

// Create a marker at location
[Task_CurrentTaskID, _taskLocation, _taskAreaX, _taskAreaY, _taskAreaDir] call F90_fnc_createAOMarker;

// Notify player
[east, Task_CurrentTaskID, "CREATED"] call F90_fnc_showTaskNotification;

// Create random ambushes if needed
if (_ambush) then 
{
    [_spawnPercentage, _taskMarker] call F90_fnc_createAmbush;
};

// Let player know task has been created and assigned
Task_ActiveTask = 0;
Task_DutyStatus = 0;
[TaskDebug, "createTask", format ["Current task: %1", Task_DutyName], true] call F90_fnc_debug;
hint Task_DutyDescription;

// Run task handler
[_taskType] spawn F90_fnc_activeTaskHandler;

if (Task_CurrentTaskID != "") then 
{
    _taskCreated = true;
};

_taskCreated;
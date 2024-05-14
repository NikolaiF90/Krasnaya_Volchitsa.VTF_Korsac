

params ["_target", "_caller", "_actionID"];

[TaskDebug, "requestMission", "Requesting mission...", false] call F90_fnc_debug;

if (Task_ActiveTask == -1) then 
{
    [TaskDebug, "requestMission", "There are currently no active task assigned. Creating one now...", false] call F90_fnc_debug;
    // Task variables
    private _taskIcon = "";
    private _title = "";
    private _description = "";
    private _locationIndex = -1;
    private _taskMarker = nil;
    private _taskLocation = [];
    private _taskArea = [];
    private _taskAreaX = 0;
    private _taskAreaY = 0;
    private _taskAreaDir = 0;

    private _taskCondition = "";

    // Give random task
    private _taskIndex = floor (random (count Task_AllTask)); 
    private _taskName = Task_AllTask # _taskIndex;

    // Task Patrol
    if (_taskIndex == 0) then 
    {
        Task_CurrentTaskID = "Patrol";

        _taskIcon = "navigate";
        _title = "Patrol";
        _description = "Perform a patrol on marked location.";

        // Generate patrol location
        _locationIndex = floor (random (count Task_TownMarkers));
        _taskMarker = Task_TownMarkers # _locationIndex;
        _taskLocation = markerPos _taskMarker;

        _taskArea = markerSize _taskMarker;
        _taskAreaX = _taskArea # 0;
        _taskAreaY = _taskArea # 1;
        _taskAreaDir = markerDir _taskMarker;

        _taskCondition = "this";

        // Create task trigger
        Task_TaskTrigger = createTrigger ["EmptyDetector", _taskLocation];
        Task_TaskTrigger setTriggerArea [_taskAreaX, _taskAreaY, _taskAreaDir, true];
        Task_TaskTrigger setTriggerActivation ["EAST", "PRESENT", true];
        Task_TaskTrigger setTriggerStatements [_taskCondition, "", ""];
        // Task_TaskTrigger setTriggerTimeout [Task_PatrolTimeMin, Task_PatrolTimeMid, Task_PatrolTimeMax, true];

        // Create random ambushes

        // Create and assign the task to player
        [east, Task_CurrentTaskID, [_description, _title], _taskLocation, true] call BIS_fnc_taskCreate;
        [Task_CurrentTaskID, _taskIcon] call BIS_fnc_taskSetType;
        sleep 2;
        [Task_CurrentTaskID] call BIS_fnc_deleteTask;
        
        // Create a marker at location
        Task_AoZone = createMarker ["PatrolZone", _taskLocation];
        Task_AoZone setMarkerAlpha 1;
        Task_AoZone setMarkerBrush "FDiagonal";
        Task_AoZone setMarkerColor "ColorRed";
        Task_AoZone setMarkerDir _taskAreaDir;
        Task_AoZone setMarkerShape "Rectangle";
        Task_AoZone setMarkerSize [_taskAreaX, _taskAreaY];

        Task_AoMarker = createMarker ["PatrolMarker", _taskLocation];
        Task_AoMarker setMarkerAlpha 1;
        Task_AoMarker setMarkerColor "ColorWhite";
        Task_AoMarker setMarkerDir 0;
        Task_AoMarker setMarkerText _title;
        Task_AoMarker setMarkerType "hd_dot";

        // Blacklist marker from saving
        Persistent_MarkerBlacklists pushBack Task_AoMarker;
        Persistent_MarkerBlacklists pushBack Task_AoZone;

        // Let player know task has been created and assigned
        if (!isNil {Task_TaskTrigger}) then 
        {
            Task_ActiveTask = 0;
            [TaskDebug, "requestMission", format ["Current task: %1", _taskName], true] call F90_fnc_debug;
            hint _description;
            _target removeAction _actionID;
        };

        // Run task handler
        [] spawn 
        {
            private _patrolDuration = floor (random [Task_PatrolTimeMin, Task_PatrolTimeMid, Task_PatrolTimeMax]);
            private _remaining = _patrolDuration;
            private _detected = false;
            private _inAO = false;
            while {Task_ActiveTask == 0} do 
            {
                if (!isNil "Task_TaskTrigger") then 
                {
                    if (triggerActivated Task_TaskTrigger) then 
                    {
                        _inAO = true;
                    }else 
                    {
                        _inAO = false;
                    };
                };

                if (_inAO && !_detected) then 
                {
                    _detected = true;
                };

                if (_inAO && _detected) then 
                {
                    if (_remaining >= 0) then 
                    {
                        hint "";
                        hint format ["Please patrol the area for %1 seconds.", _remaining];
                        _remaining = _remaining - 1;
                        sleep 1;
                    };

                    if (_remaining <= 0) then
                    {
                        hint "Patrol Completed"; 
                        sleep 2;
                        Task_ActiveTask = 1;
                        [] call F90_fnc_resetTask;
                    };
                };

                if (!_inAO && _detected) then 
                {
                    _remaining = _patrolDuration;
                    hint "Please return and stay within patrol area!";
                    sleep 1;
                    hint "";
                };
            };
        };
    };
};
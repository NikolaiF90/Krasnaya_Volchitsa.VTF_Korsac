params ["_taskType"];

private _detected = false;
private _inAO = false;
private _taskCompleted = false;

private _duration = 0;

if (_taskType == "Task_Patrol") then 
{
    _duration = floor (random [Task_PatrolTimeMin, Task_PatrolTimeMid, Task_PatrolTimeMax]);
};

private _remaining = _duration;

while {Task_DutyStatus == 0} do 
{
    if (!isNull Task_TaskTrigger) then 
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
        switch (_taskType) do 
        {
            case "Task_Patrol":
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
                    [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                    
                    Task_DutyStatus = 1;
                    Task_DutyName = "";
                    Task_DutyDescription = "";
                    deleteMarker Task_AoMarker;
                    deleteMarker Task_AoZone;
                    Persistent_MarkerBlacklists = [];

                    // prevent code running any further
                    _inAO = false;
                    _detected = false;
                    sleep 1;

                    // RTB mission
                    ["Task_RTB"] call F90_fnc_createTask;
                    _taskCompleted = true;
                };
            };

            case "Task_Ambush":
            {
                hint "Ambush Completed"; 
                [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_DutyStatus = 1;
                Task_DutyName = "";
                Task_DutyDescription = "";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;
                Persistent_MarkerBlacklists = [];

                // prevent code running any further
                _inAO = false;
                _detected = false;
                sleep 1;

                // RTB mission
                ["Task_RTB"] call F90_fnc_createTask;
                _taskCompleted = true;
            };

            case "Task_KillHVT":
            {
                hint "HVT Killed"; 
                [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_DutyStatus = 1;
                Task_DutyName = "";
                Task_DutyDescription = "";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;
                Persistent_MarkerBlacklists = [];

                // prevent code running any further
                _inAO = false;
                _detected = false;
                sleep 1;

                // RTB mission
                ["Task_RTB"] call F90_fnc_createTask;
                _taskCompleted = true;
            };

            case "Task_Support":
            {
                hint "Support Provided"; 
                [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_DutyStatus = 1;
                Task_DutyName = "";
                Task_DutyDescription = "";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;
                Persistent_MarkerBlacklists = [];

                // prevent code running any further
                _inAO = false;
                _detected = false;
                sleep 1;

                // RTB mission
                ["Task_RTB"] call F90_fnc_createTask;
                _taskCompleted = true;
            };

            case "Task_RTB":
            {
                hint "Report the mission to your reporting officer"; 
                [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_ActiveTask = 1;
                Task_DutyStatus = 1;
                Task_DutyName = "Report Out";
                Task_DutyDescription = "Report the mission to your reporting officer";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;
                Persistent_MarkerBlacklists = [];

                Mission_TaskOfficer addAction 
                [
                    "<t color='#23d1cd'>Report to officer</t>", 
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"]; 

                        [] call F90_fnc_reportMission; 
                        _target removeAction _actionId;
                    }, 
                    nil, 
                    1.5, 
                    true, 
                    true, 
                    "", 
                    "_this == Mission_Host", 
                    5
                ];

                // prevent code running any further
                _inAO = false;
                _detected = false;

                _taskCompleted = true;
            };
        };
    };

    if (!_inAO && _detected) then 
    {
        if (_taskType == "Task_Patrol") then 
        {
            _remaining = _duration;
            hint "Please return and stay within patrol area!";
            sleep 1;
            hint "";
        };
    };

    if (_taskCompleted) exitWith {[TaskDebug, "activeTaskHandler", "Task Handler ended.", false] call F90_fnc_debug;};
};
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
                    // prevent code running any further
                    _inAO = false;
                    _detected = false;
                    sleep 1;

                    // RTB mission
                    _taskCompleted = [] call F90_fnc_completePatrol;
                };
            };

            case "Task_Ambush":
            {
                if (count Task_CreatedPatrolGroups > 0) then 
                {
                    {
                        private _groupArray = units _x;

                        // Remove from group array if injured or being arrested
                        {
                            private _isArrested = _x getVariable ["CAB_IsArrested", false];
                            
                            private _isCaptive = _x getVariable ["ais_unconscious", false];

                            if (_isCaptive || _isArrested) then 
                            {
                                _groupArray deleteAt _forEachIndex;
                            };
                        } forEach _groupArray;

                        // Counts remaining members thats still alive
                        private _aliveUnitCount = count (_groupArray select {alive _x});

                        // Remove the group from patrol groups if none alive and able to combat
                        if (_aliveUnitCount <= 0) then 
                        {
                            Task_CreatedPatrolGroups = Task_CreatedPatrolGroups - [_x];
                        };
                    } forEach Task_CreatedPatrolGroups;
                } else 
                {
                    hint "Ambush Completed"; 
                    [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                    
                    Task_DutyStatus = 1;
                    Task_DutyName = "";
                    Task_DutyDescription = "";
                    deleteMarker Task_AoMarker;
                    deleteMarker Task_AoZone;
                    Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
                    // prevent code running any further
                    _inAO = false;
                    _detected = false;
                    sleep 1;

                    // RTB mission
                    ["Task_RTB"] call F90_fnc_createTask;
                    _taskCompleted = true;
                };
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
                Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];

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
                Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];

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
                ["Report the mission to your reporting officer"] remoteExec ["hint", 0, true]; 
                [east, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_MainTaskStatus = 1;
                publicVariable "Task_MainTaskStatus";
                Task_DutyStatus = 0;
                Task_DutyName = "Report Out";
                Task_DutyDescription = "Report the mission to your reporting officer";

                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;
                Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];

                {
                    _x setVariable ["TASK_IsSuccessfulMission", true, true];
                } forEach allPlayers;

                private _reportMissionActionID = Mission_TaskOfficer getVariable ["Mission_ReportMissionActionID", -1];
                if (_reportMissionActionID == -1) then 
                {
                    [Mission_TaskOfficer] remoteExec ["F90_fnc_addReportMissionAction", 0, true];
                };

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

    if (_taskCompleted) exitWith {};
};
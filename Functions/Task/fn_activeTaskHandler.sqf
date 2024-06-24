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
                    ["Ambush Completed"] call F90_fnc_textNotification; 
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
                ["HVT Killed"] call F90_fnc_textNotification; 
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
                ["Support Provided"] call F90_fnc_textNotification; 
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
                ["Report the mission to your reporting officer"] remoteExec ["F90_fnc_textNotification", 0, true]; 
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

                // Delete action if already exist
                private _actionID = Mission_TaskOfficer getVariable ["Mission_ReportMissionActionID", -1];
                if (_actionID != -1) then 
                {
                    [Mission_TaskOfficer, _actionID, "Mission_ReportMissionActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
                };
                
                [
                    Mission_TaskOfficer, 
                    "Report to officer", 
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"]; 
                        
                        [_target, _actionId, "Mission_ReportMissionActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
                        [] remoteExec ["F90_fnc_showReport", 0];
                        [] remoteExec ["F90_fnc_resetTask", 2];
                    },
                    "true",
                    "Mission_ReportMissionActionID"
                ] remoteExec ["F90_fnc_addAction", 0, true];

                // Generate wages
                [] remoteExec ["F90_fnc_generateGroupWages", 0, true];

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
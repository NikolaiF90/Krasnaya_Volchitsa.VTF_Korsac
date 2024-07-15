params ["_taskType"];

private _fn_getIncompetentUnit = 
{
    params ["_groupArray"];
    
    private _defeatedUnits = [];
    {
        private _member = _x;
        private _isArrested = _member getVariable ["CAB_IsArrested", false];
        private _isCaptive = _member getVariable ["ais_unconscious", false];

        if ((_isArrested || _isCaptive) && !(_member in _defeatedUnits)) then 
        {
            _defeatedUnits pushBack _member;
        };

        if (!(alive _member) && !(_member in _defeatedUnits)) then 
        {
            _defeatedUnits pushBack _member;
        };
    } forEach _groupArray;

    _defeatedUnits
};

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
                    // Spawn QRF groups 
                    [60, position Task_TaskTrigger] spawn F90_fnc_createAmbush;

                    // Notify remining patrol time to all players
                    [""] remoteExec ["hintSilent", 0, true];
                    private _text = format ["Please patrol the area for %1 seconds.", _remaining];
                    [_text] remoteExec ["hintSilent", 0, true];

                    _remaining = _remaining - 1;
                };

                if (_remaining <= 0) then
                {
                    // Stop hinting to all players 
                    [""] remoteExec ["hintSilent", 0, true];

                    // prevent code running any further
                    _inAO = false;
                    _detected = false;

                    // RTB mission
                    _taskCompleted = [] call F90_fnc_completePatrol;
                };
            };

            case "Task_Ambush":
            {
                // Get all units
                private _activeUnits = [];
                {
                    _activeUnits pushBack _x;
                } forEach Task_SpawnedHVT + Task_EnemyPatrols;
                private _allUnitsCounts = count _activeUnits;
                
                // Get injured or dead units
                private _incompetentUnits = ([_activeUnits] call _fn_getIncompetentUnit);
                private _aliveUnitsCount = _allUnitsCounts - (count _incompetentUnits);
                
                if (_aliveUnitsCount < 1) then 
                {
                    ["Ambush Completed"] call F90_fnc_textNotification; 
                    [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                    
                    Task_DutyStatus = 1;
                    Task_DutyName = "";
                    Task_DutyDescription = "";
                    Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
                    publicVariable "Persistent_MarkerBlacklists";
                    deleteMarker Task_AoMarker;
                    deleteMarker Task_AoZone;
                    // prevent code running any further
                    _inAO = false;
                    _detected = false;

                    // RTB mission
                    ["Task_RTB"] call F90_fnc_createTask;
                    _taskCompleted = true;
                };
            };

            case "Task_KillHVT":
            {
                if ((count Task_SpawnedHVT) == 1) then 
                {
                    private _hvtUnit = Task_SpawnedHVT select 0;
                    if !(alive _hvtUnit) then 
                    {
                        // Remove unit from array 
                        Task_SpawnedHVT deleteAt 0;

                        // Spawn enemy QRF
                        [80, position Task_TaskTrigger] spawn F90_fnc_createAmbush;

                        // Notify player
                        ["HVT Killed"] call F90_fnc_textNotification; 
                        [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;

                        // Update task status
                        Task_DutyStatus = 1;
                        Task_DutyName = "";
                        Task_DutyDescription = "";
                        Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
                        publicVariable "Persistent_MarkerBlacklists";
                        deleteMarker Task_AoMarker;
                        deleteMarker Task_AoZone;

                        // prevent code running any further
                        _inAO = false;
                        _detected = false;

                        // RTB mission
                        ["Task_RTB"] call F90_fnc_createTask;
                        _taskCompleted = true;
                    };
                } else 
                {
                    [MissionDebug, "activeTaskHandler\Task_KillHVT", format ["Array Task_SpawnedHVT count is not 1! Task_SpawnedHVT = %1", Task_SpawnedHVT], true] call F90_fnc_debug;
                };
            };

            case "Task_Support":
            {
                ["Support Provided"] call F90_fnc_textNotification; 
                [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_DutyStatus = 1;
                Task_DutyName = "";
                Task_DutyDescription = "";
                Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
                publicVariable "Persistent_MarkerBlacklists";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;

                // prevent code running any further
                _inAO = false;
                _detected = false;

                // RTB mission
                ["Task_RTB"] call F90_fnc_createTask;
                _taskCompleted = true;
            };

            case "Task_RTB":
            {
                ["Report the mission to your reporting officer"] remoteExec ["F90_fnc_textNotification", 0, true]; 
                [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
                
                Task_MainTaskStatus = 1;
                publicVariable "Task_MainTaskStatus";
                Task_DutyStatus = 0;
                Task_DutyName = "Report Out";
                Task_DutyDescription = "Report the mission to your reporting officer";

                Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
                publicVariable "Persistent_MarkerBlacklists";
                deleteMarker Task_AoMarker;
                deleteMarker Task_AoZone;

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

    sleep Task_CheckInterval;
};
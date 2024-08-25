params ["_convoyPosition"];

private _taskVariation = 0;

switch (_taskVariation) do 
{
    case 0: 
    {
        // Create Convoy
        private _convoyCars = [];
        private _convoyCount = 2;
        // Store allied units for Task Support
        Task_SupportAlliedUnits = [];
        
        for "_i" from 0 to (_convoyCount) -1 do 
        {
            private _carType = selectRandom Support_TruckList;
            if (isNil {_carType}) then {_carType = selectRandom Support_AlliedFactionVehicles};
            private _carPosition = [_convoyPosition, 5, 20, 5] call BIS_fnc_findSafePos;
            private _car = _carType createVehicle (_carPosition);
            Task_SupportSpawnedVehicles pushBack _car;
            
            // Create crew
            private _emptySeats = _car emptyPositions "";

            0 = [_emptySeats, _carPosition] spawn 
            {
                params ["_emptySeats", "_carPosition"];
                private _group = createGroup [Mission_AlliedSide, true];
                
                if (_emptySeats > 0) then 
                {
                    for "_i" from 0 to (_emptySeats -1) do 
                    {
                        private _member = [_group, (selectRandom DSC_AlliedUnitList), _carPosition] call F90_fnc_createUnit;
                        Task_SupportAlliedUnits pushBack _member;
                    };
                };
            };

        };

        0 = [_convoyPosition] spawn 
        {
            params ["_convoyPosition"];

            for "_i" from 0 to (Task_SupportEnemyQRFGroupCount)-1 do 
            {
                Task_AmbushUnits = [100, _convoyPosition, [200, 500]] call F90_fnc_createAmbush;
            };
        };

        // Task Handler
        0 = [_convoyPosition] spawn 
        {
            params ["_convoyPosition"];

            private _isSuccess = false;

            // To make sure mission doesnt immediately completed upon starting
            // Code seems to execute before the mission even able to create any units
            waitUntil {(!isNil {Task_SupportAlliedUnits}) && (!isNil {Task_AmbushUnits})};
            waitUntil {(count Task_SupportAlliedUnits > 0) && (count Task_AmbushUnits > 0)};
            sleep 5;
            while {true} do 
            {
                // Count Alive units 
                private _alliedAliveCount = {alive _x} count Task_SupportAlliedUnits;
                private _enemyAliveCount = {alive _x} count Task_AmbushUnits;

                if (_alliedAliveCount <= 0) exitWith {_isSuccess = false};
                if (_enemyAliveCount <= 0) exitWith {_isSuccess = true};
                sleep 5;
            };

            // RTB mission
            {  
                if (_isSuccess) then 
                {
                    _x setVariable ["TASK_IsSuccessfulMission", true, true];
                } else 
                {
                    _x setVariable ["TASK_IsSuccessfulMission", false, true];
                };
            } forEach allPlayers;

            private _alliedAliveCount = {alive _x} count Task_SupportAlliedUnits;
            if (_alliedAliveCount > 0) then 
            {
                private _dismissLocation = [_convoyPosition, 800, 1200] call BIS_fnc_findSafePos;
                {
                    if (alive _x) then 
                    {
                        _x doMove _dismissLocation;
                    };
                } forEach Task_SupportAlliedUnits;
            };

            ["Support Provided"] call F90_fnc_textNotification; 
            [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;
            
            Task_DutyStatus = 1;
            Task_DutyName = "";
            Task_DutyDescription = "";
            Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
            publicVariable "Persistent_MarkerBlacklists";
            deleteMarker Task_AoMarker;
            deleteMarker Task_AoZone;
            
            ["Task_RTB"] call F90_fnc_createTask;
        };
    };
};
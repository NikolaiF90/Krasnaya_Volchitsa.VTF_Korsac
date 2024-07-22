params ["_operation", "_args"];

private _returnValue = nil;

switch _operation do
{
    case "ADD": {};
    case "ARREST": 
    {
        private _target = _args # 0;
        private _caller = _args # 1;

        private _hasBeenArrested = _target getVariable ["CAB_HasBeenArrested", false];

        private _detaineeData = _target getVariable "CAB_WantedData";
        private _fullName = _detaineeData # 0;
        private _arrestReward = _detaineeData # 3;

        if !(_hasBeenArrested) then 
        {
            _target setVariable ["CAB_HasBeenArrested", true, true];

            // Reward 
            [_caller, _arrestReward] call F90_fnc_addMoney;
            // Notify player
            private _notificationText = [format ["%1 has been arrested. ", _fullName], format ["You will be rewarded with %1 milcash.", _arrestReward]];
            [_notificationText, "DEFAULT"] call F90_fnc_textNotification;
            
            if (_detaineeData in REC_WantedList) then
            {
                private _index = REC_WantedList find _detaineeData;
                REC_WantedList deleteAt _index;
            };

            _returnValue = _detaineeData;

            // Update temporary captured hvts
            if (Task_MainTaskStatus == 0) then 
            {
                private _tempCapturedHVT = _caller getVariable "REC_TempHVTCaptured";
                
                _tempCapturedHVT = _tempCapturedHVT + 1;
                _caller setVariable ["REC_TempHVTCaptured", _tempCapturedHVT];
            } else 
            {
                private _totalArrestedHVT = _caller getVariable "Record_TotalArrestedHVT";
                
                _totalArrestedHVT = _totalArrestedHVT + 1;
                _caller setVariable ["Record_TotalArrestedHVT", _totalArrestedHVT];
            };
        } else 
        {
            // Notify player
            private _notificationText = [format ["%1 has been arrested. ", _fullName], format ["You will be rewarded with %1 milcash.", _arrestReward]];
            [_notificationText, "DEFAULT"] call F90_fnc_textNotification;
        };
    };
    case "KILL": 
    {
        private _killer = _args # 0;
        private _killed = _args # 1;

        // Reward 
        private _killedData = _target getVariable "CAB_WantedData";;
        private _fullName = _killedData # 0;
        private _arrestReward = _killedData # 3;
        private _killReward = _killedData # 4;
        
        private _hasBeenArrested = _killed getVariable ["CAB_HasBeenArrested", false];

        if (Task_MainTaskStatus == 0) then 
        {
            if (_hasBeenArrested) then 
            {
                // Deduct temp captured hvt if player had arrested the hvt before
                private _tempCapturedHVT = _caller getVariable "REC_TempHVTCaptured";
                _tempCapturedHVT = _tempCapturedHVT - 1;
                _caller setVariable ["REC_TempHVTCaptured", _tempCapturedHVT, true]; 

                // Deduct money if has been arrested before 
                [_killer, _arrestReward] call F90_fnc_deductMoney;
            };

            private _tempHVTKilled = _killer getVariable ["REC_TempHVTKilled", 0];
            _tempHVTKilled = _tempHVTKilled + 1;
            _killer setVariable ["REC_TempHVTKilled", _tempHVTKilled, true];
        } else 
        {
            if (_hasBeenArrested) then 
            {
                // Deduct Total captured hvt if player had arrested the hvt before
                private _totalCapturedHVT = _caller getVariable "Record_TotalArrestedHVT";
                _totalCapturedHVT = _totalCapturedHVT - 1;
                _caller setVariable ["Record_TotalArrestedHVT", _totalCapturedHVT, true]; 
            };

            private _totalHVTKilled = _killer getVariable ["Record_TotalKilledHVT", 0];
            _totalHVTKilled = _totalHVTKilled + 1;
            _killer setVariable ["Record_TotalKilledHVT", _totalHVTKilled, true];
        };

        [_killer, _killReward] call F90_fnc_addMoney;
        private _notificationText = [format ["%1 has been confirmed KIA. ", _fullName], format ["You will be rewarded with %1 milcash.", _killReward]];
        [_notificationText, "DEFAULT"] call F90_fnc_textNotification;
        
        if (_killedData in REC_WantedList) then 
        {
            private _index = REC_WantedList find _killedData;
            REC_WantedList deleteAt _index;
        };

        _returnValue = _killedData;
    };
};

publicVariable "REC_WantedList";

_returnValue
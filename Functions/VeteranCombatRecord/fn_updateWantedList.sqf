params ["_operation", "_args"];

private _returnValue = nil;

switch _operation do
{
    case "ADD": {};
    case "ARREST": 
    {
        private _target = _args # 0;
        private _caller = _args # 1;
        private _index = _args # 2;

        // Reward 
        private _detaineeData = REC_WantedList # _index;
        private _fullName = _detaineeData # 0;
        private _arrestReward = _detaineeData # 3;

        ["ADDMONEY", [_caller, _arrestReward]] call F90_fnc_economyHandler;
        [format ["%1 has been arrested.<br />You will be rewarded with %2 milcash.", _fullName, _arrestReward], "DEFALT", 4, 101, false] call F90_fnc_textNotification;
        [format ["%1 has been arrested.", _fullName], player] call F90_fnc_addToRecentNotification;
        REC_WantedList deleteAt _index;

        _returnValue = _detaineeData;
    };
    case "KILL": 
    {
        private _killer = _args # 0;
        private _killed = _args # 1;
        private _index = _args # 2;

        private _tempHVTKilled = _killer getVariable ["REC_TempHVTKilled", 0];
        _tempHVTKilled = _tempHVTKilled + 1;
        _killer setVariable ["REC_TempHVTKilled", _tempHVTKilled, true];

        // Reward 
        private _killedData = REC_WantedList # _index;
        private _fullName = _killedData # 0;
        private _killReward = _killedData # 3;

        ["ADDMONEY", [_killer, _killReward]] call F90_fnc_economyHandler;
        [format ["%1 has been confirmed KIA.<br />You will be rewarded with %2 milcash.", _fullName, _killReward], "DEFAULT", 4, 101, false] call F90_fnc_textNotification;
        [format ["%1 has been confirmed KIA.", _fullName], player] call F90_fnc_addToRecentNotification;
        REC_WantedList deleteAt _index;

        _returnValue = _killedData;
    };
};

publicVariable "REC_WantedList";

_returnValue
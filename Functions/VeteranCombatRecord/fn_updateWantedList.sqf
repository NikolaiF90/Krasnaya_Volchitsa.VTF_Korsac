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

        private _totalArrested = _caller getVariable "Record_TotalArrestedHVT";
        _totalArrested = _totalArrested + 1;
        _caller setVariable ["Record_TotalArrestedHVT", _totalArrested];

        // Reward 
        private _detaineeData = CAB_WantedList # _index;
        private _fullName = _detaineeData # 0;
        private _arrestReward = _detaineeData # 3;

        ["ADDMONEY", [_caller, _arrestReward]] call F90_fnc_economyHandler;
        hint format ["%1 has been arrested.\nYou have been rewarded with %2 milcash.", _fullName, _arrestReward];
        CAB_WantedList deleteAt _index;

        _returnValue = _detaineeData;
    };
    case "KILL": {};
};

sleep 3; // Temporary
_returnValue;
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

        ["ADDMONEY", [_caller, CAB_HVTArrestReward]] call F90_fnc_economyHandler;

        private _hvtName = CAB_WantedList # _index;
        private _fullName = _hvtName # 0;
        
        _target disableAI "MOVE";
        _target setCaptive true;
        [_target, "AmovPercMstpSnonWnonDnon_Ease"] remoteExec ["playMove"]; 
        [_target, "ANIM"] remoteExec ["disableAI"];
        hint format ["%1 has been arrested.\nYou have been rewarded with %2 milcash.", _fullName, CAB_HVTArrestReward];
        CAB_WantedList deleteAt _index;

        _returnValue = _hvtName;
    };
    case "KILL": {};
};

sleep 3; // Temporary
_returnValue;


private _reward = 0;
private _points = 0;
private _mainCompleted = nil;

if (Task_ActiveTask == 1) then 
{
    _mainCompleted = true;
} else
{
    _mainCompleted = false;
};

if (_mainCompleted) then 
{
    _points = _points + 10;
};

// Casualty check

// Asset used check 

// Asset check 

// HVT Check 

// Kill Check 

// Reward player 
_reward = _points * 100; 
["ADDMONEY", [Mission_Host, _reward]] call F90_fnc_economyHandler;
[] call F90_fnc_resetTask;

Mission_TaskOfficer addAction 
[
    "<t color='#23d1cd'>Report Duty</t>", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        [_target, _caller, _actionId] call F90_fnc_requestMission;
        _target removeAction _actionID;
    },
    nil, 
    1.5, 
    true, 
    true, 
    "", 
    "_this == Mission_Host", 
    5
];
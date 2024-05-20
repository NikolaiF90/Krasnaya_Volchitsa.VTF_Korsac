
private _reward = 0;
private _totalPoints = 0;
private _successfulOperation = 0;
private _mainCompleted = nil;

VCR_TotalMissionsConducted = VCR_TotalMissionsConducted + 1;

if (Task_ActiveTask == 1) then 
{
    _mainCompleted = true;
    VCR_TotalMissionSuccess = VCR_TotalMissionSuccess + 1;
} else
{
    _mainCompleted = false;
};

if (_mainCompleted) then 
{
    _successfulOperation = Points_MissionCompleted;
    _totalPoints = _totalPoints + _successfulOperation;
};

// Deduction 
private _heliDeduction = 0;

private _heliUsedDeduction = VCR_TempHeliUsed * Points_HeliUsedDeduction;
private _lightArmedHeliDeduction = VCR_TempLightArmedHeliLoss * Points_LightArmedHeliLoss;
private _lightUnarmedHeliDeduction = VCR_TempLightUnarmedHeliLoss * Points_LightUnarmedHeliLoss;
private _atttackHeliDeduction = VCR_TempAttackHeliLoss * Points_AttackHeliLoss;

_heliDeduction = _heliDeduction - (_heliUsedDeduction + _lightArmedHeliDeduction + _lightUnarmedHeliDeduction + _atttackHeliDeduction);
[VCRDebug, "reportMission", format ["Heli Points: %1", _heliDeduction], false] call F90_fnc_debug;
_totalPoints = _totalPoints + _heliDeduction;

private _killPoints = VCR_TempKillCount * Points_ConfirmedKill;
_totalPoints = _totalPoints + _killPoints;

VCR_TempHVTKilled = 0;
VCR_TempHVTCaptured = 0;
VCR_TempAirSupportUsed = 0;
VCR_TempArtilleryUsed = 0;
VCR_TempVehiclesUsed = 0;
VCR_TempCivilianCasualties = 0;
VCR_TempTeamCasualties = 0;

// Casualty check
// Team Casualty
// Transport Casualty
// Civilan Casualty

// Asset used check 
// Air support
// Artillery
// Vehicles
// Asset check 

// HVT Check 
// HVT Killed
// HVT Captured

// Kill Check 

// Reward player 
_reward = _totalPoints * 10; 
if (_reward > 0) then 
{
    ["ADDMONEY", [Mission_Host, _reward]] call F90_fnc_economyHandler;
} else 
{
    if (_reward < 0) then 
    {
        ["DEDUCTMONEY", [Mission_Host, _reward]] call F90_fnc_economyHandler;
    };
};
[] call F90_fnc_resetTask;

[_heliDeduction, _successfulOperation, _totalPoints, _reward] call F90_fnc_showReport;
[Mission_Host] call F90_fnc_transferRecord;

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
params ["_unit"];

[_unit, "Reporting out."] remoteExec ["sideChat", 0, true];

private _totalPoints = 0;
private _operationPoints = 0;
private _isSuccessfulMission = _unit getVariable "TASK_IsSuccessfulMission";

if (_isSuccessfulMission) then 
{
    _operationPoints = [_unit] call F90_fnc_getUnitOperationPoints;    
    _totalPoints = _totalPoints + _operationPoints;
    [_unit, "Mission is a success"] remoteExec ["sideChat", 0, true];
};
_unit setVariable ["REC_OperationPoints", _operationPoints, true];

private _pointsData = [_unit] call F90_fnc_calculatePoints;
private _deductions = _pointsData select 0;
private _additions = _pointsData select 1;

_totalPoints = _totalPoints + _deductions + _additions;

// Reward player 
private _reward = _totalPoints * 10; 
private _milcashDeduction = 0; 
private _wages = _unit getVariable "REC_TempWages";
_milcashDeduction = _milcashDeduction - _wages;
private _totalRewards = _reward + _milcashDeduction;

if (_reward > 0) then 
{
    ["ADDMONEY", [_unit, _totalRewards]] call F90_fnc_economyHandler;
} else 
{
    if (_reward < 0) then 
    {
        ["DEDUCTMONEY", [_unit, _totalRewards]] call F90_fnc_economyHandler;
    };
};
_unit setVariable ["REC_TotalRewards", _totalRewards, true];
_unit setVariable ["REC_TempRewards", _reward, true];
_unit setVariable ["REC_TotalPoints", _totalPoints, true];

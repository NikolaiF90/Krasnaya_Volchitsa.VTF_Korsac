params ["_unit"];

private _totalDeduction = 0;
private _totalAddition = 0;
private _returnValue = [0, 0];

// Deduction (Points will be shown in report)
private _heliUsed = _unit getVariable "REC_TempHeliUsed";
private _heliUsedDeduction = _heliUsed * Points_HeliUsedDeduction;
_unit setVariable ["REC_HeliUsedDeduction", _heliUsedDeduction, true];

private _lightArmedHeli = _unit getVariable "REC_TempLightArmedHeliLoss";
private _lightArmedHeliDeduction = _lightArmedHeli * Points_LightArmedHeliLoss;
_unit setVariable ["REC_LightArmedHeliDeduction", _lightArmedHeliDeduction, true];

private _lightUnarmedHeli = _unit getVariable "REC_TempLightUnarmedHeliLoss";
private _lightUnarmedHeliDeduction = _lightUnarmedHeli * Points_LightUnarmedHeliLoss;
_unit setVariable ["REC_LightUnarmedHeliDeduction", _lightArmedHeliDeduction, true];

private _attackHeli = _unit getVariable "REC_TempAttackHeliLoss";
private _attackHeliDeduction = _attackHeli * Points_AttackHeliLoss;
_unit setVariable ["REC_AttackHeliDeduction", _attackHeliDeduction, true];

_totalDeduction = _totalDeduction - (_heliUsedDeduction + _lightArmedHeliDeduction + _lightUnarmedHeliDeduction + _attackHeliDeduction);

_returnValue set [0, _totalDeduction];

// Addition (Only counts will be shown in report instead of points)
private _killCount = _unit getVariable "REC_TempKillCount";
private _killPoints = _killCount * Points_ConfirmedKill;

private _capturedPrisoners = _unit getVariable "REC_TempCapturedPrisoners";
private _prisonerPoints = _capturedPrisoners * Points_CapturedPrisoners;

private _hvtKilled = _unit getVariable "REC_TempHVTKilled";
private _hvtKillPoints = _hvtKilled * Points_HVTKill;

private _hvtCaptured = _unit getVariable "REC_TempHVTCaptured";
private _hvtCapturePoints = _hvtCaptured * Points_HVTCapture;

// For seized assets, points will be shown instead of count, since there wont be more than 5 assets per mission
private _seized = _unit getVariable "REC_TempSeized";
private _seizePoints = _seized * Points_Seized;
_unit setVariable ["REC_SeizePoints", _seizePoints, true];

_totalAddition = _totalAddition + _killPoints + _prisonerPoints + _hvtKillPoints + _hvtCapturePoints + _seizePoints;

_returnValue set [1, _totalAddition];

// REC_TempAirSupportUsed = 0;
// REC_TempArtilleryUsed = 0;
// REC_TempVehiclesUsed = 0;

// Casualty check
// Team Casualty
// Transport Casualty
// Civilan Casualty

// Asset used check 
// Air support
// Artillery
// Vehicles

_returnValue
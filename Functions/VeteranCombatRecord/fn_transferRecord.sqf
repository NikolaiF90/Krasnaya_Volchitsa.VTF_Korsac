params ["_unit"];

private _totalConductedMissions = _unit getVariable "Record_TotalConductedMissions";
_totalConductedMissions = _totalConductedMissions + 1;
_unit setVariable ["Record_TotalConductedMissions", _totalConductedMissions];

private _successfulMission = _unit getVariable "TASK_IsSuccessfulMission";
if (_successfulMission) then 
{
    private _totalSuccessfulMissions = _unit getVariable "Record_TotalSuccessfulMissions";
    _totalSuccessfulMissions = _totalSuccessfulMissions + 1;
    _unit setVariable ["Record_TotalSuccessfulMissions", _totalSuccessfulMissions];
};

private _killCount = _unit getVariable "Record_ConfirmedKills";
private _tempKillCount = _unit getVariable "REC_TempKillCount";
_killCount = _killCount + _tempKillCount;
_unit setVariable ["Record_ConfirmedKills", _killCount];

private _hvtKillCount = _unit getVariable "Record_TotalKilledHVT";
private _tempHvtKillCount = _unit getVariable "REC_TempHVTKilled";
_hvtKillCount = _hvtKillCount + _tempHvtKillCount;
_unit setVariable ["Record_TotalKilledHVT", _hvtKillCount];

private _hvtCaptureCount = _unit getVariable "Record_TotalArrestedHVT";
private _tempHvtCaptureCount = _unit getVariable "REC_TempHVTCaptured";
_hvtCaptureCount = _hvtCaptureCount + _tempHvtCaptureCount;
_unit setVariable ["Record_TotalArrestedHVT", _hvtCaptureCount];

// Reset for next mission
[_unit] call F90_fnc_resetTempRecord;
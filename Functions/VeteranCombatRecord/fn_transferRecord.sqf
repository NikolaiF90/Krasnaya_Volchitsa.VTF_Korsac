params ["_unit", "_successfulMission"];

private _totalConductedMissions = _unit getVariable "Record_TotalConductedMissions";
_totalConductedMissions = _totalConductedMissions + 1;
_unit setVariable ["Record_TotalConductedMissions", _totalConductedMissions];

if (_successfulMission) then 
{
    private _totalSuccessfulMissions = _unit getVariable "Record_TotalSuccessfulMissions";
    _totalSuccessfulMissions = _totalSuccessfulMissions + 1;
    _unit setVariable ["Record_TotalSuccessfulMissions", _totalSuccessfulMissions];
};

private _killCount = _unit getVariable "Record_ConfirmedKills";
_killCount = _killCount + VCR_TempKillCount;
_unit setVariable ["Record_ConfirmedKills", _killCount];

// Reset for next mission
[] call F90_fnc_resetTempRecord;
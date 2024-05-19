params ["_unit"];

private _killCount = _unit getVariable "Record_ConfirmedKills";
_killCount = _killCount + VCR_TempKillCount;
_unit setVariable ["Record_ConfirmedKills", _killCount];

// Reset for next mission
[] call F90_fnc_resetTempRecord;
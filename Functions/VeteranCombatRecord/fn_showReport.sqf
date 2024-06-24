private _unit = player;

[_unit] call F90_fnc_reportMission;

private _killCount = _unit getVariable "REC_TempKillCount";
private _capturedPrisoners = _unit getVariable "REC_TempCapturedPrisoners";
private _hvtKilled = _unit getVariable "REC_TempHVTKilled";
private _hvtCaptured = _unit getVariable "REC_TempHVTCaptured";
private _heliUsed = _unit getVariable "REC_HeliUsedDeduction";
private _successfulOperation = _unit getVariable "REC_OperationPoints";
private _seizePoints = _unit getVariable "REC_SeizePoints";
private _totalPoints = _unit getVariable "REC_TotalPoints";
private _wages = _unit getVariable "REC_TempWages";
private _rewards = _unit getVariable "REC_TempRewards";
private _totalRewards = _unit getVariable "REC_TotalRewards";

if (dialog) then 
{
    closeDialog 1;
};

createDialog "dutyReportMenu";

ctrlSetText [REC_TempKillsIDC, format ["Confirmed Kills: %1", _killCount]];
ctrlSetText [REC_TempCapturedPrisonersIDC, format ["Captured Prisoners: %1", _capturedPrisoners]];
ctrlSetText [REC_TempHVTKilledIDC, format ["HVT Killed: %1", _hvtKilled]];
ctrlSetText [REC_TempHVTCapturedIDC, format ["HVT Captured: %1", _hvtCaptured]];
ctrlSetText [REC_TempHelicoptersIDC, format ["Transport Heli: %1pts", _heliUsed]];
ctrlSetText [REC_TempMissionSuccessIDC, format ["Successful Operation: %1pts", _successfulOperation]];
ctrlSetText [REC_TempSeizedIDC, format ["Seized Assets Points: %1pts", _seizePoints]];
ctrlSetText [REC_TempTotalPointsIDC, format ["Total Points: %1pts", _totalPoints]];
ctrlSetText [REC_TempRewardsIDC, format ["Milcash Rewards: %1", _rewards]];
ctrlSetText [REC_TempTotalRewardsIDC, format ["Total Milcash Rewards: %1", _totalRewards]];
ctrlSetText [REC_TempWagesIDC, format ["Subordinate Wages: %1", str (0 - _wages)]];

[_unit] call F90_fnc_transferRecord;
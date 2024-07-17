private _unit = player;

[_unit] call F90_fnc_reportMission;

private _killCount = _unit getVariable "REC_TempKillCount";
private _capturedPrisoners = _unit getVariable "REC_TempCapturedPrisoners";
private _hvtKilled = _unit getVariable "REC_TempHVTKilled";
private _hvtCaptured = _unit getVariable "REC_TempHVTCaptured";
private _heliUsed = _unit getVariable "REC_HeliUsedDeduction";
private _successfulOperation = _unit getVariable "REC_TempOP";
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

// Points Received
private _pointsReceived = 
[
    format ["Confirmed Kills: %1", _killCount],
    format ["Captured Prisoners: %1", _capturedPrisoners],
    format ["HVT Killed: %1", _hvtKilled],
    format ["HVT Captured: %1", _hvtCaptured],
    format ["Successful Operation: %1pts", _successfulOperation],
    format ["Seized Assets Points: %1pts", _seizePoints]
];
[REC_PointsReceivedListBoxIDC, _pointsReceived, -1] call F90_fnc_populateListBox;

// Points Deduction 
private _pointsDeduction = 
[
    format ["Transport Heli: %1pts", _heliUsed]
    // ToDo - Air Supports 
    // ToDo - Artillery 
    // ToDo - Helicopters 
    // ToDo - Vehicles 
];
[REC_PointsDeductedListBoxIDC, _pointsDeduction, -1] call F90_fnc_populateListBox;

// Total 
private _totalEarnings = 
[
    format ["Total Points: %1pts", _totalPoints],
    format ["Milcash Rewards: %1 milcash", _rewards],
    // ToDo - Routine Bonus 
    // ToDo - Operation Bonus 
    // ToDo - Skill Tree Bonus
    format ["Subordinate Wages: %1 milcash", str (0 - _wages)],
    format ["Total Milcash Rewards: %1 milcash", _totalRewards]
];
[REC_TotalEarningListBoxIDC, _totalEarnings, -1] call F90_fnc_populateListBox;

[_unit] call F90_fnc_transferRecord;
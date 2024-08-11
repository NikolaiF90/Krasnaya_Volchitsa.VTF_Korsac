// ToDo - optimize
private _unit = player;

[_unit] call F90_fnc_reportMission;

private _killCount = _unit getVariable "REC_TempKillCount";
private _capturedPrisoners = _unit getVariable "REC_TempCapturedPrisoners";
private _hvtKilled = _unit getVariable "REC_TempHVTKilled";
private _hvtCaptured = _unit getVariable "REC_TempHVTCaptured";
private _heliUsed = _unit getVariable "REC_HeliUsedDeduction";
private _armedCars = _unit getVariable "REC_ArmedCarsDeduction";
private _unarmedCars = _unit getVariable "REC_UnarmedCarsDeduction";
private _tempTeamDeduction = _unit getVariable "REC_TempTeamDeduction";
private _successfulOperation = _unit getVariable "REC_TempOP";
private _seizePoints = _unit getVariable "REC_SeizePoints";
private _skillTreePoints = _unit getVariable ["Skill_IFoundCash", 0];
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
    format ["Seized Assets Points: %1pts", _seizePoints],
    format ["Skill Tree Bonus: %1pts", _skillTreePoints]
];
[REC_PointsReceivedListBoxIDC, _pointsReceived, -1] call F90_fnc_populateListBox;

// Points Deduction 
private _pointsDeduction = 
[
    format ["Transport Heli: %1pts", _heliUsed],
    format ["Armed Cars: %1pts", _armedCars],
    format ["Unarmed Cars: %1pts", _unarmedCars],
    format ["Temporary Teammates: %1pts", _tempTeamDeduction]
    // ToDo - Air Supports 
    // ToDo - Artillery 
    // ToDo - Helicopters 
    
];
[REC_PointsDeductedListBoxIDC, _pointsDeduction, -1] call F90_fnc_populateListBox;

// Total 
private _totalEarnings = 
[
    format ["Total Points: %1pts", _totalPoints],
    format ["Milcash Rewards: %1 milcash", _rewards],
    // ToDo - Routine Bonus 
    // ToDo - Operation Bonus 
    format ["Subordinate Wages: %1 milcash", str (0 - _wages)],
    format ["Total Milcash Rewards: %1 milcash", _totalRewards]
];
[REC_TotalEarningListBoxIDC, _totalEarnings, -1] call F90_fnc_populateListBox;

[_unit] call F90_fnc_transferRecord;

// delete spawned vehicles 
private _spawnedUnarmedCars = _unit getVariable "Support_SpawnedUnarmedVehicles";
private _spawnedArmedCars = _unit getVariable "Support_SpawnedArmedVehicles";
{
    private _vehicle = _x;
    if !(isNil {_vehicle}) then 
    {
        deleteVehicle _vehicle;
    };
} forEach _spawnedArmedCars + _spawnedUnarmedCars;

_unit setVariable ["Support_SpawnedUnarmedVehicles", [], true];
_unit setVariable ["Support_SpawnedArmedVehicles", [], true];
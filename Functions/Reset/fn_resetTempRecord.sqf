params ["_unit"];
// Task Record Variables

private _RECData = 
[
    "REC_TempKillCount",
    "REC_TempCapturedPrisoners",
    "REC_TempHVTKilled",
    "REC_TempHVTCaptured",
    "REC_TempAirSupportUsed",
    "REC_TempArtilleryUsed",

    "REC_TempHeliUsed",
    "REC_TempLightArmedHeliLoss",
    "REC_TempLightUnarmedHeliLoss",
    "REC_TempAttackHeliLoss",

    "REC_TempVehiclesUsed",
    "REC_TempCivilianCasualties",
    "REC_TempTeamCasualties",
    "REC_TempSeized"
];

{
    _unit setVariable [_x, 0, true];
} forEach _RECData;

_unit setVariable ["TASK_IsSuccessfulMission", false, true];
_unit setVariable ["REC_OperationPoints", nil, true];
_unit setVariable ["REC_TempRewards", nil, true];
_unit setVariable ["REC_TotalPoints", nil, true];